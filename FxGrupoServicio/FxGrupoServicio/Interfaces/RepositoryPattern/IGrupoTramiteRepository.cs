using System.Threading.Tasks;

namespace FxGrupoServicio.Interfaces.RepositoryPattern
{
    public interface IGrupoTramiteRepository
    {
        public Task<bool> ExistsGrupoTramiteAsync(string idGrupoTramite);
    }
}
