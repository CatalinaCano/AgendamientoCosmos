using Newtonsoft.Json;

namespace FxMalla.Models
{
    public class Festivo
    {
        [JsonProperty("idFecha")]
        public string IdFecha { get; set; }

        [JsonProperty("Fecha")]
        public string Fecha { get; set; }

        [JsonProperty("nombreEspanol")]
        public string NombreEspanol { get; set; }

        [JsonProperty("nombreIngles")]
        public string NombreIngles { get; set; }
    }
}