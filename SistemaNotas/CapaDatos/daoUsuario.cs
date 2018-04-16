using CapaDatos;
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
    public class daoUsuario
    {
        public static entUsuario Login(String usuario, String password)
        {
            entUsuario obj = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
            try
            {
                Conexion cn = new Conexion();
                SqlConnection cnx = cn.Conectar();
                cmd = new SqlCommand("VerificarUsuario", cnx);
                cmd.Parameters.AddWithValue("@Usuario", usuario);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.CommandType = CommandType.StoredProcedure;
                cnx.Open();
                dr = cmd.ExecuteReader();
                obj = new entUsuario();
                dr.Read();
                obj.id = Convert.ToInt32(dr["id"].ToString());
                obj.Nombre = dr["Nombre"].ToString();
                obj.Apellido = dr["Apellido"].ToString();
                obj.correo = dr["correo"].ToString();
                obj.Password = dr["Password"].ToString();
            }
            catch
            {
                obj = null;
            }
            finally
            {
                cmd.Connection.Close();
            }
            return obj;
        }
    }
}
