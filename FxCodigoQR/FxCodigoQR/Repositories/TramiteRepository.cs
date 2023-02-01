using FxCodigoQR.Interfaces.RepositoryPattern;
using FxCodigoQR.Models.DataTransferObjects;
using FxCodigoQR.Models.Entities;

using Microsoft.Azure.Cosmos;
using Microsoft.Azure.Cosmos.Linq;
using Microsoft.Extensions.Configuration;

using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace FxCodigoQR.Repositories
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

        public async Task<CitasDto> ObtenerCita(string idUsuario, string idCita)
        {
            CitasDto data = null;
            try
            {
                var queryString = $@"SELECT
                                        t.id,
                                        tr.activo,
                                        ARRAY_SLICE(tr.estados,-1,1)[0].nombreEstado,
                                        tr.pkTramite,
                                        tr.pkMalla,
                                        tr.pkSede,
                                        tr.pkSubSede,
                                        tr.servicio.pkServicio,
                                        tr.servicio.fechaAgendamiento,
                                        tr.servicio.horaAgendamiento,
                                        tr.servicio.duracionServicio
                                    FROM tramite t
                                    JOIN tr in t.tramites
                                    WHERE t.id=@idUsuario AND
                                    tr.pkTramite=@idTramite";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@idUsuario", idUsuario);
                queryDef.WithParameter("@idTramite", idCita);
                var query = container.GetItemQueryIterator<CitasDto>(queryDef);
                while (query.HasMoreResults)
                {
                    var response = await query.ReadNextAsync();
                    data = response.SingleOrDefault();
                }

                return data;
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                return data;
            }
        }

        public async Task<string> AgregarEstado(string idUsuario, string idTramite, Estado estado)
        {
            var result = container.GetItemLinqQueryable<Agenda>().Where(
                              m => m.Id.Equals(idUsuario)).ToFeedIterator();

            int indiceTramite = -1,
                indiceEstados = -1;

            if (result.HasMoreResults)
            {
                var existingDocuments = await result.ReadNextAsync();

                List<Tramite> tramites = existingDocuments.Resource?.Select(d => d.Tramites).FirstOrDefault();

                indiceTramite = tramites.FindIndex(tr => tr.PkTramite.Equals(idTramite));
                indiceEstados = tramites.ElementAt(indiceTramite).Estados.Count;
            }

            var patchOpts = new List<PatchOperation>
            {
                PatchOperation.Add($"/tramites/{indiceTramite}/estados/{indiceEstados}", estado)
            };

            var resultado = await container.PatchItemAsync<Tramite>(idUsuario, new PartitionKey(idUsuario), patchOpts);
            return resultado.StatusCode.ToString();
        }

        public async Task<EstadoDto> ValidarEstado(string idUsuario, string idTramite, string estado)
        {
            EstadoDto data = null;
            try
            {
                var queryString = $@"SELECT
                                    t.id,
                                    tr.pkTramite,
                                    ARRAY_CONTAINS (tr.estados, {{'nombreEstado':'{estado}'}}, true) as estado
                                    FROM tramite t
                                    JOIN tr IN t.tramites
                                    WHERE t.id=@idUsuario
                                    AND tr.pkTramite=@idTramite";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@idUsuario", idUsuario);
                queryDef.WithParameter("@idTramite", idTramite);

                var query = container.GetItemQueryIterator<EstadoDto>(queryDef);
                while (query.HasMoreResults)
                {
                    var response = await query.ReadNextAsync();
                    data = response.SingleOrDefault();
                }

                return data;
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                return data;
            }
        }
    }
}