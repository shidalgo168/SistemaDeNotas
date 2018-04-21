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
        public int FK_GrupoxRubro { get; set; }
        public double Nota { get; set; }
        public String Nombre { get; set; }
        public DateTime FechaAplicacion { get; set; }
        public Double ValorPorcIndiv { get; set; }
        public String Descripcion { get; set; }
    }
}
