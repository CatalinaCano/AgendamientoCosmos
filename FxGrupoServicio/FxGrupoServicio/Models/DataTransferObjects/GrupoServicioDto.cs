using Newtonsoft.Json;

namespace FxGrupoServicio.Models.DataTransferObjects
{
    public class GrupoServicioDto
    {
        public string idGrupoTramite { get; set; }
        public string idGrupoServicio { get; set; }
        public string nombreGrupoServicio { get; set; }
        public string descripcionGrupoServicio { get; set; }

    }
}