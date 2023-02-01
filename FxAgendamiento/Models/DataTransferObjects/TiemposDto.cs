using Newtonsoft.Json;

namespace FxAgendamiento.Models.DataTransferObjects
{
    public partial class TiempoDto
    {
        
        [JsonProperty("horaInicio")]
        public string HoraInicio { get; set; }

        [JsonProperty("agendaDisponible")]
        public bool AgendaDisponible { get; set; }

        [JsonProperty("usuariosVetados")]
        public string[] UsuariosVetados { get; set; }

    }
}
