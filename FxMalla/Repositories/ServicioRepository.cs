using FxMalla.Interfaces.RepositoryPattern;
using FxMalla.Models.DataTransferObjects;

using Microsoft.Azure.Cosmos;
using Microsoft.Extensions.Configuration;

using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace FxMalla.Repositories
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

        public async Task<bool> ExisteServicio(string idServicio)
        {
            dynamic data = null;
            try
            {
                var queryString = @"SELECT s.id
                                    FROM s
                                    WHERE s.id=@idServicio
                                    AND s.activo=@activo";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@idServicio", idServicio);
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

        public async Task<List<ServicioDataDto>> ObtenerTiempodeAtencionServicio(string idServicios)
        {
            List<ServicioDataDto> servicios = new() { };
            try
            {
                var queryString = $@"SELECT
	                                    s.id as idServicio,
                                        s.nombreServicio,
                                        s.tiempoAtencion,
                                        s.tramiteVirtual,
                                        s.tipoPago
                                    FROM servicio s
                                    WHERE s.id IN ({idServicios})";
                var query = container.GetItemQueryIterator<ServicioDataDto>(queryString);
                while (query.HasMoreResults)
                {
                    FeedResponse<ServicioDataDto> response = await query.ReadNextAsync();
                    servicios.AddRange(response.ToList());
                }
                return servicios;
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                return servicios;
            }
        }
    }
}