using Newtonsoft.Json;

namespace FxMalla.Models.DataTransferObjects
{
    public class ServicioDto
    {
        [JsonProperty("pkSede")]
        public string PkSede { get; set; }

        [JsonProperty("idSubSede")]
        public string IdSubSede { get; set; }

        [JsonProperty("prioridad")]
        public int Prioridad { get; set; }
    }
}