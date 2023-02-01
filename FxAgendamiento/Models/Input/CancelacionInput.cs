using FxAgendamiento.OpenApi;

using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Attributes;

using Newtonsoft.Json;

namespace FxAgendamiento.Models.Input
{
    [OpenApiExample(typeof(CancelacionInputExample))]
    public class CancelacionInput
    {
        [JsonProperty("idTramite", Required = Required.Always)]
        [OpenApiProperty(Description = "Llave primaria del tramite a cancelar.", Nullable = false)]
        public string IdTramite { get; set; }

        [JsonProperty("idMalla", Required = Required.Always)]
        [OpenApiProperty(Description = "Llave primaria de la malla.", Nullable = false)]
        public string IdMalla { get; set; }

        [JsonProperty("idSede", Required = Required.Always)]
        [OpenApiProperty(Description = "Llave primaria de la sede.", Nullable = false)]
        public string IdSede { get; set; }

        [JsonProperty("idSubSede", Required = Required.Always)]
        [OpenApiProperty(Description = "LLave primaria de la subsede", Nullable = false)]
        public string IdSubSede { get; set; }

        [JsonProperty("fechaCita", Required = Required.Always)]
        [OpenApiProperty(Description = "Fecha de la cita.", Nullable = false)]
        public string FechaCita { get; set; }

        [JsonProperty("idUsuario", Required = Required.Always)]
        [OpenApiProperty(Description = "Llave primaria de la persona que esta solicitando la operación.", Nullable = false)]
        public string IdUsuario { get; set; }
    }
}