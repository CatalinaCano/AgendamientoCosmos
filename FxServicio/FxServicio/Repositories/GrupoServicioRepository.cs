using FxServicio.Interfaces.RepositoryPattern;
using FxServicio.Models.Entities;

using Microsoft.Azure.Cosmos;
using Microsoft.Extensions.Configuration;

using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace FxServicio.Repositories
{
    public class GrupoServicioRepository:RepositoryBase, IGrupoServicioRepository
    {
        private readonly Container container;

        public GrupoServicioRepository(CosmosClient client, IConfiguration configuration)
           : base(client)
        {
            string containerId = configuration["CosmosDB:GrupoServicio"];
            string databaseName = configuration["CosmosDB:NombreBD"];
            container = client.GetContainer(databaseName, containerId);
        }

        public async Task<bool> ExistsGrupoServicio(string idGrupoServicio)
        {

            object data = null;
            try
            {

                var queryString = @"SELECT
	                                gs.id,
                                    gs.pkGrupoTramite,
	                                gs.nombreGrupoServicio,
                                    gs.descripcionGrupoServicio
                                FROM grupoServicio gs
                                WHERE gs.id=@idGrupoServicio";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@idGrupoServicio", idGrupoServicio);
                var query = container.GetItemQueryIterator<object>(queryDef);

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
    }
}
