using System;

namespace FxCodigoQR.Interfaces.RepositoryPattern
{
    public interface IUnitOfWork : IDisposable
    {
        ITramiteRepository TramiteRepository { get; }
        ICodigoQRRepository CodigoQRRepository { get; }
    }
}