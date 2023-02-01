using System;

namespace FxGrupoServicio.Interfaces.RepositoryPattern
{
    public interface IUnitOfWork : IDisposable
    {
        IGrupoServicioRepository GrupoServicioRepository { get; }
        IGrupoTramiteRepository GrupoTramiteRepository { get; }
    }
}