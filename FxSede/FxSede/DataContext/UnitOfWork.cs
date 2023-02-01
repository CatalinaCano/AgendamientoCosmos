using FxSede.Interfaces.RepositoryPattern;
using FxSede.Repositories;

using Microsoft.Azure.Cosmos;
using Microsoft.Extensions.Configuration;

using System;

namespace FxSede.DataContext
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly IConfiguration _configuration;
        private readonly CosmosClient _client;

        private ISedeRepository _sedeRepository;
        private IServicioRepository _servicioRepository;
        private bool _disposed = false;

        public UnitOfWork(IConfiguration configuration, CosmosClient client)
        {
            _configuration = configuration;
            _client = client;
        }

        public ISedeRepository SedeRepository
        {
            get { return _sedeRepository ?? (_sedeRepository = new SedeRepository(_client, _configuration)); }
        }

        public IServicioRepository ServicioRepository
        {
            get { return _servicioRepository ?? (_servicioRepository = new ServicioRepository(_client, _configuration)); }
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