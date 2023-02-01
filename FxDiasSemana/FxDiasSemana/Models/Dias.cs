using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Attributes;

using Newtonsoft.Json;

namespace FxDiasSemana.Models
{
    public class Dias
    {
        [JsonProperty("idDia")]
        [OpenApiProperty(Description = "Id del dia", Nullable = false)]
        public int pk_numero_dia { get; set; }

        [JsonProperty("nombreIngles")]
        [OpenApiProperty(Description = "Nombre del dia en Inglés", Nullable = false)]
        public string nombre_dia_ingles { get; set; }

        [JsonProperty("nombreEspanol")]
        [OpenApiProperty(Description = "Nombre del dia en Español", Nullable = false)]
        public string nombre_dia_español { get; set; }
    }
}