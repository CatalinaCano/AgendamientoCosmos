using Dapper;

using FxMalla.Interfaces.RepositoryPattern;
using FxMalla.Models.DataTransferObjects;

using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace FxMalla.Repositories
{
    public class UsuarioRepository : IUsuarioRepository
    {
        protected IDbTransaction Transaction { get; private set; }

        protected IDbConnection Connection => Transaction.Connection;

        public UsuarioRepository(IDbTransaction transaction)
        {
            Transaction = transaction;
        }

        public async Task<List<UsuarioDto>> ObtenerUsuario(string IdUsuario)
        {
            string sqlQuery = $@"SELECT
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
                            WHERE pk_enrolamiento IN ({IdUsuario})";

            var data = await Connection.QueryAsync<UsuarioDto>(sqlQuery, null, Transaction);

            return data.ToList();
        }
    }
}