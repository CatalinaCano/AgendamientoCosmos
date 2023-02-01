using FxGrupoTramite.Interfaces.RepositoryPattern;
using FxGrupoTramite.Models.DataTransferObjects;
using FxGrupoTramite.Models.Entities;

using Microsoft.Azure.Cosmos;
using Microsoft.Extensions.Configuration;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

using PartitionKey = Microsoft.Azure.Cosmos.PartitionKey;

namespace FxGrupoTramite.Repositories
{
    public class GrupoTramiteRepository : RepositoryBase, IGrupoTramiteRepository
    {
        private readonly Container container;

        public GrupoTramiteRepository(CosmosClient client, IConfiguration configuration)
             : base(client)
        {
            string containerId = configuration["CosmosDB:NombreColeccion"];
            string databaseName = configuration["CosmosDB:NombreBD"];
            container = client.GetContainer(databaseName, containerId);
        }

        public async Task<string> CreateGrupoTramiteAsync(GrupoTramite grupoTramite)
        {
            try
            {
                ItemResponse<GrupoTramite> itemResponse = await container.ReadItemAsync<GrupoTramite>(grupoTramite.Id, new PartitionKey(grupoTramite.Id));
                return itemResponse == null ? "OK" : "Error";
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                var result = await container.CreateItemAsync(grupoTramite, new PartitionKey(grupoTramite.Id));
                if (result.StatusCode.ToString() is "Created")
                    return "Registro Exitoso";
                return "Error";
            }
        }

        public async Task<bool> ExistsGrupoTramiteAsync(string nombreGrupoTramite)
        {
            GrupoTramiteDto data = null;
            try
            {
                var queryString = @"SELECT
	                                gt.id as idGrupoTramite,
	                                gt.grupoTramite
                                   FROM grupoTramite gt
                                   WHERE gt.nombreGrupoTramite=@nombre";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@nombre", nombreGrupoTramite);
                var query = container.GetItemQueryIterator<GrupoTramiteDto>(queryDef);

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

        public async Task<GrupoTramiteDto> GetGrupoTramiteByIdAsync(string idGrupoTramite)
        {
            GrupoTramiteDto grupoServicioDto = null;
            try
            {
                var queryString = @"SELECT
	                                gt.id as idGrupoTramite,
	                                gt.nombreGrupoTramite,
	                                gt.descripcionGrupoTramite,
	                                gt.icono
                                FROM grupoTramite gt
                                WHERE gt.activo=@activo AND gt.id=@idGrupoTramite";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@activo", true);
                queryDef.WithParameter("@idGrupoTramite", idGrupoTramite);

                var query = container.GetItemQueryIterator<GrupoTramiteDto>(queryDef);
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

        public async Task<List<GrupoTramiteDto>> GetGruposTramiteAsync()
        {
            var queryString = @"SELECT
	                                gt.id as idGrupoTramite,
	                                gt.nombreGrupoTramite,
	                                gt.descripcionGrupoTramite,
	                                gt.icono
                                FROM grupoTramite gt
                                WHERE gt.activo=@activo";

            var queryDef = new QueryDefinition(queryString);
            queryDef.WithParameter("@activo", true);

            var query = container.GetItemQueryIterator<GrupoTramiteDto>(queryDef);

            var gruposServicio = new List<GrupoTramiteDto>();

            while (query.HasMoreResults)
            {
                var response = await query.ReadNextAsync();
                gruposServicio.AddRange(response.ToList());
            }

            return gruposServicio;
        }

        public async Task<string> UpsertGrupoTramiteAsync(GrupoTramite grupoTramite, string idGrupoTramite)
        {
            try
            {
                grupoTramite.Id = idGrupoTramite;
                var result = await container.PatchItemAsync<GrupoTramite>(idGrupoTramite, new PartitionKey(idGrupoTramite),
                       new[] { 
                          PatchOperation.Set("/nombreGrupoTramite", grupoTramite.NombreGrupoTramite),
                          PatchOperation.Set("/descripcionGrupoTramite", grupoTramite.DescripcionGrupoTramite),
                          PatchOperation.Set("/icono", grupoTramite.Icono),
                          PatchOperation.Set("/activo", grupoTramite.Activo),
                          PatchOperation.Set("/usuarioModificacion", grupoTramite.UsuarioModificacion),
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