using Dapper;

using FxDiasSemana.DataContext;
using FxDiasSemana.Interfaces;
using FxDiasSemana.Models.DataTransferObjects;

using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace FxDiasSemana.Services
{
    public class DatabaseService : IDatabaseService
    {
        private readonly DapperContext _context;

        public DatabaseService(DapperContext context)
        {
            _context = context;
        }

        public async Task<List<DiasDto>> Get()
        {
            using IDbConnection db = _context.CreateConnection();
            try
            {
                if (db.State == ConnectionState.Closed)
                    db.Open();

                string sqlQuery = @"SELECT
                                        pk_numero_dia,
                                        nombre_dia_ingles,
                                        [nombre_dia_español]
                                    FROM [mdm].[tbl_mst_dia]";

                var diasFestivosDto = await db.QueryAsync<DiasDto>(sqlQuery);
                return diasFestivosDto.ToList();
            }
            finally
            {
                if (db.State == ConnectionState.Open)
                    db.Close();
            }
        }
    }
}