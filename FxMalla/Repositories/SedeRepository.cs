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
    internal class SedeRepository : RepositoryBase, ISedeRepository
    {
        private readonly Container container;

        public SedeRepository(CosmosClient client, IConfiguration configuration)
             : base(client)
        {
            string containerId = configuration["CosmosDB:ColeccionSede"];
            string databaseName = configuration["CosmosDB:NombreBD"];
            container = client.GetContainer(databaseName, containerId);
        }

        public async Task<bool> PoseeSubSedes(string idSede)
        {
            try
            {
                var queryString = @"SELECT
                                    COUNT(s.activo) as PoseeSubSedes
                                   FROM s
                                   JOIN sb in s.subSedes
                                   WHERE s.id=@pkSede
                                   AND s.activo=@activo
                                   GROUP BY s.activo";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@pkSede", idSede);
                queryDef.WithParameter("@activo", true);

                var query = container.GetItemQueryIterator<dynamic>(queryDef);

                if (query.HasMoreResults)
                {
                    var response = await query.ReadNextAsync();
                    var cantidad = response.SingleOrDefault();
                    return cantidad != null;
                }

                return false;
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                return false;
            }
        }

        public async Task<bool> ExisteSede(string idSede)
        {
            dynamic data = null;
            try
            {
                var queryString = @"SELECT
                                     s.id
                                    FROM Sede s
                                    WHERE s.id=@pkSede
                                    AND s.activo=@activo";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@pkSede", idSede);
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

        public async Task<List<DatosSedeDto>> ObtenerDatosSede(string idSedes)
        {
            List<DatosSedeDto> sedes = new() { };
            try
            {
                var queryString = @$"SELECT
                                           s.id as  IdSede,
                                          s.nombreSede as NombreSede,
                                          s.direccion as Direccion
                                    FROM Sede s
                                    WHERE s.id IN ({idSedes})";
                var query = container.GetItemQueryIterator<DatosSedeDto>(queryString);
                while (query.HasMoreResults)
                {
                    var response = await query.ReadNextAsync();
                    sedes.AddRange(response.ToList());
                }

                return sedes;
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                return sedes;
            }
        }

        public async Task<List<SedeDto>> ObtenerSubsedes(string idSedes)
        {
            List<SedeDto> subsedes = new() { };
            try
            {
                var queryString = $@"SELECT
                                     s.id as pkSede,
                                     s.inactivarFestivos,
                                     sb.idSubSede,
                                     sb.nombreSubSede,
                                     sb.horaInicio,
                                     sb.horaFin,
                                     sb.intervaloAtencion,
                                     sb.numeroPersonasAtencion,
                                     sb.diasOffline,
                                     sb.tiemposOffline
                                    FROM Sede s
                                    JOIN sb IN s.subSedes
                                    WHERE s.id IN ({idSedes})
                                    AND s.activo=@activo and sb.activo=@activo";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@activo", true);

                var query = container.GetItemQueryIterator<SedeDto>(queryDef);
                while (query.HasMoreResults)
                {
                    var response = await query.ReadNextAsync();
                    subsedes.AddRange(response.ToList());
                }

                return subsedes;
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                return subsedes;
            }
        }

        public async Task<List<ServicioDto>> ObtenerSubsedesPorServicio(string idServicio)
        {
            List<ServicioDto> subsedesServicio = new() { };
            try
            {
                var queryString = @"SELECT
	                                    s.id as pkSede,
	                                    sb.idSubSede,
	                                    sr.prioridad
                                    FROM sede s
                                    JOIN sb IN s.subSedes
                                    JOIN sr IN sb.servicios
                                    WHERE s.activo=@activo
                                    AND sb.activo=@activo
                                    AND sr.idServicio =@pkServicio
                                    AND sr.activo=@activo";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@pkServicio", idServicio);
                queryDef.WithParameter("@activo", true);

                var query = container.GetItemQueryIterator<ServicioDto>(queryDef);
                while (query.HasMoreResults)
                {
                    var response = await query.ReadNextAsync();
                    subsedesServicio.AddRange(response.ToList());
                }

                return subsedesServicio;
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                return subsedesServicio;
            }
        }
    }
}