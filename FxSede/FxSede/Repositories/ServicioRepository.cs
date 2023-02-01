using FxSede.Interfaces.RepositoryPattern;
using FxSede.Models.DataTransferObjects;

using Microsoft.Azure.Cosmos;
using Microsoft.Extensions.Configuration;

using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace FxSede.Repositories
{
    public class ServicioRepository : RepositoryBase, IServicioRepository
    {
        private readonly Container container;

        public ServicioRepository(CosmosClient client, IConfiguration configuration)
             : base(client)
        {
            string containerId = configuration["CosmosDB:Servicio"];
            string databaseName = configuration["CosmosDB:NombreBD"];
            container = client.GetContainer(databaseName, containerId);
        }

        public async Task<bool> GetServicioByIdAsync(string idServicio)
        {
            ServicioDto servicioDto = null;
            try
            {
                var queryString = @"SELECT
	                                s.id as idServicio,
                                    1 as prioridad
                                FROM servicio s
                                WHERE s.activo=@activo AND s.id=@idServicio";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@activo", true);
                queryDef.WithParameter("@idServicio", idServicio);

                var query = container.GetItemQueryIterator<ServicioDto>(queryDef);
                while (query.HasMoreResults)
                {
                    var response = await query.ReadNextAsync();
                    servicioDto = response.SingleOrDefault();
                }

                return servicioDto != null;
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                return false;
            }
        }
    }
}