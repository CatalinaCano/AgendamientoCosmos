using FxAgendamiento.Models.DataTransferObjects;
using FxAgendamiento.Models.Input;

using System;
using System.Collections.Generic;

namespace FxAgendamiento.Utils
{
    public static class TimeHelper
    {
        public static List<DateTime> ObtenerHoras(AgendaInput request, SedeDto sede, ServicioDto servicio)
        {
            DateTime HoraInicio = DateTime.ParseExact(request.HoraAgendamiento, "HH:mm", null);

            int finRango = CalcularIntervalos(sede, servicio);
            int intervalo = (int)sede.IntervaloAtencion;

            List<DateTime> horas = new();
            for (int i = 0; i < finRango; i++)
            {
                if (i == 0)
                {
                    horas.Add(HoraInicio.AddMinutes(0));
                }
                else
                {
                    horas.Add(horas[i - 1].AddMinutes(intervalo));
                }
            }

            return horas;
        }

        public static DateTime ConevrtirHora(string hora)
        {
            return DateTime.ParseExact(hora, "HH:mm", null);
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

        public static string[] CambiarHoras(List<DateTime> horas)
        {
            List<string> result = new() { };

            foreach (var fecha in horas)
            {
                result.Add(string.Concat('\'', fecha.ToString("HH:mm"), '\''));
            }
            return result.ToArray();
        }

        public static int CalcularIntervalos(SedeDto sede, ServicioDto servicio)
        {
            var respuesta = Convert.ToDecimal(Convert.ToDouble(servicio.tiempoAtencion) / Convert.ToDouble(sede.IntervaloAtencion));

            return (int)Math.Ceiling(respuesta);
        }

        public static bool ValidacionFecha(string fecha)
        {
            return ConvertirFecha(fecha).Date >= ObtenerFechaColombia().Date;
        }
        public static DateTime ObtenerFechaColombia()
        {

            TimeZoneInfo zonaColombia = TimeZoneInfo.FindSystemTimeZoneById("Eastern Standard Time");
            DateTime today = TimeZoneInfo.ConvertTime(DateTime.UtcNow, zonaColombia);
            return today;
        }

        public static DateTime ConvertirFecha(string fecha)
        {
            try
            {
                var datos = fecha.Split("/");
                int year = int.Parse(datos[2].Split()[0]);
                int month = int.Parse(datos[1]);
                int day = int.Parse(datos[0]);
                TimeZoneInfo zonaColombia = TimeZoneInfo.FindSystemTimeZoneById("Eastern Standard Time");
                DateTime convertDate = new(year, month, day);


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