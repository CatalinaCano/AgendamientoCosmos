using FxMalla.Models.DataTransferObjects;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace FxMalla.Interfaces.RepositoryPattern
{
    public interface ISedeRepository
    {
        public Task<bool> ExisteSede(string idSede);

        public Task<List<SedeDto>> ObtenerSubsedes(string idSedes);

        public Task<List<ServicioDto>> ObtenerSubsedesPorServicio(string idServicio);

        public Task<bool> PoseeSubSedes(string idSede);

        public Task<List<DatosSedeDto>> ObtenerDatosSede(string idSedes);
    }
}