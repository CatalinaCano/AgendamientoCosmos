using System;
using System.Collections.Generic;

namespace FxSede.Models.Entities
{
    public class SubSede
    {
        public string IdSubSede { get; set; }

        public string NombreSubSede { get; set; }

        public string HoraInicio { get; set; }

        public string HoraFin { get; set; }

        public int IntervaloAtencion { get; set; }

        public int NumeroPersonasAtencion { get; set; }

        public string[] DiasOffline { get; set; }

        public bool Activo { get; set; }

        public string UsuarioCreacion { get; set; }

        public DateTimeOffset FechaCreacion { get; set; }

        public string UsuarioModificacion { get; set; }

        public DateTimeOffset FechaModificacion { get; set; }

        public List<TiempoOffline> TiemposOffline { get; set; }

        public List<Servicio> Servicios { get; set; }
    }
}