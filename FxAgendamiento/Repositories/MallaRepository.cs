using FxAgendamiento.Interfaces.RepositoryPattern;
using FxAgendamiento.Models.DataTransferObjects;
using FxAgendamiento.Models.Entities;

using Microsoft.Azure.Cosmos;
using Microsoft.Azure.Cosmos.Linq;
using Microsoft.Extensions.Configuration;

using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

using Container = Microsoft.Azure.Cosmos.Container;

namespace FxAgendamiento.Repositories
{
    public class MallaRepository : RepositoryBase, IMallaRepository
    {
        private readonly Container container;

        public MallaRepository(CosmosClient client, IConfiguration configuration)
             : base(client)
        {
            string containerId = configuration["CosmosDB:ColeccionMalla"];
            string databaseName = configuration["CosmosDB:NombreBD"];
            container = client.GetContainer(databaseName, containerId);
        }

        
        public async Task CancelarCita(MallaDto data, string horaInicio, string[] tramites, string idTramite, string idUsuario, bool inactivarAgenda)
        {
            var indices = await ObtenerIndices(data, horaInicio);
            var listOfTramites = tramites.ToList();
            var patchOpts = new List<PatchOperation>();

            var indexTramite = listOfTramites.FindIndex(tramite => tramite.Equals(idTramite));

            string path = $"/mallasPorSubSede/{indices.ElementAt(0)}/tiemposAtencion/{indices.ElementAt(1)}/tiempos/{indices.ElementAt(2)}";

            patchOpts.Add(PatchOperation.Set($"{path}/agendaDisponible", inactivarAgenda));
            patchOpts.Add(PatchOperation.Remove($"{path}/tramites/{indexTramite}"));
            patchOpts.Add(PatchOperation.Add($"{path}/usuariosVetados/{indices.ElementAt(4)}", idUsuario));

            await container.PatchItemAsync<Malla>(data.IdMalla, new PartitionKey(data.IdSede), patchOpts);
        }

        public async Task<bool> ExistMalla(string idMalla)
        {
            dynamic data = null;
            try
            {
                var queryString = @"SELECT
                                     m.id
                                    FROM malla m
                                    WHERE m.id=@idMalla
                                    AND m.activo=@activo";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@idMalla", idMalla);
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

        


        public async Task InactivarTiempos(MallaDto data, string horaInicio, string idUsuario, bool inactivarAgenda)
        {
            var indices = await ObtenerIndices(data, horaInicio);
            var patchOpts = new List<PatchOperation>();

            string path = $"/mallasPorSubSede/{indices.ElementAt(0)}/tiemposAtencion/{indices.ElementAt(1)}/tiempos/{indices.ElementAt(2)}";

            patchOpts.Add(PatchOperation.Set($"{path}/agendaDisponible", inactivarAgenda));
            patchOpts.Add(PatchOperation.Add($"{path}/tramites/{indices.ElementAt(3)}", idUsuario));

            await container.PatchItemAsync<Malla>(data.IdMalla, new PartitionKey(data.IdSede), patchOpts);
        }

        public async Task<List<CancelacionDto>> ObtenerHorasCancelacion(MallaDto data, string idTramite)
        {
            var tiempos = new List<CancelacionDto>() { };
            try
            {
                var queryString = @$"SELECT
	                                t.horaInicio,
	                                t.horaFin,
	                                t.agendaDisponible,
	                                t.cantidadPersonas,
	                                t.tramites
                                FROM malla m
                                JOIN msb in m.mallasPorSubSede
                                JOIN ta in msb.tiemposAtencion
                                JOIN t in ta.tiempos
                                JOIN tr in t.tramites
                                WHERE m.id=@idMalla
                                AND m.pkSede=@idSede
                                AND msb.pkSubSede=@idSubsede
                                AND ta.fecha=@fecha
                                AND CONTAINS(tr, '{idTramite}')";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@idMalla", data.IdMalla);
                queryDef.WithParameter("@idSede", data.IdSede);
                queryDef.WithParameter("@idSubsede", data.IdSubSede);
                queryDef.WithParameter("@fecha", data.Fecha);

                var query = container.GetItemQueryIterator<CancelacionDto>(queryDef);
                while (query.HasMoreResults)
                {
                    var response = await query.ReadNextAsync();
                    tiempos.AddRange(response.ToList());
                }

                return tiempos;
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                return tiempos;
            }
        }

