using Newtonsoft.Json;

namespace FxMalla.Models.DataTransferObjects
{
    public class RespuestaTiempo

    {
        [JsonProperty("pkMalla")]
        public string PkMalla { get; set; }

        [JsonProperty("pkSede")]
        public string PkSede { get; set; }

        [JsonProperty("PkSubSede")]
        public string PkSubSede { get; set; }

        [JsonProperty("Fecha")]
        public string Fecha { get; set; }

        [JsonProperty("horaInicio")]
        public string HoraInicio { get; set; }
    }
}