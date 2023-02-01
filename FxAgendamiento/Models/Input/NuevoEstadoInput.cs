using FxAgendamiento.OpenApi;

using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Attributes;

using Newtonsoft.Json;

namespace FxAgendamiento.Models.Input
{
    [OpenApiExample(typeof(NuevoEstadoInputExample))]
    public class NuevoEstadoInput
    {
        [JsonProperty("idUsuario")]
        [OpenApiProperty(Description = "Identificador unico del usuario que esta solicitando la operación", Nullable = false)]
        public string IdUsuario { get; set; }

        [JsonProperty("estado")]
        [OpenApiProperty(Description = "Estado que desea ser agregado", Nullable = false)]
        public string Estado { get; set; }

        [JsonProperty("idTramite")]
        [OpenApiProperty(Description = "Identificador único del tramite", Nullable = false)]
        public string IdTramite { get; set; }

#nullable enable
        [OpenApiProperty(Description = "Identificador de la campaña con la que fue enviada la comunicacion", Nullable = true)]
        [JsonProperty("idCampania")]
        public string? IdCampania { get; set; }
        [OpenApiProperty(Description = "Código QR", Nullable = true)]
        [JsonProperty("QRCode")]
        public string? QRCode { get; set; }
        #nullable disable
    }
}