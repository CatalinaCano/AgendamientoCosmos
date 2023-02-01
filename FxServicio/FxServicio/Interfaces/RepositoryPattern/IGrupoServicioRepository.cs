using System.Threading.Tasks;

namespace FxServicio.Interfaces.RepositoryPattern
{
    public interface IGrupoServicioRepository
    {
        public Task<bool> ExistsGrupoServicio(string idGrupoServicio);
    }
}
