using System;

namespace FxServicio.Models.Entities
{
    public class Servicio
    {
        public string Id { get; set; }

        public string PkGrupoServicio { get; set; }

        public string NombreServicio { get; set; }

        public string DescripcionServicio { get; set; }

        public int TiempoAtencion { get; set; }

        public int NumeroPersonasAtencion { get; set; }

        public bool TramiteVirtual { get; set; }

        public bool TramitePresencial { get; set; }
        public string TipoPago { get; set; }

        public bool Activo { get; set; }

        public string UsuarioCreacion { get; set; }

        public DateTimeOffset FechaCrecion { get; set; }

        public string UsuarioModificacion { get; set; }

        public DateTimeOffset FechaModificacion { get; set; }
    }
}