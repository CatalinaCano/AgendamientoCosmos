using System;

namespace FxGrupoTramite.Interfaces.RepositoryPattern
{
    public interface IUnitOfWork : IDisposable
    {
        IGrupoTramiteRepository GrupoTramiteRepository { get; }
    }
}