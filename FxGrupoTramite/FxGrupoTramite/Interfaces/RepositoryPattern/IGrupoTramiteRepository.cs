using FxGrupoTramite.Models.DataTransferObjects;
using FxGrupoTramite.Models.Entities;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace FxGrupoTramite.Interfaces.RepositoryPattern
{
    public interface IGrupoTramiteRepository
    {
        public Task<string> CreateGrupoTramiteAsync(GrupoTramite grupoTramite);

        public Task<GrupoTramiteDto> GetGrupoTramiteByIdAsync(string idGrupoTramite);

        public Task<List<GrupoTramiteDto>> GetGruposTramiteAsync();

        public Task<string> UpsertGrupoTramiteAsync(GrupoTramite grupoTramite, string idGrupoTramite);

        public Task<bool> ExistsGrupoTramiteAsync(string nombreGrupoTramite);
    }
}