using Newtonsoft.Json;

namespace FxMonitorizaCitas.Models.DataTransferObjects
{
    public class TramitesDiaDto
    {
        [JsonProperty("idUsuario")]
        public string IdUsuario { get; set; }

        [JsonProperty("idCita")]
        public string IdCita { get; set; }

        [JsonProperty("fechaAgendamiento")]
        public string FechaAgendamiento { get; set; }

        [JsonProperty("horaAgendamiento")]
        public string HoraAgendamiento { get; set; }
    }
}