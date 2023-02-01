using FxGrupoTramite.OpenApi;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Attributes;

using Newtonsoft.Json;

namespace FxGrupoTramite.Models.Input
{
    [OpenApiExample(typeof(GrupoTramiteExample))]
    public class GrupoTramiteInput
    {
        [JsonProperty("nombreGrupoTramite", Required = Required.Always)]
        public string NombreGrupoTramite { get; set; }

        [JsonProperty("descripcionGrupoTramite", Required = Required.Default)]
        public string DescripcionGrupoTramite { get; set; }

        [JsonProperty("icono", Required = Required.Default)]
        public string Icono { get; set; }

        [JsonProperty("activo", Required = Required.Default)]
        public bool? Activo { get; set; } = true;

        [JsonProperty("usuario", Required = Required.Always)]
        public string Usuario { get; set; }
    }
}