namespace FxAgendamiento.Models.DataTransferObjects
{
    public class PlantillaDto
    {
        public long cliente { get; set; }

        public long servicio { get; set; }

        public long plantilla { get; set; }

        public bool es_dinamica { get; set; }

        public string orden_parametros { get; set; }

        public string param_url_base { get; set; }
    }
}