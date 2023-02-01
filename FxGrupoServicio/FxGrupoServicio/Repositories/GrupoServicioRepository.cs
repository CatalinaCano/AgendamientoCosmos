using FxGrupoServicio.Interfaces.RepositoryPattern;
using FxGrupoServicio.Models.DataTransferObjects;
using FxGrupoServicio.Models.Entities;

using Microsoft.Azure.Cosmos;
using Microsoft.Extensions.Configuration;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

using PartitionKey = Microsoft.Azure.Cosmos.PartitionKey;

namespace FxGrupoServicio.Repositories
{
    public class GrupoServicioRepository : RepositoryBase, IGrupoServicioRepository
    {
        private readonly Container container;

        public GrupoServicioRepository(CosmosClient client, IConfiguration configuration)
             : base(client)
        {
            string containerId = configuration["CosmosDB:GrupoServicio"];
            string databaseName = configuration["CosmosDB:NombreBD"];
            container = client.GetContainer(databaseName, containerId);
        }

        public async Task<string> CreateGrupoServicioAsync(GrupoServicio grupoServicio)
        {
            try
            {
                ItemResponse<GrupoServicio> itemResponse = await container.ReadItemAsync<GrupoServicio>(grupoServicio.Id, new PartitionKey(grupoServicio.PkGrupoTramite));
                return itemResponse == null ? "OK" : "Error";
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                var result = await container.CreateItemAsync(grupoServicio, new PartitionKey(grupoServicio.PkGrupoTramite));
                if (result.StatusCode.ToString() is "Created")
                    return "Registro Exitoso";
                return "Error";
            }
        }

        public async Task<bool> ExistsGrupoServicioAsync(string nombreGrupoServicio)
        {
            GrupoServicioDto data = null;
            try
            {
               
                var queryString = @"SELECT
	                                gs.id as idGrupoServicio,
	                                gs.nombreGrupoServicio
                                   FROM grupoServicio gs
                                   WHERE gs.nombreGrupoServicio=@nombre";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@nombre", nombreGrupoServicio);
                var query = container.GetItemQueryIterator<GrupoServicioDto>(queryDef);
                
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

        public async Task<GrupoServicioDto> GetGrupoServicioByIdAsync(string idGrupoServicio)
        {
            GrupoServicioDto grupoServicioDto = null;
            try
            {
                var queryString = @"SELECT
	                                gs.pkGrupoTramite as idGrupoTramite,
	                                gs.id as idGrupoServicio,
	                                gs.nombreGrupoServicio,
                                    gs.descripcionGrupoServicio
                                   FROM grupoServicio gs
                                   WHERE gs.activo=@activo AND gs.id=@idGrupoServicio";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@activo", true);
                queryDef.WithParameter("@idGrupoServicio", idGrupoServicio);

                var query = container.GetItemQueryIterator<GrupoServicioDto>(queryDef);
                while (query.HasMoreResults)
                {
                    var response = await query.ReadNextAsync();
                    grupoServicioDto = response.SingleOrDefault();
                }

                return grupoServicioDto;
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                return grupoServicioDto;
            }
        }


        public async Task<List<GrupoServicioDto>> GetGrupoServicioByGrupoTramiteAsync(string idGrupoTramite)
        {
            var queryString = @"SELECT
                                    gs.pkGrupoTramite as idGrupoTramite,
	                                gs.id as idGrupoServicio,
	                                gs.nombreGrupoServicio,
                                    gs.descripcionGrupoServicio
                                FROM grupoServicio gs
                                WHERE gs.activo=@activo AND gs.pkGrupoTramite=@idGrupoTramite";

            var queryDef = new QueryDefinition(queryString);
            queryDef.WithParameter("@idGrupoTramite", idGrupoTramite);
            queryDef.WithParameter("@activo", true);

            var query = container.GetItemQueryIterator<GrupoServicioDto>(queryDef);

            var gruposServicio = new List<GrupoServicioDto>();

            while (query.HasMoreResults)
            {
                var response = await query.ReadNextAsync();
                gruposServicio.AddRange(response.ToList());
            }

            return gruposServicio;
        }


        public async Task<List<GrupoServicioDto>> GetGruposServicioAsync()
        {
            var queryString = @"SELECT
                                    gs.pkGrupoTramite as idGrupoTramite,
	                                gs.id as idGrupoServicio,
	                                gs.nombreGrupoServicio,
                                    gs.descripcionGrupoServicio
                                FROM grupoServicio gs
                                WHERE gs.activo=@activo";

            var queryDef = new QueryDefinition(queryString);
            queryDef.WithParameter("@activo", true);

            var query = container.GetItemQueryIterator<GrupoServicioDto>(queryDef);

            var gruposServicio = new List<GrupoServicioDto>();

            while (query.HasMoreResults)
            {
                var response = await query.ReadNextAsync();
                gruposServicio.AddRange(response.ToList());
            }

            return gruposServicio;
        }

        public async Task<string> UpsertGrupoServicioAsync(GrupoServicio grupoServicio, string idGrupoServicio)
        {
            try
            {
               grupoServicio.Id = idGrupoServicio;
               var result= await container.PatchItemAsync<GrupoServicio>(idGrupoServicio, new PartitionKey(grupoServicio.PkGrupoTramite),
                      new[] { PatchOperation.Set("/nombreGrupoServicio", grupoServicio.NombreGrupoServicio),
                          PatchOperation.Set("/descripcionGrupoServicio", grupoServicio.DescripcionGrupoServicio),
                          PatchOperation.Set("/activo", grupoServicio.Activo),
                          PatchOperation.Set("/usuarioModificacion", grupoServicio.UsuarioModificacion),
                          PatchOperation.Set("/fechaModificacion", DateTimeOffset.UtcNow) });
                return result.StatusCode.ToString();
            }
            catch (Exception ex)
            {

                return ex.Message;
            }
           
        }
    }
}