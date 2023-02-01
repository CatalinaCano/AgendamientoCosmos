using Newtonsoft.Json;

namespace FxSede.Models.Input
{
    public class ServicioInput
    {
        [JsonProperty("idServicio", Required = Required.Always)]
        public string IdServicio { get; set; }

        [JsonProperty("activo", Required = Required.Default)]
        public bool Activo { get; set; }

        [JsonProperty("prioridad", Required = Required.Always)]
        public int Prioridad { get; set; }
    }
}