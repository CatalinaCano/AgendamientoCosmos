using FxCodigoQR.OpenApi;

using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Attributes;

using Newtonsoft.Json;

namespace FxCodigoQR.Models.DataTransferObjects
{
    [OpenApiExample(typeof(ResponseExample))]
    public class QRDto
    {
        [JsonProperty("qrbase64")]
        [OpenApiProperty(Description = "Cadena a Convertir en Bae 64", Nullable = false)]
        public string qrbase64 { get; set; }
    }
}