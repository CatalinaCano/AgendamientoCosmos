using Newtonsoft.Json;

namespace FxMalla.Models.DataTransferObjects
{
    public class SedeDto
    {
        [JsonProperty("pkSede")]
        public string PkSede { get; set; }

        [JsonProperty("inactivarFestivos")]
        public bool InactivarFestivos { get; set; }

        [JsonProperty("idSubSede")]
        public string IdSubSede { get; set; }

        [JsonProperty("nombreSubSede")]
        public string NombreSubSede { get; set; }

        [JsonProperty("horaInicio")]
        public string HoraInicio { get; set; }

        [JsonProperty("horaFin")]
        public string HoraFin { get; set; }

        [JsonProperty("intervaloAtencion")]
        public long IntervaloAtencion { get; set; }

        [JsonProperty("numeroPersonasAtencion")]
        public long NumeroPersonasAtencion { get; set; }

        [JsonProperty("diasOffline")]
        public string[] DiasOffline { get; set; }

        [JsonProperty("tiemposOffline")]
        public TiempoOffline[] TiemposOffline { get; set; }
    }
}