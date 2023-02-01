using Newtonsoft.Json;

namespace FxMonitorizarMalla.Models.DataTransferObjects
{
    public class MallaDto
    {
        [JsonProperty("id")]
        public string Id { get; set; }

        [JsonProperty("idSede")]
        public string PkSede { get; set; }

        [JsonProperty("fechaInicio")]
        public string FechaInicio { get; set; }

        [JsonProperty("fechaFin")]
        public string FechaFin { get; set; }

        [JsonProperty("activo")]
        public bool Activo { get; set; }
    }
}