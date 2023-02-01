using System.Threading.Tasks;

namespace FxSede.Interfaces.RepositoryPattern
{
    public interface IServicioRepository
    {
        public Task<bool> GetServicioByIdAsync(string idServicio);
    }
}