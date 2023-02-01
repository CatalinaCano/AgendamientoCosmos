using FxAgendamiento.Interfaces.RepositoryPattern;
using FxAgendamiento.Models.DataTransferObjects;
using FxAgendamiento.Models.Entities;
using FxAgendamiento.Utils;

using Microsoft.Azure.Cosmos;
using Microsoft.Azure.Cosmos.Linq;
using Microsoft.Extensions.Configuration;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

using Container = Microsoft.Azure.Cosmos.Container;

namespace FxAgendamiento.Repositories
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

            if (!estado.NombreEstado.Equals(_configuration["Estados:Notificacion"]))
                await InactivarCita(idUsuario, idTramite);

            return resultado.StatusCode.ToString();
        }

        public async Task CrearTramite(Agenda tramite)
        {
            try
            {
                ItemResponse<Agenda> itemResponse = await container.ReadItemAsync<Agenda>(tramite.Id, new PartitionKey(tramite.Id));
                await container.PatchItemAsync<Agenda>(tramite.Id, new PartitionKey(tramite.Id),

                 new[] {
                     PatchOperation.Add($"/tramites/{itemResponse.Resource.Tramites.Count}", tramite.Tramites[0])
                 });
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                await container.CreateItemAsync(tramite, new PartitionKey(tramite.Id));
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

        public async Task<SolicitudesDto> ValidarCantidadSolicitudes(string idUsuario)
        {
            SolicitudesDto cantidad = null;
            try
            {
                var queryString = $@"SELECT
                                    COUNT(tr.pkTramite) as CantidadSolicitudes
                                    FROM tramite t
                                    JOIN tr in t.tramites
                                    WHERE t.id=@idUsuario
                                    AND  tr.fechaRegistro >='{DateTime.Today:yyyy-MM-ddTHH:mm:ss.fffffffZ}'
                                    AND tr.fechaRegistro<='{DateTime.Today.AddDays(1):yyyy-MM-ddTHH:mm:ss.fffffffZ}'";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@idUsuario", idUsuario);

                var query = container.GetItemQueryIterator<SolicitudesDto>(queryDef);
                while (query.HasMoreResults)
                {
                    var response = await query.ReadNextAsync();
                    cantidad = response.SingleOrDefault();
                }

                return cantidad;
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                return cantidad;
            }
        }

        public async Task<ValidarTramiteDto> ValidarServicioActivo(string idUsuario, string idServicio)
        {
            ValidarTramiteDto tramite = null;
            try
            {
                var queryString = @"SELECT
                                    t.id,
                                    tr.pkTramite,
                                    tr.servicio.pkServicio
                                    FROM tramite t
                                    JOIN tr in t.tramites
                                    WHERE t.id=@idUsuario
                                    AND tr.activo=@activo
                                    AND tr.servicio.pkServicio=@idServicio";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@idUsuario", idUsuario);
                queryDef.WithParameter("@activo", true);
                queryDef.WithParameter("@idServicio", idServicio);

                var query = container.GetItemQueryIterator<ValidarTramiteDto>(queryDef);
                while (query.HasMoreResults)
                {
                    var response = await query.ReadNextAsync();
                    tramite = response.SingleOrDefault();
                }

                return tramite;
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                return tramite;
            }
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

        public async Task InactivarCita(string idUsuario, string idCita)
        {
            List<CitasDto> citas = await ObtenerCitas(idUsuario);
            int indexTramite = citas.FindIndex(cita => cita.PkTramite.Equals(idCita));
            await container.PatchItemAsync<Agenda>(idUsuario, new PartitionKey(idUsuario),
                new[] {
                     PatchOperation.Set($"/tramites/{indexTramite}/activo", false)
                });
        }

        public async Task<List<CitasDto>> ObtenerCitasPorDia(string idUsuario)
        {
            var citas = new List<CitasDto>() { };
            string estado = _configuration["Estados:EnEspera"];
            string fecha = TimeHelper.ObtenerFechaColombia().ToString("dd/MM/yyyy");
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
                                    WHERE t.id=@idUsuario
                                    AND  tr.servicio.fechaAgendamiento=@fecha AND tr.activo=@activo
                                    AND ARRAY_CONTAINS (tr.estados, {{'nombreEstado':'{estado}'}}, true)=false";


                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@idUsuario", idUsuario);
                queryDef.WithParameter("@fecha", fecha);
                queryDef.WithParameter("@activo", true);
                queryDef.WithParameter("@estado", estado);
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

        public async Task<List<TramiteEnEsperaDto>> ListarTramitesEnEspera(string idSede, string idSubSede)
        {
            var tramitesEnEspera = new List<TramiteEnEsperaDto>() { };
            string estado = _configuration["Estados:EnEspera"];
            string fecha = TimeHelper.ObtenerFechaColombia().ToString("dd/MM/yyyy");
            try
            {
                var queryString = $@"SELECT
                                        t.id as idUsuario,
	                                    tr.servicio.pkServicio as idServicio,
	                                    tr.servicio.fechaAgendamiento,
	                                    tr.servicio.horaAgendamiento,
	                                    tr.servicio.duracionServicio
                                    FROM tramite t
                                    JOIN tr in t.tramites
                                    WHERE tr.pkSede=@idSede
                                    AND tr.pkSubSede=@idSubSede
                                    AND  tr.servicio.fechaAgendamiento =@fecha AND tr.activo=@activo
                                    AND ARRAY_CONTAINS (tr.estados, {{'nombreEstado':'{estado}'}}, true)";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@idSede", idSede);
                queryDef.WithParameter("@idSubSede", idSubSede);
                queryDef.WithParameter("@fecha", fecha);
                queryDef.WithParameter("@activo", true);
                var query = container.GetItemQueryIterator<TramiteEnEsperaDto>(queryDef);
                while (query.HasMoreResults)
                {
                    var response = await query.ReadNextAsync();
                    tramitesEnEspera.AddRange(response.ToList());
                }

                return tramitesEnEspera;
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                return tramitesEnEspera;
            }
        }
    }
}