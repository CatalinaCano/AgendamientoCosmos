using FxGrupoServicio.Models.DataTransferObjects;
using FxGrupoServicio.Models.Entities;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace FxGrupoServicio.Interfaces.RepositoryPattern
{
    public interface IGrupoServicioRepository
    {
        public Task<string> CreateGrupoServicioAsync(GrupoServicio grupoServicio);

        public Task<GrupoServicioDto> GetGrupoServicioByIdAsync(string idGrupoServicio);

        public Task<List<GrupoServicioDto>> GetGruposServicioAsync();

        public Task<string> UpsertGrupoServicioAsync(GrupoServicio grupoServicio, string idGrupoServicio);

        public Task<bool> ExistsGrupoServicioAsync(string nombreGrupoServicio);
        public Task<List<GrupoServicioDto>> GetGrupoServicioByGrupoTramiteAsync(string idGrupoTramite);
    }
}