using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BibliotecaSystem.Data
{
    public class DUsuario
    {
      
        public DataTable ValidarAcceso(string usuario, string contraseña) { 

            DataTable dtResultado = new DataTable("Inicio Sesion");
            SqlConnection sqlCon = new SqlConnection();

            try
            {

                sqlCon.ConnectionString = Conexion.Cn;
                SqlCommand sqlCmd = new SqlCommand();
                sqlCmd.Connection = sqlCon;
                sqlCmd.CommandText = "Validar Acceso";
                sqlCmd.CommandType = CommandType.StoredProcedure;

                // Cargar datos de Procedimiento Almacenado de Sql //

                SqlParameter PUsuario = new SqlParameter();
                PUsuario.ParameterName = "@usuario";
                PUsuario.SqlDbType = SqlDbType.VarChar;
                PUsuario.Size = 60;
                sqlCmd.Parameters.Add(PUsuario);

                SqlParameter PContraseña = new SqlParameter();
                PUsuario.ParameterName = "@contraseña";
                PUsuario.SqlDbType = SqlDbType.VarChar;
                PUsuario.Size = 100;
                sqlCmd.Parameters.Add(PContraseña);


                SqlDataAdapter sqlData = new SqlDataAdapter();

                sqlData.Fill(dtResultado);






            }
            catch (Exception ex)
            {
                dtResultado = null;

            }
            return dtResultado;
        }




    }
}
