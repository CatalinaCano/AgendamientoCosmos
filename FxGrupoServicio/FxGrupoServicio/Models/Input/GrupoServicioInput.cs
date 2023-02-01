using Newtonsoft.Json;

namespace FxGrupoServicio.Models.Input
{
    public class GrupoServicioInput
    {

        [JsonProperty("idGrupoTramite", Required = Required.Always)]
        public string IdGrupoTramite { get; set; }

        [JsonProperty("nombreGrupoServicio", Required = Required.Always)]
        public string NombreGrupoServicio { get; set; }

        [JsonProperty("descripcionGrupoServicio", Required = Required.Default)]
        public string DescripcionGrupoServicio { get; set; }

        [JsonProperty("activo", Required = Required.Default)]
        public bool? Activo { get; set; } = true;

        [JsonProperty("usuario", Required = Required.Always)]
        public string Usuario { get; set; }
    }
}