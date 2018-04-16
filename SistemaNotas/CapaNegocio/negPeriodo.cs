using CapaDatos;
using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class negPeriodo
    {
        public static List<entPeriodo> ListarPeriodos()
        {
            return daoPeriodo.ListarPeriodos();
        }
    }
}
