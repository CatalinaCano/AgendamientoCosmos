using FxGrupoServicio.Interfaces.RepositoryPattern;

using Microsoft.Azure.Cosmos;
using Microsoft.Extensions.Configuration;

using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace FxGrupoServicio.Repositories
{
    public class GrupoTramiteRepository: RepositoryBase, IGrupoTramiteRepository
    {
        private readonly Container container;

        public GrupoTramiteRepository(CosmosClient client, IConfiguration configuration)
             : base(client)
        {
            string containerId = configuration["CosmosDB:GrupoTramite"];
            string databaseName = configuration["CosmosDB:NombreBD"];
            container = client.GetContainer(databaseName, containerId);
        }


        public async Task<bool> ExistsGrupoTramiteAsync(string idGrupoTramite)
        {
            object data = null;
            try
            {

                var queryString = @"SELECT
	                                gt.id,
	                                gt.nombreGrupoTramite
                                   FROM grupoTramite gt
                                   WHERE gt.id=@idGrupoTramite";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@idGrupoTramite", idGrupoTramite);
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
