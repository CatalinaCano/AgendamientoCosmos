using Newtonsoft.Json;

using System;

namespace FxCodigoQR.Models.Entities
{
    public class CodigoQR
    {
        [JsonProperty("id")]
        public string Id { get; set; }

        [JsonProperty("idUsuario")]
        public string IdUsuario { get; set; }

        [JsonProperty("idTramite")]
        public string IdTramite { get; set; }

        [JsonProperty("datos")]
        public string Datos { get; set; }

        [JsonProperty("tiempoActivacion")]
        public long TiempoActivacion { get; set; }

        [JsonProperty("tiempoCaducidad")]
        public long TiempoCaducidad { get; set; }

        [JsonProperty("fechaCreacion")]
        public DateTimeOffset FechaCreacion { get; set; }
    }
}