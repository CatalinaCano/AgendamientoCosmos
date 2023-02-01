using FxAgendamiento.Models.DataTransferObjects;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace FxAgendamiento.Interfaces.RepositoryPattern
{
    public interface IMallaRepository
    {
        public Task InactivarTiempos(MallaDto data, string horaInicio, string idUsuario, bool inactivarAgenda);

        public Task<List<TramiteDto>> ValidarTiempos(MallaDto data, string[] horas);

        public Task<List<int>> ObtenerIndices(MallaDto data, string hora);

        public Task<List<CancelacionDto>> ObtenerHorasCancelacion(MallaDto data, string idTramite);

        public Task CancelarCita(MallaDto data, string horaInicio, string[] tramites, string idTramite, string idUsuario, bool inactivarAgenda);

        public Task<bool> ExistMalla(string idMalla);

        public Task<List<TiempoDto>> ValidarEspacio(string idMalla, string idSede, string idSubsede, string fecha);
    }
}