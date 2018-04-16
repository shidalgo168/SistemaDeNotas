using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class daoPeriodo
    {
        public static List<entPeriodo> ListarPeriodos()
        {
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<entPeriodo> lista = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("ListarPeriodo", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                lista = new List<entPeriodo>();
                while (dr.Read())
                {
                    entPeriodo p = new entPeriodo();
                    p.Id = Convert.ToInt32(dr["Id"]);
                    p.FechaInicio = DateTime.Parse(dr["FechaInicio"].ToString());
                    p.FechaFin = DateTime.Parse(dr["FechaFin"].ToString());
                    p.Activo = Boolean.Parse(dr["Activo"].ToString());
                    lista.Add(p);
                }
            }
            catch (Exception e)
            {
                lista = null;
            }
            finally
            {
                cmd.Connection.Close();
            }
            return lista;
        }
    }
}
