using CapaDatos;
using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class negEvaluacion
    {
        public static List<entEvaluacion> ListarEvaluaciones(int idEst)
        {
            return daoEvaluacion.ListarEvaluaciones(idEst);
        }
    }
}
