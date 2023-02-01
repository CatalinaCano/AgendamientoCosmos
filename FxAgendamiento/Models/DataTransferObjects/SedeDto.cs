using Newtonsoft.Json;

namespace FxAgendamiento.Models.DataTransferObjects
{
    public class SedeDto
    {
        [JsonProperty("nombreSede")]
        public string NombreSede { get; set; }

        [JsonProperty("direccion")]
        public string Direccion { get; set; }

        [JsonProperty("nombreSubSede")]
        public string NombreSubSede { get; set; }

        [JsonProperty("intervaloAtencion")]
        public long IntervaloAtencion { get; set; }
    }
}