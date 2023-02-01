using Newtonsoft.Json;

namespace FxAgendamiento.Models.EnvioMail
{
    public class Parametro
    {
        [JsonProperty("nombre")]
        public string Nombre { get; set; }

        [JsonProperty("valor")]
        public string Valor { get; set; }
    }
}