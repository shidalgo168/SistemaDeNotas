using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class entEstudiante
    {
        public int id { get; set; }
        public int idEst { get; set; }
        public String Nombre { get; set; }
        public String Apellido { get; set; }
        public String Email { get; set; }
        public int carnet { get; set; }
        public int Telefono { get; set; }
        public double NotaAcumulada { get; set; }
        public int FK_Grupo { get; set; }
        public int FK_Estudiante { get; set; }
        public int FK_EstadoEst { get; set; }
        public int FK_Periodo { get; set; }
        public int FK_Profesor { get; set; }
    }
}
