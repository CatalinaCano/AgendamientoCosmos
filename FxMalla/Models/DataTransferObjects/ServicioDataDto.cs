namespace FxMalla.Models.DataTransferObjects
{
    public class ServicioDataDto
    {
        public string IdServicio { get; set; }
        public string NombreServicio { get; set; }
        public long TiempoAtencion { get; set; }
        public bool TramiteVirtual { get; set; }
        public string TipoPago { get; set; }
    }
}