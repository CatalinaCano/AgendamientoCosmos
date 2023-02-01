using Microsoft.Extensions.Configuration;

using System.Data;
using System.Data.SqlClient;

namespace FxDiasSemana.DataContext
{
    public class DapperContext
    {
        private readonly IConfiguration _configuration;
        private readonly string secretName;

        public DapperContext(IConfiguration configuration)
        {
            _configuration = configuration;
            secretName = _configuration["SecretsNames:ConDataBase"];
        }

        public IDbConnection CreateConnection() =>
            new SqlConnection(_configuration[secretName]);
    }
}