using Azure.Messaging.ServiceBus;

using FxAgendamiento.Interfaces;
using FxAgendamiento.Interfaces.RepositoryPattern;
using FxAgendamiento.Models.DataTransferObjects;
using FxAgendamiento.Models.EnvioMail;
using FxAgendamiento.Models.QR;

using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Extensions;
using Microsoft.Extensions.Configuration;

using Newtonsoft.Json;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace FxAgendamiento.Services
{
    public class MessageService : IMessageService
    {
        private readonly IConfiguration _configuration;
        private readonly IServiceBusService _serviceBus;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IHttpService _httpService;

        public MessageService(IConfiguration configuration, IServiceBusService serviceBus, IUnitOfWork unitOfWork, IHttpService httpService)
        {
            _configuration = configuration;
            _serviceBus = serviceBus;
            _unitOfWork = unitOfWork;
            _httpService = httpService;
        }

        public IServiceBusService ServiceBus
        {
            get { return _serviceBus; }
        }

        public async Task CrearMensaje(string email, ValoresDto values, string operacion)
        {
            ServiceBusClient client = _serviceBus.GetServiceBusClient();
            RequestEnvioMail mensaje = await ConstruirRequest(email, values, operacion);
            await _serviceBus.EnviarMensaje(client, JsonConvert.SerializeObject(mensaje));
        }

        public string ObtenerCodigoQR(DataInput data)
        {
            string qrCode = string.Empty;
            var result = _httpService.PostAsync(data).GetAwaiter().GetResult();
            var qrCodeResult = result.Content.ReadAsStringAsync().GetAwaiter().GetResult();

            if (!qrCodeResult.IsNullOrWhiteSpace() && result.IsSuccessStatusCode)
            {
                dynamic qr = JsonConvert.DeserializeObject(qrCodeResult);
                qrCode = qr.qrbase64;
            }

            return qrCode;
        }

     

        public Dictionary<string, string> GetDictionaryParameters(ValoresDto values, PlantillaDto plantilla, string operacion)
        {
            DataInput datos = new()
            {
                IdTramite = values.IdTramite,
                IdUsuario = values.IdUser,
                Data = $"{plantilla.param_url_base}/{values.IdTramite}"
            };


            string codigoQR = ObtenerCodigoQR(datos);

            Dictionary<string, string> valores = new()
            {
                 { "##NOMBRE##", values.Nombre},
                 { "##DIRECCION##", values.Direccion  },
                 { "##NOMBRE_SERVICIO##", values.NombreServicio  },
                 { "##FECHA_CITA##", values.Fecha },
                 { "##HORA_CITA##", values.Hora },
                 { "##TIEMPO##", values.Tiempo },
                 { "##URL_SITIO##", plantilla.param_url_base  }
            };

            if (operacion.Equals("Agendamiento"))
                valores.Add("##QR_CODE##", $"data:image/png;base64,{codigoQR}");

            return valores;
        }

        public Parametro[] ConstruirParametros(PlantillaDto plantilla, ValoresDto values, string operacion)
        {
            var valores = GetDictionaryParameters(values, plantilla, operacion);
            var parametrosEnvio = new List<Parametro>();
            var parametros = plantilla.orden_parametros.Split(",");
            foreach (var param in parametros)
            {
                parametrosEnvio.Add(new Parametro()
                {
                    Nombre = param,
                    Valor = valores[param]
                });
            }
            return parametrosEnvio.ToArray();
        }

        public async Task<RequestEnvioMail> ConstruirRequest(string email, ValoresDto values, string operacion)
        {
            string cliente = _configuration["EnvioMail:NombreCliente"];
            string servicio = _configuration["EnvioMail:NombreServicio"];
            string plantilla = _configuration[$"EnvioMail:Plantillas:{operacion}"];
            PlantillaDto response = await _unitOfWork.EmailRepository.ObtenerConfiguracionPlantilla(cliente, servicio, plantilla);
            RequestEnvioMail mensaje = new()
            {
                Fuente = operacion,
                IdCliente = response.cliente.ToString(),
                IdServicio = response.servicio.ToString(),
                IdTemplate = response.plantilla.ToString(),
                Destinatario = email,
                MascaraDestinatario = values.Nombre
            };

            if (operacion.Equals("Agendamiento"))
                mensaje.Agendamiento = new()
                {
                    IdTramite = values.IdTramite,
                    IdUsuario = values.IdUser,
                    Estado = _configuration["Estados:Notificacion"]
                };

            if (response.es_dinamica)
                mensaje.Parametros = ConstruirParametros(response, values, operacion);

            return mensaje;
        }
    }
}