using FxMonitorizaCitas.Interfaces.RepositoryPattern;
using FxMonitorizaCitas.Models.DataTransferObjects;
using FxMonitorizaCitas.Models.Entities;
using FxMonitorizaCitas.Utils;

using Microsoft.Azure.Cosmos;
using Microsoft.Azure.Cosmos.Linq;
using Microsoft.Extensions.Configuration;

using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace FxMonitorizaCitas.Repositories
{
    public class TramiteRepository : RepositoryBase, ITramiteRepository
    {
        private readonly Container container;
        public readonly IConfiguration _configuration;

        public TramiteRepository(CosmosClient client, IConfiguration configuration)
             : base(client)
        {
            string containerId = configuration["CosmosDB:ColeccionTramite"];
            string databaseName = configuration["CosmosDB:NombreBD"];
            container = client.GetContainer(databaseName, containerId);
        }

        public async Task<List<TramitesDiaDto>> ObtenerCitasDia()
        {
            string fecha = TimeHelper.ObtenerFechaColombia().ToString("dd/MM/yyyy");
            var citas = new List<TramitesDiaDto>() { };
            try
            {
                var queryString = @$"SELECT
	                                t.id as idUsuario,
	                                tr.pkTramite as idCita,
	                                tr.servicio.fechaAgendamiento,
	                                tr.servicio.horaAgendamiento
                                FROM tramite t
                                JOIN tr IN t.tramites
                                WHERE  tr.activo = true AND
                                tr.servicio.fechaAgendamiento<=@fecha";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@fecha", fecha);

                var query = container.GetItemQueryIterator<TramitesDiaDto>(queryDef);
                while (query.HasMoreResults)
                {
                    var response = await query.ReadNextAsync();
                    citas.AddRange(response.ToList());
                }

                return citas;
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                return citas;
            }
        }

        public async Task<List<CitasDto>> ObtenerCitas(string idUsuario)
        {
            var citas = new List<CitasDto>() { };
            try
            {
                var queryString = @$"SELECT
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
                                WHERE t.id=@idUsuario";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@idUsuario", idUsuario);

                var query = container.GetItemQueryIterator<CitasDto>(queryDef);
                while (query.HasMoreResults)
                {
                    var response = await query.ReadNextAsync();
                    citas.AddRange(response.ToList());
                }

                return citas;
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                return citas;
            }
        }

        public async Task InactivarCita(string idUsuario, string idCita)
        {
            List<CitasDto> citas = await ObtenerCitas(idUsuario);
            int indexTramite = citas.FindIndex(cita => cita.PkTramite.Equals(idCita));
            await container.PatchItemAsync<Agenda>(idUsuario, new PartitionKey(idUsuario),
                new[] {
                     PatchOperation.Set($"/tramites/{indexTramite}/activo", false)
                });
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
    }
}