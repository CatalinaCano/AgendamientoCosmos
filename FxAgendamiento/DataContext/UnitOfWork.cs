using FxAgendamiento.Interfaces.RepositoryPattern;
using FxAgendamiento.Repositories;

using Microsoft.Azure.Cosmos;
using Microsoft.Extensions.Configuration;

using System;
using System.Data;

namespace FxAgendamiento.DataContext
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly IConfiguration _configuration;
        private readonly CosmosClient _client;

        private IDbConnection _connection;
        private IDbTransaction _transaction;

        private IMallaRepository _mallaRepository;
        private ISedeRepository _sedeRepository;
        private IServicioRepository _servicioRepository;
        private ITramiteRepository _tramiteRepository;

        private IEmailRepository _emailRepository;
        private IUsuarioRepository _usuarioRepository;

        private bool _disposed = false;

        public UnitOfWork(IConfiguration configuration, CosmosClient client, DapperContext context)
        {
            _configuration = configuration;
            _client = client;

            _connection = context.CreateConnection();
            _connection.Open();
            _transaction = _connection.BeginTransaction();
        }

        public IMallaRepository MallaRepository
        {
            get { return _mallaRepository ??= new MallaRepository(_client, _configuration); }
        }

        public ISedeRepository SedeRepository
        {
            get { return _sedeRepository ??= new SedeRepository(_client, _configuration); }
        }

        public IServicioRepository ServicioRepository
        {
            get { return _servicioRepository ??= new ServicioRepository(_client, _configuration); }
        }

        public ITramiteRepository TramiteRepository
        {
            get { return _tramiteRepository ??= new TramiteRepository(_client, _configuration); }
        }

        public IEmailRepository EmailRepository
        {
            get { return _emailRepository ??= new EmailRepository(_transaction); }
        }

        public IUsuarioRepository UsuarioRepository
        {
            get { return _usuarioRepository ??= new UsuarioRepository(_transaction); }
        }

        public void Commit()
        {
            try
            {
                _transaction.Commit();
            }
            catch
            {
                _transaction.Rollback();
                throw;
            }
            finally
            {
                _transaction.Dispose();
                _transaction = _connection.BeginTransaction();
                ResetRepositories();
            }
        }

        private void ResetRepositories()
        {
            _emailRepository = null;
            _usuarioRepository = null;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!_disposed)
            {
                if (disposing)
                {
                    if (_transaction != null)
                    {
                        _transaction.Dispose();
                        _transaction = null;
                    }
                    if (_connection != null)
                    {
                        _connection.Dispose();
                        _connection = null;
                    }
                }
                _disposed = true;
            }
        }

        ~UnitOfWork()
        {
            Dispose(false);
        }
    }
}