using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Attributes;

using Newtonsoft.Json;

namespace FxTiposPago.Models
{
    public class TipoDato
    {
        [JsonProperty("tipoPago")]
        [OpenApiProperty(Description = "Monto de la transaccion, Sólo son validos números mayores a 0.", Nullable = false)]
        public string pk_sat_tipo_pago { get; set; }

        [JsonProperty("idTipoPago")]
        [OpenApiProperty(Description = "Monto de la transaccion, Sólo son validos números mayores a 0.", Nullable = false)]
        public string fk_hub_tipo_pago { get; set; }
    }
}