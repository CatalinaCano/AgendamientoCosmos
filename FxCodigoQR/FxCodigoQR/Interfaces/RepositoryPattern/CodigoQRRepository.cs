using FxCodigoQR.Models.DataTransferObjects;
using FxCodigoQR.Models.Entities;

using System.Threading.Tasks;

namespace FxCodigoQR.Interfaces.RepositoryPattern
{
    public interface ICodigoQRRepository
    {
        public Task<string> InsertarSolictud(CodigoQR data);

        public Task<CodigoQRDto> ObtenerTramite(string idTramite);
    }
}