using System;

namespace FxSede.Utils
{
    public static class TimeHelper
    {
        public static TimeSpan ConevrtirHora(string hora)
        {
            string[] data = hora.Split(":");

            TimeSpan result = new TimeSpan(int.Parse(data[0]), int.Parse(data[1]), 0);

            return result;
        }

        public static bool HoraMayor(dynamic property)
        {
            TimeSpan horaInicio = ConevrtirHora(property.HoraInicio);
            TimeSpan horaFin = ConevrtirHora(property.HoraFin);
            if ((horaFin - horaInicio).TotalMinutes > 0)
                return true;
            return false;
        }

        public static bool HoraValida(string horaInicioPadre,
                                      string horaFinPadre,
                                      string horaInicioHijo,
                                      string horaFinHijo)
        {
            TimeSpan horaInicioSubSede = ConevrtirHora(horaInicioPadre);
            TimeSpan horaFinSubSede = ConevrtirHora(horaFinPadre);

            TimeSpan horaInicioOffline = ConevrtirHora(horaInicioHijo);
            TimeSpan horaFinOffline = ConevrtirHora(horaFinHijo);

            if (((horaInicioOffline >= horaInicioSubSede) && (horaInicioOffline <= horaFinSubSede)) &&
                ((horaFinOffline >= horaInicioSubSede) && (horaFinOffline <= horaFinSubSede))
                )
                return true;
            return false;
        }
    }
}