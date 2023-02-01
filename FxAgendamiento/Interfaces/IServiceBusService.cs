using Azure.Messaging.ServiceBus;

using System.Threading.Tasks;

namespace FxAgendamiento.Interfaces
{
    public interface IServiceBusService
    {
        public ServiceBusClient GetServiceBusClient();
        public Task EnviarMensaje(ServiceBusClient client, string mensaje);
    }
}