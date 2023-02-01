using Microsoft.Azure.Cosmos;

namespace FxGrupoTramite.Repositories
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