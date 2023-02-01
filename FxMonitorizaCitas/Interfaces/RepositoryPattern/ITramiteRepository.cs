using FxMonitorizaCitas.Models.DataTransferObjects;
using FxMonitorizaCitas.Models.Entities;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace FxMonitorizaCitas.Interfaces.RepositoryPattern
{
    public interface ITramiteRepository
    {
        public Task<List<TramitesDiaDto>> ObtenerCitasDia();

        public Task<List<CitasDto>> ObtenerCitas(string idUsuario);

        public Task InactivarCita(string idUsuario, string idCita);

        public Task<string> AgregarEstado(string idUsuario, string idTramite, Estado estado);
    }
}