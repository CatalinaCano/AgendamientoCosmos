using FxSede.OpenApi;

using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Attributes;

using Newtonsoft.Json;

namespace FxSede.Models.Input
{
    [OpenApiExample(typeof(SedeExample))]
    public class SedeInput
    {
        [JsonProperty("nombre", Required = Required.Always)]
        [OpenApiProperty(Description = "Nombre de la Sede", Nullable = false)]
        public string NombreSede { get; set; }

        [JsonProperty("direccion", Required = Required.Always)]
        [OpenApiProperty(Description = "Direccion de la Sede", Nullable = false)]
        public string Direccion { get; set; }

        [JsonProperty("telefono", Required = Required.Always)]
        [OpenApiProperty(Description = "Número de Teléfono de la Sede", Nullable = false)]
        public string Telefono { get; set; }

        [JsonProperty("horaInicio", Required = Required.Always)]
        [OpenApiProperty(Description = "Hora en la que abre la Sede", Nullable = false)]
        public string HoraInicio { get; set; }

        [JsonProperty("horaFin", Required = Required.Always)]
        [OpenApiProperty(Description = "Hora en la que cierra la Sede", Nullable = false)]
        public string HoraFin { get; set; }

        [JsonProperty("inactivarFestivos", Required = Required.Always)]
        [OpenApiProperty(Description = "Bandera que inidica si se deben inactivar los festivos para la malla de la Sede", Nullable = false)]
        public bool InactivarFestivos { get; set; }

        [JsonProperty("activo", Required = Required.Default)]
        [OpenApiProperty(Description = "Bandera que indica si la Sede está activa", Nullable = true)]
        public bool? Activo { get; set; } = true;

        [JsonProperty("usuario", Required = Required.Always)]
        [OpenApiProperty(Description = "Usuario que realizá la operación", Nullable = true)]
        public string Usuario { get; set; }
    }
}