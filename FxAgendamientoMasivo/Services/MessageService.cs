using Azure.Messaging.ServiceBus;

using FxAgendamientoMasivo.Interfaces;
using FxAgendamientoMasivo.Models;
using FxAgendamientoMasivo.Utils;

using Newtonsoft.Json;

using System.Threading.Tasks;

namespace FxAgendamientoMasivo.Services
{
    public class MessageService : IMessageService
    {
        private readonly IServiceBusService _serviceBus;

        public MessageService(IServiceBusService serviceBus) => _serviceBus = serviceBus;

        public IServiceBusService ServiceBus
        {
            get { return _serviceBus; }
        }

        public async Task CrearMensaje(dynamic request)
        {
            ServiceBusClient client = _serviceBus.GetServiceBusClient();
            RequestAgendamiento mensaje = ConstruirRequest(request);
            await _serviceBus.EnviarMensaje(client, JsonConvert.SerializeObject(mensaje));
        }

        public RequestAgendamiento ConstruirRequest(dynamic request)
        {
            RequestAgendamiento mensaje = new()
            {
                IdUsuario = request.IdUsuario,
                IdMalla = request.IdMalla,
                IdSede = request.IdSede,
                IdSubSede = request.IdSubsede,
                IdServicio = request.IdServicio,
                FechaAgendamiento = request.FechaCita,
                HoraAgendamiento = request.HoraCita,
                Ip = IpHelper.LocalIPAddress()
            };

            return mensaje;
        }
    }
}