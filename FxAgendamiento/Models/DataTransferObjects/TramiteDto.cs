namespace FxAgendamiento.Models.DataTransferObjects
{
    public class TramiteDto
    {
        public string HoraInicio { get; set; }
        public string HoraFin { get; set; }
        public bool AgendaDisponible { get; set; }
        public long CantidadPersonas { get; set; }
        public string[] Tramites { get; set; }
    }
}