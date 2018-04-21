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
                    p.FK_GrupoxEst = Convert.ToInt32(dr["FK_GrupoxEst"]);
                    p.Nota = Convert.ToDouble(dr["Nota"]);
                    p.Nombre = dr["Nombre"].ToString();
                    p.FechaAplicacion = DateTime.Parse(dr["FechaAplicacion"].ToString());
                    p.ValorPorcIndiv = Convert.ToDouble(dr["ValorPorcIndiv"]);
                    p.Descripcion = dr["Descripcion"].ToString();
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

        public static List<entEvaluacion> ListarEvalDinamicas(int idGrupo)
        {
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<entEvaluacion> lista = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("ListarEvalDinamicas", cnx);
                cmd.Parameters.AddWithValue("@idGrupo",idGrupo);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                lista = new List<entEvaluacion>();
                while (dr.Read())
                {
                    entEvaluacion p = new entEvaluacion();
                    p.Nombre = dr["Nombre"].ToString();
                    p.FK_GrupoxRubro = Convert.ToInt32(dr["id"].ToString());
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

        public static DateTime AgregarEvaluacion(entEvaluacion obj)
        {
            DateTime res = new DateTime(1900, 10, 10);
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            try
            {
                SqlParameter fecha = new SqlParameter("@Fecha", SqlDbType.DateTime);
                SqlParameter result = new SqlParameter("@returnValue", SqlDbType.Date);
                result.Value = res.Date;
                result.Direction = ParameterDirection.Output;
                SqlParameter retInt = new SqlParameter("@retInt", 0);
                retInt.Direction = ParameterDirection.Output;
                fecha.Value = obj.FechaAplicacion;
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("AgregarEvaluacion", cnx);
                cmd.Parameters.AddWithValue("@idGxR", obj.FK_GrupoxRubro);
                cmd.Parameters.AddWithValue("@idGrupo", obj.FK_GrupoxEst);
                cmd.Parameters.AddWithValue("@Nombre", obj.Nombre);
                cmd.Parameters.Add(fecha);
                cmd.Parameters.AddWithValue("@Descripcion", obj.Descripcion);
                cmd.Parameters.Add(result);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                cmd.ExecuteNonQuery();
                res = DateTime.Parse(cmd.Parameters["@returnValue"].Value.ToString());
            }
            catch (Exception e)
            {
               
            }
            finally
            {
                cmd.Connection.Close();
            }
            return res;
        }
    }
}

