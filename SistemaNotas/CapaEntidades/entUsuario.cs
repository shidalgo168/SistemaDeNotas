using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class entUsuario
    {
        public int id { get; set; }
        public String Nombre { get; set; }
        public String Apellido { get; set; }
        public String correo { get; set; }
        public String Password { get; set; }
    }
}
