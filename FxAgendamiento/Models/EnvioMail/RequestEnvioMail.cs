using Newtonsoft.Json;

namespace FxAgendamiento.Models.EnvioMail
{
    public class RequestEnvioMail
    {
        [JsonProperty("fuente", Required = Required.Always)]
        public string Fuente { get; set; }

        [JsonProperty("idCliente", Required = Required.Always)]
        public string IdCliente { get; set; }

        [JsonProperty("idServicio", Required = Required.Always)]
        public string IdServicio { get; set; }

        [JsonProperty("idTemplate", Required = Required.Always)]
        public string IdTemplate { get; set; }

        [JsonProperty("destinatario", Required = Required.Always)]
        public string Destinatario { get; set; }

        [JsonProperty("mascaraDestinatario", Required = Required.Always)]
        public string MascaraDestinatario { get; set; }

        [JsonProperty("agendamiento", Required = Required.Default)]
        public Agendamiento Agendamiento { get; set; }

#nullable enable

        [JsonProperty("parametros", Required = Required.Default)]
        public Parametro[]? Parametros { get; set; }

#nullable disable
    }
}