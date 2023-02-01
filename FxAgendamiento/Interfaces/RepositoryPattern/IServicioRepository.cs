using FxAgendamiento.Models.DataTransferObjects;

using System.Threading.Tasks;

namespace FxAgendamiento.Interfaces.RepositoryPattern
{
    public interface IServicioRepository
    {
        public Task<ServicioDto> ObtenerTiempodeAtencionServicio(string idServicio);
    }
}