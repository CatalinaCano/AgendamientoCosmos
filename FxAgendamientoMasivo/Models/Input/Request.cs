using FxAgendamientoMasivo.OpenApi;

using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Attributes;

using Newtonsoft.Json;

namespace FxAgendamientoMasivo.Models.Input
{
    [OpenApiExample(typeof(RequestExample))]
    public class Request
    {
        [JsonProperty("file", Required = Required.Always)]
        [OpenApiProperty(Description = "Base 64 de la base que se va a cargar", Nullable = false)]
        public string File { get; set; }
    }
}