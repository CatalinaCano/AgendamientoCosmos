using FxCodigoQR.OpenApi;

using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Attributes;

using Newtonsoft.Json;

namespace FxCodigoQR.Models.Input
{
    [OpenApiExample(typeof(DataInputExample))]
    public class DataInput
    {
        [JsonProperty("idTramite")]
        [OpenApiProperty(Description = "Identificador de la cita", Nullable = false)]
        public string IdTramite { get; set; }

        [JsonProperty("idUsuario")]
        [OpenApiProperty(Description = "Identificador único del usuario", Nullable = false)]
        public string IdUsuario { get; set; }

        [JsonProperty("data")]
        [OpenApiProperty(Description = "Datos con los cuales necesita ser generado el codifo QR", Nullable = false)]
        public string Data { get; set; }
    }
}