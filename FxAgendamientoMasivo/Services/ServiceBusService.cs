using Azure.Messaging.ServiceBus;

using FxAgendamientoMasivo.Interfaces;

using Microsoft.Extensions.Configuration;

using System.Threading.Tasks;

namespace FxAgendamientoMasivo.Services
{
    public class ServiceBusService : IServiceBusService
    {
        public readonly IConfiguration _configuration;

        public readonly string secretName;

        private readonly string connectionString;
        private readonly string queueName;

        public ServiceBusService(IConfiguration configuration)
        {
            _configuration = configuration;
            secretName = _configuration["SecretsNames:ConServiceBus"];
            connectionString = _configuration[secretName];
            queueName = _configuration["ServiceBus:NombreCola"];
        }

        public ServiceBusClient GetServiceBusClient()
        {
            var clientOptions = new ServiceBusClientOptions() { TransportType = ServiceBusTransportType.AmqpWebSockets };
            ServiceBusClient client = new(connectionString, clientOptions);
            return client;
        }

        public async Task EnviarMensaje(ServiceBusClient client, string mensaje)
        {
            ServiceBusSender sender = client.CreateSender(queueName);
            try
            {
                await sender.SendMessageAsync(new ServiceBusMessage(mensaje));
            }
            finally
            {
                await sender.DisposeAsync();
                await client.DisposeAsync();
            }
        }
    }
}