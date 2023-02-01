using System;

namespace FxMalla.Models.Input
{
    public class AgendaInput
    {
        public DateTime FechaInicio { get; set; }
        public DateTime FechaFin { get; set; }

        public string HoraInicio { get; set; }
        public string HoraFin { get; set; }

        public long Intervalo { get; set; }

        public long CantidadPersonas { get; set; }

        public string[] DiasOffline { get; set; }

        public TiempoOffline[] TiemposOffline { get; set; }

        public bool InactivaFestivos { get; set; }
    }
}