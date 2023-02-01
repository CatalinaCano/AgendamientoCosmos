using Newtonsoft.Json;

namespace FxAgendamiento.Models.QR
{
    public class DataInput
    {
        [JsonProperty("idTramite")]        
        public string IdTramite { get; set; }

        [JsonProperty("idUsuario")]        
        public string IdUsuario { get; set; }

        [JsonProperty("data")]        
        public string Data { get; set; }
    }
}
