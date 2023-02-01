using System;

namespace FxMonitorizarMalla.Utils
{
    public static class TimeHelper
    {
        public static DateTime ObtenerFechaColombia()
        {
            TimeZoneInfo zonaColombia = TimeZoneInfo.FindSystemTimeZoneById("Eastern Standard Time");
            DateTime today = TimeZoneInfo.ConvertTime(DateTime.UtcNow, zonaColombia);
            return today;
        }
    }
}