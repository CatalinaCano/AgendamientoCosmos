using FxMalla.OpenApi;

using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Attributes;

using Newtonsoft.Json;

namespace FxMalla.Models.Input
{
    [OpenApiExample(typeof(InputMallaExample))]
    public class MallaInput
    {
        [JsonProperty("FechaInicio", Required = Required.Always)]
        [OpenApiProperty(Description = "Fecha de inicio de la malla", Nullable = false)]
        public string FechaInicio { get; set; }

        [JsonProperty("fechaFin", Required = Required.Always)]
        [OpenApiProperty(Description = "Fecha de fin de la malla", Nullable = false)]
        public string FechaFin { get; set; }

        [JsonProperty("idSede", Required = Required.Always)]
        [OpenApiProperty(Description = "Llave primaria de la sede a la cual se le va a crear la sede", Nullable = false)]
        public string IdSede { get; set; }

        [JsonProperty("usuario", Required = Required.Always)]
        [OpenApiProperty(Description = "Usuario que esta realizando la acción sobre el sistema", Nullable = false)]
        public string Usuario { get; set; }
    }
}