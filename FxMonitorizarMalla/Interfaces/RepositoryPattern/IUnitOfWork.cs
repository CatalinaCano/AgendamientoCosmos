using System;

namespace FxMonitorizarMalla.Interfaces.RepositoryPattern
{
    public interface IUnitOfWork : IDisposable
    {
        IMallaRepository MallaRepository { get; }
    }
}