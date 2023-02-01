using Dapper;

using FxAgendamiento.Interfaces.RepositoryPattern;
using FxAgendamiento.Models.DataTransferObjects;

using System.Data;
using System.Threading.Tasks;

namespace FxAgendamiento.Repositories
{
    public class EmailRepository : IEmailRepository
    {
        protected IDbTransaction Transaction { get; private set; }

        protected IDbConnection Connection => Transaction.Connection;

        public EmailRepository(IDbTransaction transaction)
        {
            Transaction = transaction;
        }

        /// <summary>
        ///
        /// </summary>
        /// <param name="nombre_cliente"></param>
        /// <param name="nombre_servicio"></param>
        /// <param name="nombre_plantilla"></param>
        /// <returns></returns>
        public async Task<PlantillaDto> ObtenerConfiguracionPlantilla(string nombre_cliente, string nombre_servicio, string nombre_plantilla)
        {
            string sqlQuery = @"SELECT
	                           CSP.fk_cliente   AS cliente,
	                           CSP.fk_servicio  AS servicio,
	                           CSP.fk_plantilla AS plantilla,
	                           P.es_dinamica,
	                           P.orden_parametros,
                               P.param_url_base
                            FROM comunicaciones.tbl_cliente C
                            INNER JOIN [comunicaciones].[tbl_cliente_servicio_plantilla] CSP ON
                            C.pk_cliente= CSP.fk_cliente AND
                            C.activo = CSP.activo
                            INNER JOIN comunicaciones.tbl_servicio S ON
                            S.pk_servicio= CSP.fk_servicio AND
                            S.activo= CSP.activo
                            INNER JOIN comunicaciones.tbl_plantilla P ON
                            P.pk_plantilla = CSP.fk_plantilla AND
                            P.activo = CSP.activo
                            WHERE
                            C.nombre_cliente=@nombre_cliente AND
                            S.nombre_servicio=@nombre_servicio AND
                            P.nombre_plantilla=@nombre_plantilla AND
                            C.activo = @activo";

            var parameters = new DynamicParameters();
            parameters.Add("nombre_cliente", nombre_cliente, DbType.String);
            parameters.Add("nombre_servicio", nombre_servicio, DbType.String);
            parameters.Add("nombre_plantilla", nombre_plantilla, DbType.String);
            parameters.Add("activo", true, DbType.Boolean);
            PlantillaDto data = await Connection.QueryFirstOrDefaultAsync<PlantillaDto>(sqlQuery, parameters, Transaction);
            return data;
        }
    }
}