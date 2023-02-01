using System;

namespace FxGrupoTramite.Models.Entities
{
    public class GrupoTramite

    {
        public string Id { get; set; }

        public string NombreGrupoTramite { get; set; }

        public string DescripcionGrupoTramite { get; set; }
        public string Icono { get; set; }

        public bool Activo { get; set; }

        public string UsuarioCreacion { get; set; }

        public DateTimeOffset FechaCrecion { get; set; }

        public string UsuarioModificacion { get; set; }

        public DateTimeOffset FechaModificacion { get; set; }
    }
}