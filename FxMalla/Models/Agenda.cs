using FxMalla.Models.Entities;

using Newtonsoft.Json;

namespace FxMalla.Models
{
    public class Agenda
    {
        [JsonProperty("Fecha", Required = Required.Always)]
        public string Fecha { get; set; }

        [JsonProperty("diaSemana", Required = Required.Always)]
        public string DiaSemana { get; set; }

        [JsonProperty("tiempos", Required = Required.Default)]
        public Tiempo[] Tiempos { get; set; }
    }
}