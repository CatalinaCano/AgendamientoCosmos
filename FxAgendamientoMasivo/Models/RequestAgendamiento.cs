using Newtonsoft.Json;

namespace FxAgendamientoMasivo.Models
{
    public class RequestAgendamiento
    {
        [JsonProperty("idUsuario")]
        public string IdUsuario { get; set; }

        [JsonProperty("idMalla")]
        public string IdMalla { get; set; }

        [JsonProperty("idSede")]
        public string IdSede { get; set; }

        [JsonProperty("idSubSede")]
        public string IdSubSede { get; set; }

        [JsonProperty("idServicio")]
        public string IdServicio { get; set; }

        [JsonProperty("fechaAgendamiento")]
        public string FechaAgendamiento { get; set; }

        [JsonProperty("horaAgendamiento")]
        public string HoraAgendamiento { get; set; }

        [JsonProperty("ip")]
        public string Ip { get; set; }
    }
}