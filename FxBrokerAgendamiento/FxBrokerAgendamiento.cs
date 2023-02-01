using Azure.Messaging.ServiceBus;

using FxBrokerAgendamiento.Interfaces;
using FxBrokerAgendamiento.Models;

using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.ServiceBus;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;

using Newtonsoft.Json;

using System;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace FxBrokerAgendamiento
{
    public class BrokerAgendamiento
    {
        public readonly IConfiguration _configuration;
        private readonly IHttpService _httpClient;

        public BrokerAgendamiento(IConfiguration configuration, IHttpService httpClient)
        {
            _configuration = configuration;
            _httpClient = httpClient;
        }

        [FunctionName("BrokerAgendamiento")]
        public async Task Run([ServiceBusTrigger("%NombreCola%", Connection = "ServiceBusConnectionString")] ServiceBusReceivedMessage[] messages, ServiceBusMessageActions messageActions, ILogger log)
        {
            try
            {
                foreach (ServiceBusReceivedMessage message in messages)
                {
                    string payload = Encoding.UTF8.GetString(message.Body);
                    log.LogInformation($"Se va a prorcesar el Mensaje: {payload}");
                    AgendaInput request = JsonConvert.DeserializeObject<AgendaInput>(payload);
                    HttpResponseMessage response = await _httpClient.PostAsync(request);

                    string responseBody = await response.Content.ReadAsStringAsync();

                    ResponseResult data = JsonConvert.DeserializeObject<ResponseResult>(responseBody);

                    if (!data.IsError)
                    {
                        log.LogInformation($"Mensaje Enviado Exitosamente: {responseBody}");
                        await messageActions.CompleteMessageAsync(message);
                    }
                    else
                    {
                        log.LogInformation($"Mensaje Fallido: {responseBody}");
                        await messageActions.DeadLetterMessageAsync(message);
                    }
                }
            }
            catch (Exception e)
            {
                log.LogInformation(e.Message);
            }
        }
    }
}