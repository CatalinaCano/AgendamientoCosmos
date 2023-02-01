using Newtonsoft.Json;

namespace FxAgendamiento.Models.DataTransferObjects
{
    public class ValidarTramiteDto
    {
        [JsonProperty("id")]
        public string Id { get; set; }

        [JsonProperty("pkTramite")]
        public string PkTramite { get; set; }

        [JsonProperty("pkServicio")]
        public string PkServicio { get; set; }
    }
}