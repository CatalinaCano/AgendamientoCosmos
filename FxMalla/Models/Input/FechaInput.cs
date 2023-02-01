using Newtonsoft.Json;

namespace FxMalla.Models.Input
{
    public class FechaInput
    {
        [JsonProperty("FechaInicio", Required = Required.Always)]
        public string FechaInicio { get; set; }
        [JsonProperty("FechaFin", Required = Required.Always)]
        public string FechaFin { get; set; }
    }
}
