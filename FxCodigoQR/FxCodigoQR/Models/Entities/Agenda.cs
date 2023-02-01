using Newtonsoft.Json;

using System;
using System.Collections.Generic;

namespace FxCodigoQR.Models.Entities
{
    public partial class Agenda
    {
        [JsonProperty("id")]
        public string Id { get; set; }

        [JsonProperty("tramites")]
        public List<Tramite> Tramites { get; set; }
    }

    public partial class Tramite
    {
        [JsonProperty("pkTramite")]
        public string PkTramite { get; set; }

        [JsonProperty("pkSede")]
        public string PkSede { get; set; }

        [JsonProperty("pkSubSede")]
        public string PkSubSede { get; set; }

        [JsonProperty("pkMalla")]
        public string PkMalla { get; set; }

        [JsonProperty("fechaRegistro")]
        public DateTimeOffset FechaRegistro { get; set; }

        [JsonProperty("ipRegistro")]
        public string IpRegistro { get; set; }

        [JsonProperty("activo")]
        public bool Activo { get; set; }

        [JsonProperty("servicio")]
        public Servicio Servicio { get; set; }

        [JsonProperty("estados")]
        public List<Estado> Estados { get; set; }
    }

    public partial class Estado
    {
        [JsonProperty("nombreEstado")]
        public string NombreEstado { get; set; }

        [JsonProperty("fechaEstado")]
        public DateTimeOffset FechaEstado { get; set; }

#nullable enable

        [JsonProperty("idCampania", NullValueHandling = NullValueHandling.Ignore)]
        public string? IdCampania { get; set; }

        [JsonProperty("codigoQR", NullValueHandling = NullValueHandling.Ignore)]
        public string? CodigoQr { get; set; }

#nullable disable
    }

    public partial class Servicio
    {
        [JsonProperty("pkServicio")]
        public string PkServicio { get; set; }

        [JsonProperty("fechaAgendamiento")]
        public string FechaAgendamiento { get; set; }

        [JsonProperty("horaAgendamiento")]
        public string HoraAgendamiento { get; set; }

        [JsonProperty("duracionServicio")]
        public long DuracionServicio { get; set; }
    }
}