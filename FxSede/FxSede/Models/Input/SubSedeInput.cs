using Newtonsoft.Json;

using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace FxSede.Models.Input
{
    public class SubSedeInput
    {
#nullable enable

        [JsonProperty("idSubSede", Required = Required.Default)]
        public string? IdSubSede { get; set; }

        [JsonProperty("diasOffline", Required = Required.Default)]
        public string[]? DiasOffline { get; set; }
        [JsonProperty("tiemposOffline", Required = Required.Default)]
        public List<TiempoOfflineInput>? TiemposOffline { get; set; }

#nullable disable

        [JsonProperty("nombre", Required = Required.Always)]
        public string NombreSubSede { get; set; }

        [JsonProperty("horaInicio", Required = Required.Always)]
        public string HoraInicio { get; set; }

        [JsonProperty("horaFin", Required = Required.Always)]
        public string HoraFin { get; set; }

        [JsonProperty("intervalo", Required = Required.Always)]
        public int IntervaloAtencion { get; set; }

        [JsonProperty("numeroPersonas", Required = Required.Always)]
        public int NumeroPersonasAtencion { get; set; }

        [JsonProperty("usuario", Required = Required.Always)]
        public string Usuario { get; set; }

        [JsonProperty("servicios", Required = Required.Always)]
        [Required, MinLength(1)]
        public List<ServicioInput> Servicios { get; set; }

        [JsonProperty("activo", Required = Required.Always)]
        public bool Activo { get; set; }

        [JsonIgnore]
        public string idSede { get; set; }
    }
}