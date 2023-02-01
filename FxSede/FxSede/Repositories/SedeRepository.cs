using FxSede.Interfaces.RepositoryPattern;
using FxSede.Models.DataTransferObjects;
using FxSede.Models.Entities;

using Microsoft.Azure.Cosmos;
using Microsoft.Azure.Cosmos.Linq;
using Microsoft.Extensions.Configuration;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

using PartitionKey = Microsoft.Azure.Cosmos.PartitionKey;

namespace FxSede.Repositories
{
    public class SedeRepository : RepositoryBase, ISedeRepository
    {
        private readonly Container container;

        public SedeRepository(CosmosClient client, IConfiguration configuration)
             : base(client)
        {
            string containerId = configuration["CosmosDB:Sede"];
            string databaseName = configuration["CosmosDB:NombreBD"];
            container = client.GetContainer(databaseName, containerId);

        
        }

        #region Sede

        public async Task<string> CreateSedeAsync(Sede sede)
        {
            try
            {
                ItemResponse<Servicio> itemResponse = await container.ReadItemAsync<Servicio>(sede.Id, new PartitionKey(sede.Id));
                return itemResponse == null ? "OK" : "Error";
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                var result = await container.CreateItemAsync(sede, new PartitionKey(sede.Id));
                if (result.StatusCode.ToString() is "Created")
                    return sede.Id;
                return "Error";
            }
        }

        public async Task<bool> ExistsSedeAsync(string nombreSede)
        {
            SedeDto data = null;
            try
            {
                var queryString = @"SELECT
                                    s.id as idSede,
                                    s.nombreSede as nombre,
                                    s.direccion,
                                    s.telefono,
                                    s.horaInicio,
                                    s.horaFin,
                                    s.inactivarFestivos
                                  FROM sedes s
                                  WHERE s.nombreSede=@nombre";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@nombre", nombreSede);
                queryDef.WithParameter("@activo", true);
                var query = container.GetItemQueryIterator<SedeDto>(queryDef);

                while (query.HasMoreResults)
                {
                    var response = await query.ReadNextAsync();
                    data = response.FirstOrDefault();
                }

                return data != null;
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                return false;
            }
        }

