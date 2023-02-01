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
    public class TramiteRepository : RepositoryBase, ITramiteRepository
    {
        private readonly Container container;
        public readonly IConfiguration _configuration;

        public TramiteRepository(CosmosClient client, IConfiguration configuration) : base(client)
        {
            _configuration = configuration;
            string containerId = _configuration["CosmosDB:ColeccionTramite"];
            string databaseName = _configuration["CosmosDB:NombreBD"];
            container = client.GetContainer(databaseName, containerId);
        }

        public async Task<List<TramiteDto>> ObtenerTramitesMallas(string idMallas)
        {
            List<TramiteDto> tramites = new() { };
            try
            {
                var queryString = @$"SELECT
	                                        t.id as idUsuario,
	                                        tr.pkTramite,
	                                        tr.fechaRegistro,
	                                        tr.activo,
	                                        ARRAY_SLICE(tr.estados,-1,1)[0].nombreEstado,
                                            tr.servicio.pkServicio,
	                                        tr.servicio.duracionServicio
                                        FROM t
                                        JOIN tr in t.tramites
                                        WHERE tr.pkMalla IN({idMallas})";
                var query = container.GetItemQueryIterator<TramiteDto>(queryString);
                while (query.HasMoreResults)
                {
                    var response = await query.ReadNextAsync();
                    tramites.AddRange(response.ToList());
                }

                return tramites;
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                return tramites;
            }
        }
    }
}