using Newtonsoft.Json;

namespace FxAgendamiento.Models.DataTransferObjects
{
    public class SolicitudesDto
    {
        [JsonProperty("CantidadSolicitudes")]
        public long CantidadSolicitudes { get; set; }
    }
}