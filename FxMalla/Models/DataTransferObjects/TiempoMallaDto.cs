using Newtonsoft.Json;

namespace FxMalla.Models.DataTransferObjects
{
    public class TiempoMallaDto
    {
        [JsonProperty("idMalla")]
        public string IdMalla { get; set; }

        [JsonProperty("idSede")]
        public string IdSede { get; set; }

        [JsonProperty("idSubSede")]
        public string IdSubSede { get; set; }

        [JsonProperty("fecha")]
        public string Fecha { get; set; }

        [JsonProperty("horaInicio")]
        public string HoraInicio { get; set; }

        [JsonProperty("usuarioVetado")]
        public bool UsuarioVetado { get; set; }
    }
}