using Dapper;

using FxAgendamiento.Interfaces.RepositoryPattern;
using FxAgendamiento.Models.DataTransferObjects;

using System.Data;
using System.Threading.Tasks;

namespace FxAgendamiento.Repositories
{
    public class UsuarioRepository : IUsuarioRepository
    {
        protected IDbTransaction Transaction { get; private set; }

        protected IDbConnection Connection => Transaction.Connection;

        public UsuarioRepository(IDbTransaction transaction)
        {
            Transaction = transaction;
        }

        public async Task<UsuarioDto> ObtenerUsuario(string IdUsuario)
        {
            string sqlQuery = @"SELECT
                              [pk_enrolamiento] AS IdUsuario,
                              CASE
                                WHEN id_rol = 1 THEN CAST([numero_identificacion] AS nvarchar(16))
                                ELSE CONCAT(CAST([numero_identificacion] AS nvarchar(16)), '-', [digito_verificacion])
                              END AS NumeroIdentificacion,
                              CASE
                                WHEN id_rol = 1 THEN CONCAT(nombres_completos, ' ', apellidos_completos)
                                ELSE razon_social
                              END AS Nombres,
                              [email] AS CorreoElectronico
                            FROM [enrolamiento].[tbl_trx_enrolamiento]
                            WHERE pk_enrolamiento=@IdUsuario";

            var parameters = new DynamicParameters();
            parameters.Add("IdUsuario", IdUsuario, DbType.String);

            UsuarioDto data = await Connection.QueryFirstOrDefaultAsync<UsuarioDto>(sqlQuery, parameters, Transaction);
            return data;
        }

        public async Task<UsuarioDto> ObtenerUsuarioPorNumeroIdenticacion(string numeroIdentificacion, int digitoVerificacion)
        {
            string sqlQuery = @"SELECT
                              [pk_enrolamiento] AS IdUsuario,
                              CASE
                                WHEN id_rol = 1 THEN CAST([numero_identificacion] AS nvarchar(16))
                                ELSE CONCAT(CAST([numero_identificacion] AS nvarchar(16)), '-', [digito_verificacion])
                              END AS NumeroIdentificacion,
                              CASE
                                WHEN id_rol = 1 THEN CONCAT(nombres_completos, ' ', apellidos_completos)
                                ELSE razon_social
                              END AS Nombres,
                              [email] AS CorreoElectronico
                            FROM [enrolamiento].[tbl_trx_enrolamiento]
                            WHERE numero_identificacion=@numeroIdentificacion
                            AND digito_verificacion = @digito_verificacion";

            var parameters = new DynamicParameters();
            parameters.Add("numeroIdentificacion", numeroIdentificacion, DbType.String);
            parameters.Add("digito_verificacion", digitoVerificacion, DbType.Int64);
            
              
            UsuarioDto data = await Connection.QueryFirstOrDefaultAsync<UsuarioDto>(sqlQuery, parameters, Transaction);
            return data;
        }
    }
}