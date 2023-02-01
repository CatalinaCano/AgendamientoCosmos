using FxMalla.Models.DataTransferObjects;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace FxMalla.Interfaces.RepositoryPattern
{
    public interface IServicioRepository
    {
        public Task<bool> ExisteServicio(string idServicio);

        public Task<List<ServicioDataDto>> ObtenerTiempodeAtencionServicio(string idServicios);
    }
}