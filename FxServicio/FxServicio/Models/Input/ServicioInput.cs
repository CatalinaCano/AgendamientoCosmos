using FxServicio.OpenApi;

using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Attributes;

using Newtonsoft.Json;

namespace FxServicio.Models.Input
{
    [OpenApiExample(typeof(ServicioExample))]
    public class ServicioInput
    {
        [JsonProperty("idGrupoServicio", Required = Required.Always)]
        public string IdGrupoServicio { get; set; }

        [JsonProperty("nombreServicio", Required = Required.Always)]
        public string NombreServicio { get; set; }

        [JsonProperty("descripcionServicio", Required = Required.Always)]
        public string DescripcionServicio { get; set; }

        [JsonProperty("tiempo", Required = Required.Always)]
        public int TiempoAtencion { get; set; }

        [JsonProperty("numeroPersonas", Required = Required.Always)]
        public int NumeroPersonasAtencion { get; set; }

        [JsonProperty("tramiteVirtual", Required = Required.Always)]
        public bool TramiteVirtual { get; set; }

        [JsonProperty("tramitePresencial", Required = Required.Always)]
        public bool TramitePresencial { get; set; }

        [JsonProperty("tipoPago", Required = Required.Always)]
        public string TipoPago { get; set; }

        [JsonProperty("activo", Required = Required.Default)]
        public bool? Activo { get; set; } = true;

        [JsonProperty("usuario", Required = Required.Always)]
        public string Usuario { get; set; }
    }
}