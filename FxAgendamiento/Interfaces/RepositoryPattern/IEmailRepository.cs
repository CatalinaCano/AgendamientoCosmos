using FxAgendamiento.Models.DataTransferObjects;

using System.Threading.Tasks;

namespace FxAgendamiento.Interfaces.RepositoryPattern
{
    public interface IEmailRepository
    {
        public Task<PlantillaDto> ObtenerConfiguracionPlantilla(string nombre_cliente, string nombre_servicio, string nombre_plantilla);
    }
}