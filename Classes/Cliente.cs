using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Muni.Classes
{
    public static class Cliente
    {
        #region ClientMethods
        public static DataTable getClientProperties(string username)
        {
            //Pido conexion
            SqlConnection connection = Globals.getConnection();

            //Variable que guarda la tabla resultante del sp
            DataTable datatable = new DataTable();

            //Preparo el SqlDataAdapter
            SqlDataAdapter sqlda = new SqlDataAdapter("csp_getPropiedadesDeUsuario", connection);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;

            //Agregar los parametros
            sqlda.SelectCommand.Parameters.AddWithValue("@usernameInput", username);

            //Abro la conexion
            connection.Open();

            //Ejecuto y guardo la tabla en la variable
            sqlda.Fill(datatable);

            //Cierro la conexion
            connection.Close();

            return datatable;
        }


        #endregion
    }
}