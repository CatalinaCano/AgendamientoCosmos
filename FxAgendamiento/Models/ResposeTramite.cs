namespace FxAgendamiento.Models
{
    public class ResposeTramite
    {
#nullable enable
        public string? IdTramite { get; set; }

        public bool? Activo { get; set; }
        public string? IdMalla { get; set; }

        public string? IdSede { get; set; }

        public string? IdSubsede { get; set; }

        public string? EstadoCita { get; set; }

        public string? PuntoAtencion { get; set; }
        public string? Tramite { get; set; }
        public string? Fecha { get; set; }
        public string? Hora { get; set; }

        public string? NumeroDocumento { get; set; }
        public string? NombresApellidos { get; set; }

        public string? CorreoElectronico { get; set; }

        public bool? TramiteVirtual { get; set; }

        public string? TipoPago { get; set; }
        public string? DuracionServicio { get; set; }
#nullable disable
    }
}