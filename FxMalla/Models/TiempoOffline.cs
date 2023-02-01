using Newtonsoft.Json;

namespace FxMalla.Models
{
    public partial class TiempoOffline
    {
        [JsonProperty("horaInicio")]
        public string HoraInicio { get; set; }

        [JsonProperty("horaFin")]
        public string HoraFin { get; set; }

        [JsonProperty("dias")]
        public string[] Dias { get; set; }
    }
}