using Newtonsoft.Json;

using System;
using System.Collections.Generic;

namespace FxMalla.Models.Entities
{
    public partial class MallasPorSubSede
    {
        [JsonProperty("pkSubSede")]
        public string PkSubSede { get; set; }

        [JsonProperty("tiemposAtencion")]
        public List<Agenda> TiemposAtencion { get; set; }
    }

    public partial class TiemposAtencion
    {
        [JsonProperty("fecha")]
        public string Fecha { get; set; }

        [JsonProperty("diaSemana")]
        public string DiaSemana { get; set; }

        [JsonProperty("tiempos")]
        public Tiempo[] Tiempos { get; set; }
    }

    public partial class Tiempo
    {
        [JsonProperty("idTiempoMalla")]
        public string IdTiempoMalla { get; set; }

        [JsonProperty("horaInicio")]
        public string HoraInicio { get; set; }

        [JsonProperty("horaFin")]
        public string HoraFin { get; set; }

        [JsonProperty("agendaDisponible")]
        public bool AgendaDisponible { get; set; }

        [JsonProperty("cantidadPersonas")]
        public long CantidadPersonas { get; set; }

        [JsonProperty("tramites", Required = Required.Default)]
        public string[] Tramites { get; set; } = Array.Empty<string>();

        [JsonProperty("usuariosVetados", Required = Required.Default)]
        public string[] UsuariosVetados { get; set; } = Array.Empty<string>();
    }
}