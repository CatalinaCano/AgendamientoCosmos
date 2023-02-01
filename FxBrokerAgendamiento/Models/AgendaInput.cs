using Newtonsoft.Json;

namespace FxBrokerAgendamiento.Models
{
    public class AgendaInput
    {
        [JsonProperty("idUsuario", Required = Required.Always)]
        public string IdUsuario { get; set; }

        [JsonProperty("idMalla", Required = Required.Always)]
        public string IdMalla { get; set; }

        [JsonProperty("idSede", Required = Required.Always)]
        public string IdSede { get; set; }

        [JsonProperty("idSubSede", Required = Required.Always)]
        public string IdSubSede { get; set; }

        [JsonProperty("idServicio", Required = Required.Always)]
        public string IdServicio { get; set; }

        [JsonProperty("fechaAgendamiento", Required = Required.Always)]
        public string FechaAgendamiento { get; set; }

        [JsonProperty("horaAgendamiento", Required = Required.Always)]
        public string HoraAgendamiento { get; set; }

        [JsonProperty("ip", Required = Required.Always)]
        public string Ip { get; set; }
    }
}