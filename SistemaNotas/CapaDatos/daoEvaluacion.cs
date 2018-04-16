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
    public class daoEvaluacion
    {
        public static List<entEvaluacion> ListarEvaluaciones(int idEst)
        {
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<entEvaluacion> lista = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("ListarEvaluaciones", cnx);
                cmd.Parameters.AddWithValue("@idGxE", idEst);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                lista = new List<entEvaluacion>();
                while (dr.Read())
                {
                    entEvaluacion p = new entEvaluacion();
                    p.id = Convert.ToInt32(dr["id"]);
                    p.FK_Evaluacion = Convert.ToInt32(dr["FK_Evaluacion"]);
                    p.FK_GrupoxEst = Convert.ToInt32(dr["FK_GrupoxEst"]);
                    p.Nota = Convert.ToDouble(dr["Nota"]);
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
