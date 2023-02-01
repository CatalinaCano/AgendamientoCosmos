using FxGrupoServicio.Interfaces.RepositoryPattern;
using FxGrupoServicio.Repositories;

using Microsoft.Azure.Cosmos;
using Microsoft.Extensions.Configuration;

using System;

namespace FxGrupoServicio.DataContext
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly IConfiguration _configuration;
        private readonly CosmosClient _client;

        private IGrupoServicioRepository _grupoServicioRepository;
        private IGrupoTramiteRepository _grupoTramiteRepository;
        private bool _disposed = false;

        public UnitOfWork(IConfiguration configuration, CosmosClient client)
        {
            _configuration = configuration;
            _client = client;
        }

        public IGrupoServicioRepository GrupoServicioRepository
        {
            get { return _grupoServicioRepository ??= new GrupoServicioRepository(_client, _configuration); }
        }

        public IGrupoTramiteRepository GrupoTramiteRepository
        {
            get { return _grupoTramiteRepository ??= new GrupoTramiteRepository(_client, _configuration); }
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