        public async Task<SedeDto> GetSedeByName(string nombreSede)
        {
            SedeDto sedeDto = null;
            try
            {
                var queryString = @"SELECT
                                    s.id as idSede,
                                    s.nombreSede as nombre,
                                    s.direccion,
                                    s.telefono,
                                    s.horaInicio,
                                    s.horaFin,
                                    s.inactivarFestivos
                                  FROM sedes s
                                  WHERE s.activo=@activo AND s.nombreSede=@nombreSede";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@activo", true);
                queryDef.WithParameter("@nombreSede", nombreSede);

                var query = container.GetItemQueryIterator<SedeDto>(queryDef);
                while (query.HasMoreResults)
                {
                    var response = await query.ReadNextAsync();
                    sedeDto = response.SingleOrDefault();
                }

                return sedeDto;
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                return sedeDto;
            }
        }


        public async Task<SedeDto> GetSedeByID(string idSede)
        {
            SedeDto sedeDto = null;
            try
            {
                var queryString = @"SELECT
                                    s.id as idSede,
                                    s.nombreSede as nombre,
                                    s.direccion,
                                    s.telefono,
                                    s.horaInicio,
                                    s.horaFin,
                                    s.inactivarFestivos
                                  FROM sedes s
                                  WHERE s.activo=@activo AND s.id=@idSede";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@activo", true);
                queryDef.WithParameter("@idSede", idSede);

                var query = container.GetItemQueryIterator<SedeDto>(queryDef);
                while (query.HasMoreResults)
                {
                    var response = await query.ReadNextAsync();
                    sedeDto = response.SingleOrDefault();
                }

                return sedeDto;
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                return sedeDto;
            }
        }

        public async Task<List<SedeDto>> GetSedesAsync()
        {
            var queryString = @"SELECT
                                    s.id as idSede,
                                    s.nombreSede as nombre,
                                    s.direccion,
                                    s.telefono,
                                    s.horaInicio,
                                    s.horaFin,
                                    s.inactivarFestivos
                                FROM sedes s
                                WHERE s.activo=@activo";

            var queryDef = new QueryDefinition(queryString);
            queryDef.WithParameter("@activo", true);

            var query = container.GetItemQueryIterator<SedeDto>(queryDef);

            var sedes = new List<SedeDto>();

            while (query.HasMoreResults)
            {
                var response = await query.ReadNextAsync();
                sedes.AddRange(response.ToList());
            }

            return sedes;
        }

        public async Task<string> PatchSedeAsync(Sede sede, string idSede)
        {
            try
            {
                sede.Id = idSede;
                var result = await container.PatchItemAsync<Sede>(idSede, new PartitionKey(idSede),
                      new[] { PatchOperation.Set("/nombreSede", sede.NombreSede.Trim()),
                          PatchOperation.Set("/direccion", sede.Direccion),
                          PatchOperation.Set("/telefono", sede.Telefono),
                          PatchOperation.Set("/horaInicio", sede.HoraInicio),
                          PatchOperation.Set("/horaFin", sede.HoraFin),
                          PatchOperation.Set("/inactivarFestivos", sede.InactivarFestivos),
                          PatchOperation.Set("/activo", sede.Activo),
                          PatchOperation.Set("/usuarioModificacion", sede.UsuarioModificacion),
                          PatchOperation.Set("/fechaModificacion", sede.FechaModificacion)});
                return result.StatusCode.ToString();
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        #endregion Sede

        #region Subsede

        public async Task<bool> ExistsSubSedeAsync(string idSede, string idSubSede)
        {
            try
            {
                ItemResponse<Sede> sede = await container.ReadItemAsync<Sede>(idSede, new PartitionKey(idSede));
                return sede.Resource.SubSedes.Any(ss => ss.IdSubSede == idSubSede);
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                return false;
            }
        }

        public async Task<SubSedeDto> GetSubSedeByName(string idSede, string nombreSubSede)
        {
            SubSedeDto data = null;
            try
            {
                var queryString = @"SELECT
                                ss.idSubSede,
                                ss.nombreSubSede as nombre,
                                ss.horaInicio,
                                ss.horaFin,
                                ss.intervaloAtencion as intervalo,
                                ss.numeroPersonasAtencion as numeroPersonas,
                                ss.diasOffline,
                                ss.tiemposOffline,
                                ss.servicios
                                FROM sedes s
                                JOIN ss IN s.subSedes
                                WHERE s.activo=@activo AND s.id=@idSede AND ss.activo=@activo
                                AND ss.nombreSubSede=@nombreSubSede";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@idSede", idSede);
                queryDef.WithParameter("@activo", true);
                queryDef.WithParameter("@nombreSubSede", nombreSubSede);
                var query = container.GetItemQueryIterator<SubSedeDto>(queryDef);

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


        public async Task<List<SubSedeDto>> GetSubSedesByIdSedeAsync(string idSede)
        {
            var queryString = @"SELECT
                                ss.idSubSede,
                                ss.nombreSubSede as nombre,
                                ss.horaInicio,
                                ss.horaFin,
                                ss.intervaloAtencion as intervalo,
                                ss.numeroPersonasAtencion as numeroPersonas,
                                ss.diasOffline,
                                ss.tiemposOffline,
                                ss.servicios
                                FROM sedes s
                                JOIN ss IN s.subSedes
                                WHERE s.activo=@activo AND s.id=@idSede AND ss.activo=@activo";

            var queryDef = new QueryDefinition(queryString);
            queryDef.WithParameter("@activo", true);
            queryDef.WithParameter("@idSede", idSede);

            var query = container.GetItemQueryIterator<SubSedeDto>(queryDef);

            List<SubSedeDto> subsedes = new ();

            while (query.HasMoreResults)
            {
                var response = await query.ReadNextAsync();
                subsedes.AddRange(response.ToList());
            }

            return subsedes;
        }


        public async Task<List<SedeDto>> GetSedesByServicio(string idServicio)
        {
            var queryString = @"SELECT DISTINCT
	                             s.id as idSede,
                                 s.nombreSede as nombre,
                                 s.direccion,
                                 s.telefono,
                                 s.horaInicio,
                                 s.horaFin,
                                 s.inactivarFestivos
                                FROM sede s
                                JOIN sb IN s.subSedes
                                JOIN sr IN sb.servicios
                                WHERE s.activo=@activo AND
                                sr.activo=@activo AND sr.idServicio=@idServicio";

            var queryDef = new QueryDefinition(queryString);
            queryDef.WithParameter("@activo", true);
            queryDef.WithParameter("@idServicio", idServicio);

            var query = container.GetItemQueryIterator<SedeDto>(queryDef);

            var sedes = new List<SedeDto>();

            while (query.HasMoreResults)
            {
                var response = await query.ReadNextAsync();
                sedes.AddRange(response.ToList());
            }

            return sedes;
        }

        public async Task<string> AddSubSede(SubSede subsede, string idSede)
        {

            try
            {
                ItemResponse<Sede> itemResponse = await container.ReadItemAsync<Sede>(idSede, new PartitionKey(idSede));
                if (itemResponse != null)
                {
                    await container.PatchItemAsync<Sede>(idSede, new PartitionKey(idSede),

               new[] {
                     PatchOperation.Add($"/subSedes/0", subsede)
               });
                    return subsede.IdSubSede;
                }
                else
                {
                    return "Error no existe la sede enviada y no se puede agregar la subsede";
                }
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                return "Error no existe la sede enviada y no se puede agregar la subsede";
            }
        }

        public async Task<SubSedeDto> GetSubSedesByIdAsync(string idSede, string idSubSede)
        {
            SubSedeDto subSedeDto = null;
            try
            {
                var queryString = @"SELECT
                                    ss.idSubSede,
                                    ss.nombreSubSede as nombre,
                                    ss.horaInicio,
                                    ss.horaFin,
                                    ss.intervaloAtencion as intervalo,
                                    ss.numeroPersonasAtencion as numeroPersonas,
                                    ss.diasOffline,
                                    ss.tiemposOffline,
                                    ss.servicios
                                    FROM sedes s
                                    JOIN ss IN s.subSedes
                                    WHERE s.activo=@activo AND
                                          s.id=@idSede AND
                                          ss.activo=@activo AND
                                          ss.idSubSede=@idSubSede";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@activo", true);
                queryDef.WithParameter("@idSede", idSede);
                queryDef.WithParameter("@idSubSede", idSubSede);

                var query = container.GetItemQueryIterator<SubSedeDto>(queryDef);
                while (query.HasMoreResults)
                {
                    var response = await query.ReadNextAsync();
                    subSedeDto = response.SingleOrDefault();
                }

                return subSedeDto;
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                return subSedeDto;
            }
        }

        public async Task<string> UpdateSubSede(SubSede subsede, string idSede)
        {
            var result = container.GetItemLinqQueryable<Sede>().Where(
                               s => s.Id.Equals(idSede)).ToFeedIterator();

            int indiceSubSede = -1;
            if (result.HasMoreResults)
            {
                var existingDocuments = await result.ReadNextAsync();
                List<SubSede> subSedes = existingDocuments.Resource?.Select(d => d.SubSedes).FirstOrDefault();
                indiceSubSede = subSedes.FindIndex(sb => sb.IdSubSede.Equals(subsede.IdSubSede));

            }

            var patchOpts = new List<PatchOperation>
            {
                PatchOperation.Set($"/subSedes/{indiceSubSede}", subsede)
            };
            subsede.FechaModificacion = DateTimeOffset.Now;
            var resultado = await container.PatchItemAsync<Sede>(idSede, new PartitionKey(idSede), patchOpts);
            return resultado.StatusCode.ToString();

        }

        #endregion Subsede
    }
}