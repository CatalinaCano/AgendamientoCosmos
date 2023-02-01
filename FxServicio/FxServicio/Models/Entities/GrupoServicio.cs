using System;

namespace FxServicio.Models.Entities
{
    public class GrupoServicio
    {
        public string Id { get; set; }

        public string NombreGrupoServicio { get; set; }

        public bool Activo { get; set; }

        public string UsuarioCreacion { get; set; }

        public DateTimeOffset FechaCrecion { get; set; }

        public string UsuarioModificacion { get; set; }

        public DateTimeOffset FechaModificacion { get; set; }
    }
}
