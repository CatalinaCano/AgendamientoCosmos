namespace FxAgendamientoMasivo.Models.CSV
{
    public class AgendamientoInfo
    {
        [CsvColumn("ID_USUARIO")]
        public string IdUsuario { get; set; }

        [CsvColumn("ID_MALLA")]
        public string IdMalla { get; set; }

        [CsvColumn("ID_SEDE")]
        public string IdSede { get; set; }

        [CsvColumn("ID_SUBSEDE")]
        public string IdSubsede { get; set; }

        [CsvColumn("ID_SERVICIO")]
        public string IdServicio { get; set; }

        [CsvColumn("FECHA_CITA", "^(?:(?:31(\\/|-|\\.)(?:0?[13578]|1[02]))\\1|(?:(?:29|30)(\\/|-|\\.)(?:0?[1,3-9]|1[0-2])\\2))(?:(?:1[6-9]|[2-9]\\d)?\\d{2})$|^(?:29(\\/|-|\\.)0?2\\3(?:(?:(?:1[6-9]|[2-9]\\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\\d|2[0-8])(\\/|-|\\.)(?:(?:0?[1-9])|(?:1[0-2]))\\4(?:(?:1[6-9]|[2-9]\\d)?\\d{2})$")]
        public string FechaCita { get; set; }

        [CsvColumn("HORA_CITA", "^(?:0?[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$")]
        public string HoraCita { get; set; }
    }
}