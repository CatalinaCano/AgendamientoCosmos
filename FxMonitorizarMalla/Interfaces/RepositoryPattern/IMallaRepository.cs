using FxMonitorizarMalla.Models.DataTransferObjects;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace FxMonitorizarMalla.Interfaces.RepositoryPattern
{
    public interface IMallaRepository
    {
        public Task<List<MallaDto>> ObtenerMallas();

        public Task InactivarMalla(string id, string idSede);
    }
}