using Newtonsoft.Json;

using System;

namespace FxMalla.Models.DataTransferObjects
{
    public class TramiteDto
    {
        [JsonProperty("idUsuario")]
        public string IdUsuario { get; set; }

        [JsonProperty("pkTramite")]
        public string PkTramite { get; set; }

        [JsonProperty("fechaRegistro")]
        public DateTimeOffset FechaRegistro { get; set; }

        [JsonProperty("activo")]
        public bool Activo { get; set; }

        [JsonProperty("nombreEstado")]
        public string NombreEstado { get; set; }

        [JsonProperty("pkServicio")]
        public string PkServicio { get; set; }

        [JsonProperty("duracionServicio")]
        public long DuracionServicio { get; set; }
    }
}