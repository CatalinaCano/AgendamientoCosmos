using System;

namespace FxMonitorizaCitas.Interfaces.RepositoryPattern
{
    public interface IUnitOfWork : IDisposable
    {
        ITramiteRepository TramiteRepository { get; }
    }
}