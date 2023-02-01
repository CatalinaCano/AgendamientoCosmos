using FxCodigoQR.Interfaces.RepositoryPattern;
using FxCodigoQR.Models.DataTransferObjects;
using FxCodigoQR.Models.Entities;

using Microsoft.Azure.Cosmos;
using Microsoft.Extensions.Configuration;

using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace FxCodigoQR.Repositories
{
    public class CodigoQRRepository : RepositoryBase, ICodigoQRRepository
    {
        private readonly Container container;

        public CodigoQRRepository(CosmosClient client, IConfiguration configuration)
             : base(client)
        {
            string containerId = configuration["CosmosDB:ColeccionCodigo"];
            string databaseName = configuration["CosmosDB:NombreBD"];
            container = client.GetContainer(databaseName, containerId);
        }

        public async Task<string> InsertarSolictud(CodigoQR data)
        {
            try
            {
                ItemResponse<CodigoQR> itemResponse = await container.ReadItemAsync<CodigoQR>(data.Id, new PartitionKey(data.Id));
                return itemResponse == null ? "OK" : "Error";
            }
            catch (CosmosException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
            {
                var result = await container.CreateItemAsync(data, new PartitionKey(data.Id));
                if (result.StatusCode.ToString() is "Created")
                    return "OK";
                return "Error";
            }
        }

        public async Task<CodigoQRDto> ObtenerTramite(string idTramite)
        {
            CodigoQRDto data = null;
            try
            {
                var queryString = @"SELECT
	                                c.idTramite,
                                    c.idUsuario,
	                                c.tiempoActivacion,
	                                c.tiempoCaducidad
                                FROM codigoQR c
                                WHERE c.idTramite=@idTramite";

                var queryDef = new QueryDefinition(queryString);
                queryDef.WithParameter("@idTramite", idTramite);

                var query = container.GetItemQueryIterator<CodigoQRDto>(queryDef);
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
    }
}