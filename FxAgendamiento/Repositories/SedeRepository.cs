using FxAgendamiento.Interfaces.RepositoryPattern;
using FxAgendamiento.Models.DataTransferObjects;

using Microsoft.Azure.Cosmos;
using Microsoft.Extensions.Configuration;

using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace FxAgendamiento.Repositories
{
    internal class SedeRepository : RepositoryBase, ISedeRepository
    {
        private readonly Container container;

        public SedeRepository(CosmosClient client, IConfiguration configuration)
             : base(client)
        {
            string containerId = configuration["CosmosDB:ColeccionSede"];
            string databaseName = configuration["CosmosDB:NombreBD"];
            container = client.GetContainer(databaseName, containerId);
        }


        public async Task<bool> ExisteSede(string idSede)
        {
            dynamic data = null;
            try
            {
                var queryString = @"SELECT
                                     s.id
                                    FROM Sede s
                                    WHERE s.id=@pkSede
                                    AND s.activo=@activo";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@pkSede", idSede);
                queryDef.WithParameter("@activo", true);

                var query = container.GetItemQueryIterator<dynamic>(queryDef);
                while (query.HasMoreResults)
                {
                    var response = await query.ReadNextAsync();
                    data = response.SingleOrDefault();
                }

                return data != null;
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                return false;
            }
        }

        public async Task<bool> ExisteSubSede(string idSede ,string idSubSede)
        {
            dynamic data = null;
            try
            {
                var queryString = @"SELECT 
	                                s.id,
	                                sb.idSubSede
                                FROM s
                                JOIN sb IN s.subSedes
                                WHERE s.id=@idSede AND s.activo=@activo AND
                                sb.idSubSede=@idSubSede AND sb.activo=@activo";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@idSede", idSede);
                queryDef.WithParameter("@idSubSede", idSubSede);
                queryDef.WithParameter("@activo", true);

                var query = container.GetItemQueryIterator<dynamic>(queryDef);
                while (query.HasMoreResults)
                {
                    var response = await query.ReadNextAsync();
                    data = response.SingleOrDefault();
                }

                return data != null;
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                return false;
            }
        }
        public async Task<SedeDto> ObtenerDatosSede(string idSede, string idSubsede)
        {
            SedeDto sede = null;
            try
            {
                var queryString = @"SELECT
	                                s.nombreSede,
	                                s.direccion,
	                                sb.nombreSubSede,
	                                sb.intervaloAtencion
                                FROM sede s
                                JOIN sb IN s.subSedes
                                WHERE s.id=@pkSede
                                AND sb.idSubSede=@pkSubSede";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@pkSede", idSede);
                queryDef.WithParameter("@pkSubSede", idSubsede);

                var query = container.GetItemQueryIterator<SedeDto>(queryDef);
                while (query.HasMoreResults)
                {
                    var response = await query.ReadNextAsync();
                    sede = response.SingleOrDefault();
                }

                return sede;
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                return sede;
            }
        }
    }
}