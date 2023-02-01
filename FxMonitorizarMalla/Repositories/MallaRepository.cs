using FxMonitorizarMalla.Interfaces.RepositoryPattern;
using FxMonitorizarMalla.Models.DataTransferObjects;
using FxMonitorizarMalla.Utils;

using Microsoft.Azure.Cosmos;
using Microsoft.Extensions.Configuration;

using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace FxMonitorizarMalla.Repositories
{
    public class MallaRepository : RepositoryBase, IMallaRepository
    {
        private readonly Container container;
        public readonly IConfiguration _configuration;

        public MallaRepository(CosmosClient client, IConfiguration configuration)
             : base(client)
        {
            string containerId = configuration["CosmosDB:ColeccionTramite"];
            string databaseName = configuration["CosmosDB:NombreBD"];
            container = client.GetContainer(databaseName, containerId);
        }

        public async Task<List<MallaDto>> ObtenerMallas()
        {
            string fechaFin = TimeHelper.ObtenerFechaColombia().AddDays(-1).ToString("dd/MM/yyyy");
            List<MallaDto> mallas = new List<MallaDto>();
            try
            {
                var queryString = @$"SELECT
	                                    m.id,
	                                    m.pkSede as idSede,
                                        m.fechaInicio,
	                                    m.fechaFin,
	                                    m.activo
                                    FROM malla m
                                    WHERE m.activo=@activo and m.fechaFin=@fechaFin";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@activo", true);
                queryDef.WithParameter("@fechaFin", fechaFin);

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
                return new List<MallaDto>();
            }
        }

        public async Task InactivarMalla(string id, string idSede)
        {
            await container.PatchItemAsync<MallaDto>(id, new PartitionKey(idSede), new[] { PatchOperation.Set("/activo", false) });
        }
    }
}