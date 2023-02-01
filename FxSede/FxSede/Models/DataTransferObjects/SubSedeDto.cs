using System.Collections.Generic;

namespace FxSede.Models.DataTransferObjects
{
    //Agregar lo de OPEN API
    public class SubSedeDto
    {
        public string idSubSede { get; set; }

        public string nombre { get; set; }

        public string horaInicio { get; set; }

        public string horaFin { get; set; }

        public int intervalo { get; set; }

        public int numeroPersonas { get; set; }

        public string[] diasOffline { get; set; }

        public List<TiempoOfflineDto> tiemposOffline { get; set; }
        public List<ServicioDto> servicios { get; set; }
    }
}