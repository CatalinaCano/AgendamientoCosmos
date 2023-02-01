using Newtonsoft.Json;

namespace FxAgendamiento.Models.DataTransferObjects
{
    public class CancelacionDto
    {
        [JsonProperty("horaInicio")]
        public string HoraInicio { get; set; }

        [JsonProperty("horaFin")]
        public string HoraFin { get; set; }

        [JsonProperty("agendaDisponible")]
        public bool AgendaDisponible { get; set; }

        [JsonProperty("cantidadPersonas")]
        public long CantidadPersonas { get; set; }

        [JsonProperty("tramites")]
        public string[] Tramites { get; set; }
    }
}