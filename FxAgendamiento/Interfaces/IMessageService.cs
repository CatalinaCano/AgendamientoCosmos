using FxAgendamiento.Models.DataTransferObjects;
using FxAgendamiento.Models.EnvioMail;
using FxAgendamiento.Models.QR;

using System.Collections.Generic;
using System.Threading.Tasks;

namespace FxAgendamiento.Interfaces
{
    public interface IMessageService
    {
        IServiceBusService ServiceBus { get; }

        public Task CrearMensaje(string email, ValoresDto values, string operacion);

        public Dictionary<string, string> GetDictionaryParameters(ValoresDto values, PlantillaDto plantilla, string operacion);

        public Parametro[] ConstruirParametros(PlantillaDto plantilla, ValoresDto values, string operacion);

        public Task<RequestEnvioMail> ConstruirRequest(string email, ValoresDto values, string operacion);

        public string ObtenerCodigoQR(DataInput data);

    }
}