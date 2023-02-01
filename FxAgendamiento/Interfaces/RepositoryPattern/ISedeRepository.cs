using FxAgendamiento.Models.DataTransferObjects;

using System.Threading.Tasks;

namespace FxAgendamiento.Interfaces.RepositoryPattern
{
    public interface ISedeRepository
    {
        public Task<SedeDto> ObtenerDatosSede(string idSede, string idSubsede);
        public Task<bool> ExisteSede(string idSede);
        public Task<bool> ExisteSubSede(string idSede,string idSubSede); 
    }
}