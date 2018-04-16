using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using CapaEntidades;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class daoGrupo
    {
        public static List<entGrupo> ListarGrupos(int idProfesor, int idPeriodo)
        {
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<entGrupo> lista = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("ListarGrupos", cnx);
                cmd.Parameters.AddWithValue("@idProfesor", idProfesor);
                cmd.Parameters.AddWithValue("@idPeriodo", idPeriodo);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                lista = new List<entGrupo>();
                while (dr.Read())
                {
                    entGrupo p = new entGrupo();
                    p.id = Convert.ToInt32(dr["id"]);
                    p.FK_EstadoG = Convert.ToInt32(dr["FK_EstadoG"].ToString());
                    p.FK_Periodo = Convert.ToInt32(dr["FK_Periodo"].ToString());
                    p.FK_Profesor = Convert.ToInt32(dr["FK_Profesor"].ToString());
                    p.NombreCurso = dr["NombreCurso"].ToString();
                    p.CodigoCurso = dr["CodigoCurso"].ToString();
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
