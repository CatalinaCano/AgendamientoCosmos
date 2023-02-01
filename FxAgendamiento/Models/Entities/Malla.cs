using Newtonsoft.Json;

using System;
using System.Collections.Generic;

namespace FxAgendamiento.Models.Entities
{
    public partial class Malla
    {
        [JsonProperty("id")]
        public string Id { get; set; }

        [JsonProperty("pkSede")]
        public string PkSede { get; set; }

        [JsonProperty("fechaInicio")]
        public string FechaInicio { get; set; }

        [JsonProperty("fechaFin")]
        public string FechaFin { get; set; }

        [JsonProperty("activo")]
        public bool Activo { get; set; }

        [JsonProperty("usuarioCreacion")]
        public string UsuarioCreacion { get; set; }

        [JsonProperty("fechaCreacion")]
        public DateTimeOffset FechaCreacion { get; set; }

        [JsonProperty("usuarioModificacion")]
        public object UsuarioModificacion { get; set; }

        [JsonProperty("fechaModificacion")]
        public DateTimeOffset FechaModificacion { get; set; }

        [JsonProperty("mallasPorSubSede")]
        public List<MallasPorSubSede> MallasPorSubSede { get; set; }
    }

    public partial class MallasPorSubSede
    {
        [JsonProperty("pkSubSede")]
        public string PkSubSede { get; set; }

        [JsonProperty("tiemposAtencion")]
        public List<TiemposAtencion> TiemposAtencion { get; set; }
    }

    public partial class TiemposAtencion
    {
        [JsonProperty("fecha")]
        public string Fecha { get; set; }

        [JsonProperty("diaSemana")]
        public string DiaSemana { get; set; }

        [JsonProperty("tiempos")]
        public List<Tiempo> Tiempos { get; set; }
    }

    public partial class Tiempo
    {
        [JsonProperty("horaInicio")]
        public string HoraInicio { get; set; }

        [JsonProperty("horaFin")]
        public string HoraFin { get; set; }

        [JsonProperty("agendaDisponible")]
        public bool AgendaDisponible { get; set; }

        [JsonProperty("cantidadPersonas")]
        public long CantidadPersonas { get; set; }

        [JsonProperty("tramites", Required = Required.Default)]
        public string[] Tramites { get; set; }

        [JsonProperty("usuariosVetados", Required = Required.Default)]
        public string[] UsuariosVetados { get; set; }
    }
}