namespace FxAgendamiento.Models.DataTransferObjects
{
    public class TramiteEnEsperaDto
    {
        public string idUsuario { get; set; }
        public string idServicio { get; set; }
        public string fechaAgendamiento { get; set; }
        public string horaAgendamiento { get; set; }
        public string duracionServicio { get; set; }
    }
}
