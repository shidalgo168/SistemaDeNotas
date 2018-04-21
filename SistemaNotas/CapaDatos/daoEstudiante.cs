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
    public class daoEstudiante
    {
        public static List<entEstudiante> ListarEstudiantes(int idGrupo)
        {
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            List<entEstudiante> lista = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("ListarEstDelGrupo", cnx);
                cmd.Parameters.AddWithValue("@idGrupo", idGrupo);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                lista = new List<entEstudiante>();
                while (dr.Read())
                {
                    entEstudiante p = new entEstudiante();
                    p.id = Convert.ToInt32(dr["id"]);
                    p.idEst = Convert.ToInt32(dr["idEst"]);
                    p.Nombre = dr["Nombre"].ToString();
                    p.Apellido = dr["Apellido"].ToString();
                    p.Email = dr["Email"].ToString();
                    p.carnet = Convert.ToInt32(dr["carnet"]);
                    p.Telefono = Convert.ToInt32(dr["Telefono"]);
                    p.NotaAcumulada = Convert.ToDouble(dr["NotaAcumulada"]);
                    p.FK_EstadoEst = Convert.ToInt32(dr["FK_EstadoEst"]);
                    p.FK_Grupo = Convert.ToInt32(dr["FK_Grupo"]);
                    p.FK_Periodo = Convert.ToInt32(dr["FK_Periodo"]);
                    p.FK_Profesor = Convert.ToInt32(dr["FK_Profesor"]);
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
