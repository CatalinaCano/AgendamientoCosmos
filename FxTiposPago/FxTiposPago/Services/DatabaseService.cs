using Dapper;

using FxTiposPago.DataContext;
using FxTiposPago.Interfaces;
using FxTiposPago.Models.DataTransferObjects;

using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace FxTiposPago.Services
{
    public class DatabaseService : IDatabaseService
    {
        private readonly DapperContext _context;

        public DatabaseService(DapperContext context)
        {
            _context = context;
        }

        public async Task<List<TipoPagoDto>> Get()
        {
            using IDbConnection db = _context.CreateConnection();
            try
            {
                if (db.State == ConnectionState.Closed)
                    db.Open();

                string sqlQuery = @$"select pk_sat_tipo_pago,
                                        fk_hub_tipo_pago
                                    from [mdm].[sat_tipo_pago] a
                                    inner join [mdm].[hub_tipo_pago] b
                                    on a.fk_hub_tipo_pago = b.pk_hub_tipo_pago
                                    where b.estado =@estado";
                var parameters = new DynamicParameters();
                parameters.Add("estado", true, DbType.Boolean);

                var data = await db.QueryAsync<TipoPagoDto>(sqlQuery, parameters);
                return data.ToList();
            }
            finally
            {
                if (db.State == ConnectionState.Open)
                    db.Close();
            }
        }

        public async Task<TipoPagoDto> GetById(string Id)
        {
            using IDbConnection db = _context.CreateConnection();
            try
            {
                if (db.State == ConnectionState.Closed)
                    db.Open();

                string sqlQuery = @"select
                                        pk_sat_tipo_pago,
                                        fk_hub_tipo_pago
                                    from [mdm].[sat_tipo_pago] a
                                    inner join [mdm].[hub_tipo_pago] b
                                    on a.fk_hub_tipo_pago = b.pk_hub_tipo_pago where b.estado = @estado
                                    AND a.fk_hub_tipo_pago = @Id";
                var parameters = new DynamicParameters();
                parameters.Add("estado", true, DbType.Boolean);
                parameters.Add("Id", Id, DbType.String);
                var data = await db.QueryFirstOrDefaultAsync<TipoPagoDto>(sqlQuery, parameters);
                return data;
            }
            finally
            {
                if (db.State == ConnectionState.Open)
                    db.Close();
            }
        }
    }
}