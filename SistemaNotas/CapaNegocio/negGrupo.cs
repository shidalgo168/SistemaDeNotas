using CapaDatos;
using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class negGrupo
    {
        public static List<entGrupo> ListarGrupos(int idProfesor, int idPeriodo)
        {
            return daoGrupo.ListarGrupos(idProfesor, idPeriodo);
        }
    }
}
