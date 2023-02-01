using System;

namespace FxMalla.Interfaces.RepositoryPattern
{
    public interface IUnitOfWork : IDisposable
    {
        IMallaRepository MallaRepository { get; }
        ISedeRepository SedeRepository { get; }
        ITramiteRepository TramiteRepository { get; }
        IServicioRepository ServicioRepository { get; }
        IUsuarioRepository UsuarioRepository { get; }
    }
}