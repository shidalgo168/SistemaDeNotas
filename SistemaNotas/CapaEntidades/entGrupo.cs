using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class entGrupo
    {
        public int id { get; set; }
        public int FK_EstadoG { get; set; }
        public int FK_Profesor { get; set; }
        public int FK_Periodo { get; set; }
        public String NombreCurso { get; set; }
        public String CodigoCurso { get; set; }

    }
}
