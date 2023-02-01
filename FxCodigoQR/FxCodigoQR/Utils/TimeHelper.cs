using System;

namespace FxCodigoQR.Utils
{
    public static class TimeHelper
    {
        public static DateTime ConevrtirHora(string hora)
        {
            return DateTime.ParseExact(hora, "HH:mm", null);
        }

        public static DateTime ObtenerFechaHoy()
        {
            TimeZoneInfo zonaColombia = TimeZoneInfo.FindSystemTimeZoneById("Eastern Standard Time");
            return TimeZoneInfo.ConvertTime(DateTime.UtcNow, zonaColombia);
        }

        public static DateTime ObtenerFechaConHora(string fecha, int hora, int minutos)
        {
            try
            {
                var datos = fecha.Split("/");
                int year = int.Parse(datos[2].Split()[0]);
                int month = int.Parse(datos[1]);
                int day = int.Parse(datos[0]);

                TimeZoneInfo zonaColombia = TimeZoneInfo.FindSystemTimeZoneById("Eastern Standard Time");
                DateTime convertDate = new(year, month, day, hora, minutos, 0);
                DateTime fechaColombia = TimeZoneInfo.ConvertTime(convertDate, zonaColombia);

                return fechaColombia;
            }
            catch (Exception)
            {
                return new(1900, 1, 1);
            }
        }
    }
}