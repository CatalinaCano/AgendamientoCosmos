using Newtonsoft.Json;

using System.ComponentModel.DataAnnotations;

namespace FxSede.Models.Input
{
    public class TiempoOfflineInput
    {
        [JsonProperty("horaInicio", Required = Required.Always)]
        public string HoraInicio { get; set; }

        [JsonProperty("horaFin", Required = Required.Always)]
        public string HoraFin { get; set; }

        [JsonProperty("dias", Required = Required.Always)]
        [Required, MinLength(1),MaxLength(7)]
        public string[] Dias { get; set; }
    }
}