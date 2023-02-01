using FxCodigoQR.Models.DataTransferObjects;
using FxCodigoQR.Models.Entities;

using System.Threading.Tasks;

namespace FxCodigoQR.Interfaces.RepositoryPattern
{
    public interface ITramiteRepository
    {
        public Task<CitasDto> ObtenerCita(string idUsuario, string idCita);

        public Task<string> AgregarEstado(string idUsuario, string idTramite, Estado estado);

        public Task<EstadoDto> ValidarEstado(string idUsuario, string idTramite, string estado);
    }
}