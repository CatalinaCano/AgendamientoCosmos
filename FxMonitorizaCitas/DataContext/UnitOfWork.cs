using FxMonitorizaCitas.Interfaces.RepositoryPattern;
using FxMonitorizaCitas.Repositories;

using Microsoft.Azure.Cosmos;
using Microsoft.Extensions.Configuration;

using System;

namespace FxMonitorizaCitas.DataContext
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly IConfiguration _configuration;
        private readonly CosmosClient _client;

        private ITramiteRepository _tramiteRepository;
        private bool _disposed = false;

        public UnitOfWork(IConfiguration configuration, CosmosClient client)
        {
            _configuration = configuration;
            _client = client;
        }

        public ITramiteRepository TramiteRepository
        {
            get { return _tramiteRepository ??= new TramiteRepository(_client, _configuration); }
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!_disposed && !disposing)
            {
                _client.Dispose();
            }
            _disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        ~UnitOfWork()
        {
            Dispose(false);
        }
    }
}