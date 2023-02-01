using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FxDiasSemana.Models.DataTransferObjects
{
    [Table("tbl_mst_dia")]
    public class DiasDto
    {
        [Key]
        public int pk_numero_dia { get; set; }

        public string nombre_dia_ingles { get; set; }
        public string nombre_dia_español { get; set; }
    }
}