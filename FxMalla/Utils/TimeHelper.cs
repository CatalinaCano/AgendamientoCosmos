using FxMalla.Models;
using FxMalla.Models.Entities;
using FxMalla.Models.Input;

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace FxMalla.Utils
{
    public static class TimeHelper
    {
        public static bool ValidacionFecha(string fecha)
        {
            return ConvertirFecha(fecha).Date >= ObtenerFechaColombia().Date;
        }

        public static bool ValidacionFechaMenor(string fecha)
        {
            return ConvertirFecha(fecha).Date < ObtenerFechaColombia().Date;
        }

        public static DateTime ObtenerFechaColombia()
        {
            TimeZoneInfo zonaColombia = TimeZoneInfo.FindSystemTimeZoneById("Eastern Standard Time");
            DateTime today = TimeZoneInfo.ConvertTime(DateTime.UtcNow, zonaColombia);
            return today;
        }

        public static DateTime ConevrtirHora(string hora, string formatoHora)
        {
            return DateTime.ParseExact(hora, formatoHora, null);
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

        public static List<DateTime> GetDatesBetween(DateTime start, DateTime end)
        {
            var dates = Enumerable.Range(0, 1 + end.Subtract(start).Days)
                                  .Select(offset => start.AddDays(offset))
                                  .ToList();
            return dates;
        }

        public static List<DateTime> CalcularTiempo(DateTime dia, DateTime horaInicio, DateTime horaFin, long rango)
        {
            DateTime TimeIn = dia.AddHours(horaInicio.Hour).AddMinutes(horaInicio.Minute);
            DateTime TimeOut = dia.AddHours(horaFin.Hour).AddMinutes(horaInicio.Minute);
            List<DateTime> horas = new();
            int finRango = (int)(TimeOut - TimeIn).TotalMinutes / Convert.ToInt32(rango);
            for (int i = 0; i <= finRango; i++)
            {
                if (i == 0)
                {
                    horas.Add(TimeIn.AddMinutes(0));
                }
                else
                {
                    horas.Add(horas[i - 1].AddMinutes(rango));
                }
            }
            return horas;
        }

        public static void InactivarTiemposOffline(ref Agenda agendaDia, TiempoOffline[] TiemposOffline, long rango, string formatoHora)
        {
            Agenda agendaLocal = agendaDia;

            var tiemposInactivar = from t in TiemposOffline
                                   where t.Dias.Contains(agendaLocal.DiaSemana)
                                   select t;

            if (tiemposInactivar.Any())
            {
                DateTime HoraInicio = ConevrtirHora(tiemposInactivar.FirstOrDefault()?.HoraInicio, formatoHora);
                DateTime HoraFin = ConevrtirHora(tiemposInactivar.FirstOrDefault()?.HoraFin, formatoHora);

                var horasconDia = CalcularTiempo(ConvertirFecha(agendaDia.Fecha), HoraInicio, HoraFin, rango);
                horasconDia.RemoveAt(horasconDia.Count - 1);

                List<string> horasMilitares = new() { };

                foreach (var hora in horasconDia)
                {
                    horasMilitares.Add(hora.ToString(formatoHora));
                }

                agendaDia.Tiempos
                          .Where(dia => horasMilitares.Contains(dia.HoraInicio)).ToList()
                          .ForEach(dia => dia.AgendaDisponible = false);
            }
        }

        public static Tiempo[] CalcularAgendaDia(DateTime dia, DateTime horaInicio, DateTime horaFin, long rango, long cantidadPersonas, string formatoHora)
        {
            var horas = CalcularTiempo(dia, horaInicio, horaFin, rango);
            int limite = horas.Count - 1;
            List<Tiempo> tiemposDia = new();

            for (int i = 0; i <= limite; i++)
            {
                var tiempo = new Tiempo()
                {
                    IdTiempoMalla = Guid.NewGuid().ToString(),
                    HoraInicio = horas[i].ToString(formatoHora),
                    HoraFin = i == limite ? horas[i].ToString(formatoHora) : horas[i + 1].ToString(formatoHora),
                    AgendaDisponible = true,
                    Tramites = Array.Empty<string>(),
                    CantidadPersonas = cantidadPersonas
                };

                tiemposDia.Add(tiempo);
            }

            if (tiemposDia.Count >= 1)
                tiemposDia.RemoveAt(tiemposDia.Count - 1);

            return tiemposDia.ToArray();
        }

        public static bool FechaActiva(string fechaFin)
        {
            TimeZoneInfo zonaColombia = TimeZoneInfo.FindSystemTimeZoneById("Eastern Standard Time");
            DateTime fechaColombia = TimeZoneInfo.ConvertTime(DateTime.Now, zonaColombia);

            return ConvertirFecha(fechaFin) < fechaColombia;
        }

        public static bool InactivarFestivos(List<string> fechasFestivos, Agenda agendaDia)
        {
            return fechasFestivos.Contains(agendaDia.Fecha);
        }

        public static List<Agenda> CalcularAgenda(AgendaInput input, List<string> festivos, string FORMATO_FECHA, string FORMATO_HORA)
        {
            List<DateTime> result = GetDatesBetween(input.FechaInicio, input.FechaFin);
            List<Agenda> agenda = new();

            bool isFestivo = false;
            if (input != null)
            {
                foreach (var date in result)
                {
                    var agendaDia = new Agenda()
                    {
                        Fecha = date.ToString(FORMATO_FECHA),
                        DiaSemana = date.DayOfWeek.ToString(),
                    };

                    if (input.InactivaFestivos)
                        isFestivo = InactivarFestivos(festivos, agendaDia);

                    if (!input.DiasOffline.Contains(date.DayOfWeek.ToString()) && !isFestivo)
                    {
                        agendaDia.Tiempos = CalcularAgendaDia(date,
                                                                        ConevrtirHora(input.HoraInicio, FORMATO_HORA),
                                                                        ConevrtirHora(input.HoraFin, FORMATO_HORA),
                                                                        input.Intervalo,
                                                                        input.CantidadPersonas,
                                                                        FORMATO_HORA);

                        if (input.TiemposOffline.Any())
                            InactivarTiemposOffline(ref agendaDia, input.TiemposOffline, input.Intervalo, FORMATO_HORA);
                        agenda.Add(agendaDia);
                    }
                    else
                    {
                        agenda.Add(agendaDia);
                    }
                }
            }

            return agenda;
        }
    }
}