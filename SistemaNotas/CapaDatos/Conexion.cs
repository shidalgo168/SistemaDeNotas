using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace CapaDatos
{
    public class Conexion
    {
        public SqlConnection Conectar()
        {
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = @"Data Source=SERGIO-HF\BD1; Initial Catalog=SistemaDeNotas; Integrated Security=true";
            return cn;
        }
    }
}
