using FxSede.OpenApi;

using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Attributes;

namespace FxSede.Models.DataTransferObjects
{
    [OpenApiExample(typeof(ResponseSede))]
    public class SedeDto
    {
        [OpenApiProperty(Description = "Identificador único de la Sede", Nullable = false)]
        public string idSede { get; set; }

        [OpenApiProperty(Description = "Nombre de la Sede", Nullable = false)]
        public string nombre { get; set; }

        [OpenApiProperty(Description = "Dirección de la Sede", Nullable = false)]
        public string direccion { get; set; }

        [OpenApiProperty(Description = "Número de teléfono de la Sede", Nullable = false)]
        public string telefono { get; set; }

        [OpenApiProperty(Description = "Hora en la que abre la Sede", Nullable = false)]
        public string horaInicio { get; set; }

        [OpenApiProperty(Description = "Hora en la que cierra la Sede", Nullable = false)]
        public string horaFin { get; set; }

        [OpenApiProperty(Description = "Bandera que inidica si se deben inactivar los festivos para la malla de la Sede", Nullable = false)]
        public bool inactivarFestivos { get; set; }
    }
}