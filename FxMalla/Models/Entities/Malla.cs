using Newtonsoft.Json;

using System;
using System.Collections.Generic;

namespace FxMalla.Models.Entities
{
    public class Malla
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
}