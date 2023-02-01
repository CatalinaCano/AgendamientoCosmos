using Newtonsoft.Json;

namespace FxMalla.Models
{
    public class RespuestaTiempos
    {
        [JsonProperty("idMalla")]
        public string IdMalla { get; set; }

        [JsonProperty("idSede")]
        public string IdSede { get; set; }

        [JsonProperty("idSubSede")]
        public string IdSubSede { get; set; }

        [JsonProperty("fecha")]
        public string Fecha { get; set; }

        [JsonProperty("hora")]
        public string Hora { get; set; }
    }
}