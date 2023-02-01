using Microsoft.Azure.Cosmos;

namespace FxGrupoServicio.Repositories
{
    public abstract class RepositoryBase
    {
        protected CosmosClient Client { get; private set; }

        protected RepositoryBase(CosmosClient client)
        {
            Client = client;
        }
    }
}