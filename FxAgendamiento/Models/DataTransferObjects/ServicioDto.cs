namespace FxAgendamiento.Models.DataTransferObjects
{
    public class ServicioDto
    {
        public string nombreServicio { get; set; }
        public long tiempoAtencion { get; set; }

        public bool tramiteVirtual { get; set; }

        public string tipoPago { get; set; }
    }
}