using FxMalla.Models.DataTransferObjects;
using FxMalla.Models.Entities;
using FxMalla.Models.Input;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace FxMalla.Interfaces.RepositoryPattern
{
    public interface IMallaRepository
    {
        public Task<string> InsertarMallaAsync(Malla malla);

        public Task<List<MallaDto>> ValidarMalla(string idSede);

        public Task InactivarMallas(string idSede, string idMalla, string usuario);

        public Task<List<TiempoMallaDto>> ObtenerTiempos(string idSede, string fechaAgenda, string idUsuario);

        public Task<List<DiasDto>> ObtenerDiasDisponibles(string idSede);

        public Task<List<Malla>> ObtenerMallaporID(string idMalla);
        public Task<List<Malla>> ObtenerMallaporFecha(FechaInput fecha);

    }
}