using System;
using System.Collections.Generic;

namespace FxSede.Models.Entities
{
    public class Sede
    {
        public string Id { get; set; }

        public string NombreSede { get; set; }

        public string Direccion { get; set; }

        public string Telefono { get; set; }

        public string HoraInicio { get; set; }

        public string HoraFin { get; set; }

        public bool InactivarFestivos { get; set; }

        public bool Activo { get; set; }

        public string UsuarioCreacion { get; set; }

        public DateTimeOffset FechaCreacion { get; set; }

        public string UsuarioModificacion { get; set; }

        public DateTimeOffset FechaModificacion { get; set; }

        public List<SubSede> SubSedes { get; set; }
    }
}