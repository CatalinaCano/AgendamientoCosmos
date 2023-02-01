using Newtonsoft.Json;

namespace FxCodigoQR.Models.DataTransferObjects
{
    public class CitasDto
    {
        [JsonProperty("id")]
        public string Id { get; set; }

        [JsonProperty("activo")]
        public bool Activo { get; set; }

        [JsonProperty("nombreEstado")]
        public string NombreEstado { get; set; }

        [JsonProperty("pkTramite")]
        public string PkTramite { get; set; }

        [JsonProperty("pkMalla")]
        public string PkMalla { get; set; }

        [JsonProperty("pkSede")]
        public string PkSede { get; set; }

        [JsonProperty("pkSubsede")]
        public string PkSubSede { get; set; }

        [JsonProperty("pkServicio")]
        public string PkServicio { get; set; }

        [JsonProperty("fechaAgendamiento")]
        public string FechaAgendamiento { get; set; }

        [JsonProperty("horaAgendamiento")]
        public string HoraAgendamiento { get; set; }

        [JsonProperty("duracionServicio")]
        public long DuracionServicio { get; set; }
    }
}