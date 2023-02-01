using FxServicio.Models.DataTransferObjects;
using FxServicio.Models.Entities;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace FxServicio.Interfaces.RepositoryPattern
{
    public interface IServicioRepository
    {
        public Task<string> CreateServicioAsync(Servicio servicio);

        public Task<ServicioDto> GetServicioByIdAsync(string idServicio);

        public Task<List<ServicioDto>> GetServicioByIdGrupoServicioAsync(string idGrupoServicio);

        public Task<List<ServicioDto>> GetServiciosAsync();

        public Task UpsertServicioAsync(Servicio servicio, string idServicio);

        public Task<bool> ExistsServicioAsync(string nombreServicio);
    }
}