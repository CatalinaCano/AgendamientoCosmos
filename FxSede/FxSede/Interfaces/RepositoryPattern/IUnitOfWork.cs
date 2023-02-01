using System;

namespace FxSede.Interfaces.RepositoryPattern
{
    public interface IUnitOfWork : IDisposable
    {
        ISedeRepository SedeRepository { get; }
        IServicioRepository ServicioRepository { get; }
    }
}