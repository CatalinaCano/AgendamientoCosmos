using FxMonitorizarMalla.Interfaces.RepositoryPattern;
using FxMonitorizarMalla.Repositories;

using Microsoft.Azure.Cosmos;
using Microsoft.Extensions.Configuration;

using System;

namespace FxMonitorizarMalla.DataContext
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly IConfiguration _configuration;
        private readonly CosmosClient _client;

        private IMallaRepository _mallaRepository;
        private bool _disposed = false;

        public UnitOfWork(IConfiguration configuration, CosmosClient client)
        {
            _configuration = configuration;
            _client = client;
        }

        public IMallaRepository MallaRepository
        {
            get { return _mallaRepository ??= new MallaRepository(_client, _configuration); }
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