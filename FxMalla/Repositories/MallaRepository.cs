using FxMalla.Interfaces.RepositoryPattern;
using FxMalla.Models.DataTransferObjects;
using FxMalla.Models.Entities;
using FxMalla.Models.Input;
using FxMalla.Utils;

using Microsoft.Azure.Cosmos;
using Microsoft.Azure.Cosmos.Linq;
using Microsoft.Extensions.Configuration;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

using Container = Microsoft.Azure.Cosmos.Container;

namespace FxMalla.Repositories
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

        public async Task<string> InsertarMallaAsync(Malla malla)
        {
            try
            {
                ItemResponse<Malla> itemResponse = await container.ReadItemAsync<Malla>(malla.Id, new PartitionKey(malla.PkSede));
                return itemResponse.StatusCode.ToString();
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                await container.CreateItemAsync(malla, new PartitionKey(malla.PkSede));

                return "Registro Exitoso";
            }
        }

        public async Task InactivarMallas(string idSede, string idMalla, string usuario)
        {
            var result = container.GetItemLinqQueryable<Malla>().Where(
                m => m.PkSede.Equals(idSede) &&
                m.Id != idMalla &&
                m.Activo
            ).ToFeedIterator();

            if (result.HasMoreResults)
            {
                var existingDocuments = await result.ReadNextAsync();
                var filteredList = existingDocuments?.Resource.Where(x => TimeHelper.FechaActiva(x.FechaFin)).ToList();

                filteredList?.ForEach(document =>
                        {
                            var partitionKey = new PartitionKey(document.PkSede);
                            container.PatchItemAsync<Malla>(
                            id: document.Id,
                            partitionKey: partitionKey,
                            patchOperations: new[] {
                                PatchOperation.Set("/activo", false),
                                PatchOperation.Set("/fechaModificacion", DateTimeOffset.UtcNow),
                                PatchOperation.Set("/usuarioModificacion", usuario)
                        });
                        });
            }
        }

        public async Task<List<MallaDto>> ValidarMalla(string idSede)
        {
            var mallas = new List<MallaDto>() { };
            try
            {
                var queryString = @"SELECT
	                                m.fechaInicio as FechaInicio,
	                                m.fechaFin as FechaFin
                                FROM malla m
                                WHERE m.pkSede=@pkSede
                                AND m.activo=@activo";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@pkSede", idSede);
                queryDef.WithParameter("@activo", true);

                var query = container.GetItemQueryIterator<MallaDto>(queryDef);
                while (query.HasMoreResults)
                {
                    var response = await query.ReadNextAsync();
                    mallas.AddRange(response.ToList());
                }

                return mallas;
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                return mallas;
            }
        }

        public async Task<List<TiempoMallaDto>> ObtenerTiempos(string idSede, string fechaAgenda, string idUsuario)
        {
            var tiempos = new List<TiempoMallaDto>() { };
            try
            {
                var queryString = $@"SELECT
                                      m.id as idMalla,
                                      m.pkSede as idSede,
                                      sb.pkSubSede as idSubSede,
                                      ta.fecha,
                                      t.horaInicio,
                                      ARRAY_CONTAINS (t.usuariosVetados, '{idUsuario}', true) as usuarioVetado
                                    FROM malla m
                                    JOIN sb IN m.mallasPorSubSede
                                    JOIN ta IN sb.tiemposAtencion
                                    JOIN t IN ta.tiempos
                                    WHERE m.pkSede=@pkSede
                                    AND m.activo=@activo
                                    AND ta.fecha=@fechaAgenda
                                    AND t.agendaDisponible = @activo";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@pkSede", idSede);
                queryDef.WithParameter("@fechaAgenda", fechaAgenda);
                queryDef.WithParameter("@activo", true);

                var query = container.GetItemQueryIterator<TiempoMallaDto>(queryDef);
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

        public async Task<List<DiasDto>> ObtenerDiasDisponibles(string idSede)
        {
            var dias = new List<DiasDto>() { };
            try
            {
                var queryString = $@"SELECT
                                    msb.pkSubSede AS PkSubSede,
                                    ta.fecha AS Fecha
                                    FROM malla m
                                    JOIN msb IN m.mallasPorSubSede
                                    JOIN ta IN msb.tiemposAtencion
                                    WHERE m.pkSede=@idSede
                                    AND m.activo=true
                                    AND ARRAY_CONTAINS (ta.tiempos, {{'agendaDisponible':true}}, true)";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@idSede", idSede);

                var query = container.GetItemQueryIterator<DiasDto>(queryDef);
                while (query.HasMoreResults)
                {
                    var response = await query.ReadNextAsync();
                    dias.AddRange(response.ToList());
                }

                return dias;
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                return dias;
            }
        }

        public async Task<List<Malla>> ObtenerMallaporID(string idMalla)
        {
            List<Malla> malla = new() { };
            try
            {
                var queryString = @"SELECT *
                                   FROM malla m
                                   WHERE m.id=@idMalla";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@idMalla", idMalla);

                var query = container.GetItemQueryIterator<Malla>(queryDef);
                while (query.HasMoreResults)
                {
                    var response = await query.ReadNextAsync();
                    malla.AddRange(response.ToList());
                }

                return malla;
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                return malla;
            }
        }


        public async Task<List<Malla>> ObtenerMallaporFecha(FechaInput fecha)
        {
            List<Malla> malla = new() { };
            try
            {
                var queryString = @"SELECT * 
                                          FROM malla m
                                        WHERE m.fechaInicio>=@fechaInicio
                                        AND m.fechaInicio <=@fechaFin";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@fechaInicio", fecha.FechaInicio);
                queryDef.WithParameter("@fechaFin", fecha.FechaFin);

                var query = container.GetItemQueryIterator<Malla>(queryDef);
                while (query.HasMoreResults)
                {
                    var response = await query.ReadNextAsync();
                    malla.AddRange(response.ToList());
                }

                return malla;
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                return malla;
            }
        }
    }
}