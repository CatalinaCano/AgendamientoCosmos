using FxAgendamiento.OpenApi;

using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Attributes;

using Newtonsoft.Json;

namespace FxAgendamiento.Models
{

    [OpenApiExample(typeof(ResponseCitasAtenderExample))]
    public class ResponseCitasAtender
    {
        #nullable enable
        [JsonProperty("nombres")]
        public string? Nombres { get; set; }

        [JsonProperty("numeroDocumento")]
        public string? NumeroDocumento { get; set; }

        [JsonProperty("correoElectronico")]
        public string? CorreoElectronico { get; set; }

        [JsonProperty("servicio")]
        public string? NombreServicio { get; set; }

        [JsonProperty("tiempoAtencion")]
        public string? DuracionServicio { get; set; }
        #nullable disable
    }
}
