using System;

namespace FxServicio.Interfaces.RepositoryPattern
{
    public interface IUnitOfWork : IDisposable
    {
        IServicioRepository ServicioRepository { get; }
        IGrupoServicioRepository GrupoServicioRepository { get;}
    }
}