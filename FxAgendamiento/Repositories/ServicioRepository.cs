using FxAgendamiento.Interfaces.RepositoryPattern;
using FxAgendamiento.Models.DataTransferObjects;

using Microsoft.Azure.Cosmos;
using Microsoft.Extensions.Configuration;

using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace FxAgendamiento.Repositories
{
    public class ServicioRepository : RepositoryBase, IServicioRepository
    {
        private readonly Container container;

        public ServicioRepository(CosmosClient client, IConfiguration configuration)
             : base(client)
        {
            string containerId = configuration["CosmosDB:ColeccionServicio"];
            string databaseName = configuration["CosmosDB:NombreBD"];
            container = client.GetContainer(databaseName, containerId);
        }

        public async Task<ServicioDto> ObtenerTiempodeAtencionServicio(string idServicio)
        {
            ServicioDto tiempo = null;
            try
            {
                var queryString = @"SELECT
	                                    s.nombreServicio,
                                        s.tiempoAtencion,
                                        s.tramiteVirtual,
                                        s.tipoPago
                                    FROM servicio s
                                    WHERE s.id=@pkServicio";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@pkServicio", idServicio);

                var query = container.GetItemQueryIterator<ServicioDto>(queryDef);
                while (query.HasMoreResults)
                {
                    var response = await query.ReadNextAsync();
                    tiempo = response.SingleOrDefault();
                }

                return tiempo;
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                return tiempo;
            }
        }
    }
}