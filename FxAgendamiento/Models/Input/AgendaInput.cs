using FxAgendamiento.OpenApi;

using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Attributes;

using Newtonsoft.Json;

namespace FxAgendamiento.Models.Input
{
    [OpenApiExample(typeof(AgendaInputExample))]
    public class AgendaInput
    {
        [JsonProperty("idUsuario", Required = Required.Always)]
        [OpenApiProperty(Description = "Llave primaria de la persona que esta solicitando la operación.", Nullable = false)]
        public string IdUsuario { get; set; }

        [JsonProperty("idMalla", Required = Required.Always)]
        [OpenApiProperty(Description = "Llave primaria de la malla.", Nullable = false)]
        public string IdMalla { get; set; }

        [JsonProperty("idSede", Required = Required.Always)]
        [OpenApiProperty(Description = "Llave primaria de la sede.", Nullable = false)]
        public string IdSede { get; set; }

        [JsonProperty("idSubSede", Required = Required.Always)]
        [OpenApiProperty(Description = "LLave primaria de la subsede", Nullable = false)]
        public string IdSubSede { get; set; }

        [JsonProperty("idServicio", Required = Required.Always)]
        [OpenApiProperty(Description = "Llave primaria del servicio", Nullable = false)]
        public string IdServicio { get; set; }

        [JsonProperty("fechaAgendamiento", Required = Required.Always)]
        [OpenApiProperty(Description = "Fecha de la cita.", Nullable = false)]
        public string FechaAgendamiento { get; set; }

        [JsonProperty("horaAgendamiento", Required = Required.Always)]
        [OpenApiProperty(Description = "Hora en la cual se va a solicitar la cita", Nullable = false)]
        public string HoraAgendamiento { get; set; }

        [JsonProperty("ip", Required = Required.Always)]
        [OpenApiProperty(Description = "Dirección IP desde la cuál se esta haciendo la solicitud. Debe corresponder con una dirección IP Válida", Nullable = false)]
        public string Ip { get; set; }
    }
}