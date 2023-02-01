using FxAgendamientoMasivo.Models;

using System.Threading.Tasks;

namespace FxAgendamientoMasivo.Interfaces
{
    public interface IMessageService
    {
        public Task CrearMensaje(dynamic request);

        public RequestAgendamiento ConstruirRequest(dynamic request);
    }
}