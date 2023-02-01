using FxServicio.Interfaces.RepositoryPattern;
using FxServicio.Models.DataTransferObjects;
using FxServicio.Models.Entities;

using Microsoft.Azure.Cosmos;
using Microsoft.Extensions.Configuration;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

using PartitionKey = Microsoft.Azure.Cosmos.PartitionKey;

namespace FxServicio.Repositories
{
    public class ServicioRepository : RepositoryBase, IServicioRepository
    {
        private readonly Container container;

        public ServicioRepository(CosmosClient client, IConfiguration configuration)
             : base(client)
        {
            string containerId = configuration["CosmosDB:Servicio"];
            string databaseName = configuration["CosmosDB:NombreBD"];
            container = client.GetContainer(databaseName, containerId);
        }

        public async Task<string> CreateServicioAsync(Servicio servicio)
        {
            try
            {
                ItemResponse<Servicio> itemResponse = await container.ReadItemAsync<Servicio>(servicio.Id, new PartitionKey(servicio.PkGrupoServicio));
                return itemResponse == null ? "OK" : "Error";
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                var result =  await container.CreateItemAsync(servicio, new PartitionKey(servicio.PkGrupoServicio));
                if (result.StatusCode.ToString() is "Created")
                    return "Registro Exitoso";
                return "Error";
            }            
        }

        public async Task<bool> ExistsServicioAsync(string nombreServicio)
        {
            ServicioDto data = null;
            try
            {

                var queryString = @"SELECT
	                                s.id as idServicio,
                                    s.pkGrupoServicio as idGrupoServicio,
	                                s.nombreServicio,
                                    s.descripcionServicio,
                                    s.tiempoAtencion as tiempo,
                                    s.numeroPersonasAtencion as numeroPersonas,
                                    s.tramiteVirtual,
                                    s.tramitePresencial,
                                    s.tipoPago
                                FROM servicio s
                                WHERE s.nombreServicio=@nombre";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@nombre", nombreServicio);
                var query = container.GetItemQueryIterator<ServicioDto>(queryDef);

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

        public async Task<ServicioDto> GetServicioByIdAsync(string idServicio)
        {
            ServicioDto servicioDto = null;
            try
            {
                var queryString = @"SELECT
	                                s.id as idServicio,
                                    s.pkGrupoServicio as idGrupoServicio,
	                                s.nombreServicio,
                                    s.descripcionServicio,
                                    s.tiempoAtencion as tiempo,
                                    s.numeroPersonasAtencion as numeroPersonas,
                                    s.tramiteVirtual,
                                    s.tramitePresencial,
                                    s.tipoPago
                                FROM servicio s
                                WHERE s.activo=@activo AND s.id=@idServicio";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@activo", true);
                queryDef.WithParameter("@idServicio", idServicio);

                var query = container.GetItemQueryIterator<ServicioDto>(queryDef);
                while (query.HasMoreResults)
                {
                    var response = await query.ReadNextAsync();
                    servicioDto = response.SingleOrDefault();
                }

                return servicioDto;
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                return servicioDto;
            }
        }

        public async Task<List<ServicioDto>> GetServicioByIdGrupoServicioAsync(string idGrupoServicio)
        {
            var queryString = @"SELECT
	                                s.id as idServicio,
                                    s.pkGrupoServicio as idGrupoServicio,
	                                s.nombreServicio,
                                    s.descripcionServicio,
                                    s.tiempoAtencion as tiempo,
                                    s.numeroPersonasAtencion as numeroPersonas,
                                    s.tramiteVirtual,
                                    s.tramitePresencial,
                                    s.tipoPago
                                FROM servicio s
                                WHERE s.activo=@activo AND s.pkGrupoServicio=@idGrupoServicio";

            var queryDef = new QueryDefinition(queryString);
            queryDef.WithParameter("@idGrupoServicio", idGrupoServicio);
            queryDef.WithParameter("@activo", true);

            var query = container.GetItemQueryIterator<ServicioDto>(queryDef);

            var servicios = new List<ServicioDto>();

            while (query.HasMoreResults)
            {
                var response = await query.ReadNextAsync();
                servicios.AddRange(response.ToList());
            }

            return servicios;
        }

        public async Task<List<ServicioDto>> GetServiciosAsync()
        {
            var queryString = @"SELECT
	                                s.id as idServicio,
                                    s.pkGrupoServicio as idGrupoServicio,
	                                s.nombreServicio,
                                    s.descripcionServicio,
                                    s.tiempoAtencion as tiempo,
                                    s.numeroPersonasAtencion as numeroPersonas,
                                    s.tramiteVirtual,
                                    s.tramitePresencial,
                                    s.tipoPago
                                FROM servicio s
                                WHERE s.activo=@activo";

            var queryDef = new QueryDefinition(queryString);
            queryDef.WithParameter("@activo", true);

            var query = container.GetItemQueryIterator<ServicioDto>(queryDef);

            var servicios = new List<ServicioDto>();

            while (query.HasMoreResults)
            {
                var response = await query.ReadNextAsync();
                servicios.AddRange(response.ToList());
            }

            return servicios;
        }

        public async Task UpsertServicioAsync(Servicio servicio, string idServicio)
        {
            servicio.Id = idServicio;
            servicio.FechaModificacion = DateTimeOffset.UtcNow;
            await container.PatchItemAsync<Servicio>(idServicio, new PartitionKey(servicio.PkGrupoServicio),
                  new[] {
                          PatchOperation.Set("/nombreServicio", servicio.NombreServicio),
                          PatchOperation.Set("/descripcionServicio", servicio.DescripcionServicio),
                          PatchOperation.Set("/tiempoAtencion", servicio.TiempoAtencion),
                          PatchOperation.Set("/numeroPersonasAtencion", servicio.NumeroPersonasAtencion),
                          PatchOperation.Set("/tramiteVirtual", servicio.TramiteVirtual),
                          PatchOperation.Set("/tramitePresencial", servicio.TramitePresencial),
                          PatchOperation.Set("/tipoPago", servicio.TipoPago),
                          PatchOperation.Set("/activo", servicio.Activo),
                          PatchOperation.Set("/usuarioModificacion", servicio.UsuarioModificacion),
                          PatchOperation.Set("/fechaModificacion", servicio.FechaModificacion)});
        }
    }
}