using FxServicio.OpenApi;

using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Attributes;

namespace FxServicio.Models.DataTransferObjects
{
    [OpenApiExample(typeof(ResponseServicioExample))]
    public class ServicioDto
    {
        public string idServicio { get; set; }
        public string idGrupoServicio { get; set; }

        public string nombreServicio { get; set; }

        public string descripcionServicio { get; set; }

        public int tiempo { get; set; }

        public int numeroPersonas { get; set; }

        public bool tramiteVirtual { get; set; }

        public bool tramitePresencial { get; set; }

        public string tipoPago { get; set; }
    }
}