        public async Task<List<int>> ObtenerIndices(MallaDto data, string hora)
        {
            var indices = new List<int>();
            try
            {
                var result = container.GetItemLinqQueryable<Malla>().Where(
                m => m.PkSede.Equals(data.IdSede) &&
                m.Id.Equals(data.IdMalla) &&
                m.Activo
                ).ToFeedIterator();

                if (result.HasMoreResults)
                {
                    var existingDocuments = await result.ReadNextAsync();
                    List<MallasPorSubSede> listSubsedes = existingDocuments.Resource?.Select(d => d.MallasPorSubSede).FirstOrDefault();

                    int indiceSubSede = listSubsedes.FindIndex(subsede => subsede.PkSubSede.Equals(data.IdSubSede));
                    MallasPorSubSede subsede = listSubsedes.ElementAt(indiceSubSede);

                    int indiceTiemposAtencion = subsede.TiemposAtencion.FindIndex(ta => ta.Fecha.Equals(data.Fecha));
                    TiemposAtencion tiempoAtencion = subsede.TiemposAtencion.ElementAt(indiceTiemposAtencion);

                    int indiceHora = tiempoAtencion.Tiempos.FindIndex(t => t.HoraInicio.Equals(hora));

                    Tiempo tiempo = tiempoAtencion.Tiempos[indiceHora];

                    indices.Add(indiceSubSede);
                    indices.Add(indiceTiemposAtencion);
                    indices.Add(indiceHora);
                    indices.Add(tiempo.Tramites.Length);
                    indices.Add(tiempo.UsuariosVetados.Length);
                }

                return indices;
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                return indices;
            }
        }

        public async Task<List<TiempoDto>> ValidarEspacio(string idMalla, string idSede, string idSubsede, string fecha)
        {
            var tiempos = new List<TiempoDto>() { };
            try
            {
                var queryString = @$"SELECT 
                                        t.horaInicio,
                                        t.agendaDisponible,
                                        t.usuariosVetados
                                     FROM m
                                     JOIN msb IN m.mallasPorSubSede
                                     JOIN ta IN msb.tiemposAtencion
                                     JOIN t IN ta.tiempos
                                     WHERE m.id=@idMalla
                                     AND m.pkSede=@idSede
                                     AND msb.pkSubSede=@idSubSede
                                     AND ta.fecha=@fecha";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@idMalla", idMalla);
                queryDef.WithParameter("@idSede", idSede);
                queryDef.WithParameter("@idSubSede", idSubsede);
                queryDef.WithParameter("@fecha", fecha);

                var query = container.GetItemQueryIterator<TiempoDto>(queryDef);
                while (query.HasMoreResults)
                {
                    var response = await query.ReadNextAsync();
                    tiempos.AddRange(response.ToList());
                }

                return tiempos;
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                return tiempos;
            }
        }

        public async Task<List<TramiteDto>> ValidarTiempos(MallaDto data, string[] horas)
        {
            var tiempos = new List<TramiteDto>() { };
            try
            {
                var queryString = @$"SELECT
	                                    h.horaInicio,
	                                    h.horaFin,
	                                    h.agendaDisponible,
	                                    h.cantidadPersonas,
	                                    h.tramites
                                    FROM malla m
                                    JOIN msb IN m.mallasPorSubSede
                                    JOIN ta IN msb.tiemposAtencion
                                    JOIN h IN ta.tiempos
                                    WHERE m.id=@idMalla
                                    AND m.pkSede=@idSede
                                    AND msb.pkSubSede=@idSubsede
                                    AND ta.fecha=@fecha
                                    AND h.horaInicio IN ({string.Join(",", horas)})";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@idMalla", data.IdMalla);
                queryDef.WithParameter("@idSede", data.IdSede);
                queryDef.WithParameter("@idSubsede", data.IdSubSede);
                queryDef.WithParameter("@fecha", data.Fecha);

                var query = container.GetItemQueryIterator<TramiteDto>(queryDef);
                while (query.HasMoreResults)
                {
                    var response = await query.ReadNextAsync();
                    tiempos.AddRange(response.ToList());
                }

                return tiempos;
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                return tiempos;
            }
        }


    }
}