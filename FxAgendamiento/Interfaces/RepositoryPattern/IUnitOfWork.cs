using System;

namespace FxAgendamiento.Interfaces.RepositoryPattern
{
    public interface IUnitOfWork : IDisposable
    {
        IMallaRepository MallaRepository { get; }
        ISedeRepository SedeRepository { get; }
        ITramiteRepository TramiteRepository { get; }
        IServicioRepository ServicioRepository { get; }
        IEmailRepository EmailRepository { get; }
        IUsuarioRepository UsuarioRepository { get; }
    }
}