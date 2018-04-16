using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class entEvaluacion
    {
        public int id { get; set; }
        public int FK_GrupoxEst { get; set; }
        public int FK_Evaluacion { get; set; }
        public double Nota { get; set; }

    }
}
