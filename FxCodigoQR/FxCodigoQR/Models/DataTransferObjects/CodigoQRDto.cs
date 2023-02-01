using Newtonsoft.Json;

namespace FxCodigoQR.Models.DataTransferObjects
{
    public class CodigoQRDto
    {
        [JsonProperty("idTramite")]
        public string IdTramite { get; set; }

        [JsonProperty("idUsuario")]
        public string IdUsuario { get; set; }

        [JsonProperty("tiempoActivacion")]
        public long TiempoActivacion { get; set; }

        [JsonProperty("tiempoCaducidad")]
        public long TiempoCaducidad { get; set; }
    }
}