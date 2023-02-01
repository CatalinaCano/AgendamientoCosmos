using FxAgendamiento.Models.DataTransferObjects;
using FxAgendamiento.Models.Entities;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace FxAgendamiento.Interfaces.RepositoryPattern
{
    public interface ITramiteRepository
    {
        public Task CrearTramite(Agenda tramite);

        public Task<ValidarTramiteDto> ValidarServicioActivo(string idUsuario, string idServicio);

        public Task<SolicitudesDto> ValidarCantidadSolicitudes(string idUsuario);

        public Task<List<CitasDto>> ObtenerCitas(string idUsuario);

        public Task<List<CitasDto>> ObtenerCitasPorDia(string idUsuario);

        public Task<EstadoDto> ValidarEstado(string idUsuario, string idTramite, string estado);

        public Task<string> AgregarEstado(string idUsuario, string idTramite, Estado estado);

        public Task<CitasDto> ObtenerCita(string idUsuario, string idCita);

        public Task InactivarCita(string idUsuario, string idCita);

        public Task<List<TramiteEnEsperaDto>> ListarTramitesEnEspera(string idSede, string idSubSede);
    }
}