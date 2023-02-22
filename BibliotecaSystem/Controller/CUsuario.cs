using BibliotecaSystem.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BibliotecaSystem.Controller
{
    public class CUsuario
    {
        public static DataTable Validar_acceso(string usuario, string contraseña)
        {
            return new DUsuario().ValidarAcceso(usuario, contraseña);
        }
        
        //XD

        }
    }
