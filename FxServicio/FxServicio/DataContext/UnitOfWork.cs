using FxServicio.Interfaces.RepositoryPattern;
using FxServicio.Repositories;

using Microsoft.Azure.Cosmos;
using Microsoft.Extensions.Configuration;

using System;

namespace FxServicio.DataContext
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly IConfiguration _configuration;
        private readonly CosmosClient _client;

        private IServicioRepository _servicioRepository;
        private IGrupoServicioRepository _grupoServicioRepository;
        private bool _disposed = false;

        public UnitOfWork(IConfiguration configuration, CosmosClient client)
        {
            _configuration = configuration;
            _client = client;
        }

        public IServicioRepository ServicioRepository
        {
            get { return _servicioRepository ?? (_servicioRepository = new ServicioRepository(_client, _configuration)); }
        }

        public IGrupoServicioRepository GrupoServicioRepository
        {
            get { return _grupoServicioRepository ?? (_grupoServicioRepository = new GrupoServicioRepository(_client, _configuration)); }
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