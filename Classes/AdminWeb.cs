using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Muni.Classes
{
    public static class AdminWeb
    {
        #region AdminMethods
        public static DataTable getBitacoraEntidad(string nombreEntidad, string fechaInicio, string fechaFin)
        {
            SqlConnection connection = Globals.getConnection();
            DataTable datatable = new DataTable();

            SqlDataAdapter sqlda = new SqlDataAdapter("csp_getBitacoraFromTipoEntidad", connection);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlda.SelectCommand.Parameters.AddWithValue("@inTipoEntidad", nombreEntidad);
            sqlda.SelectCommand.Parameters.AddWithValue("@inFechaInicio", fechaInicio);
            sqlda.SelectCommand.Parameters.AddWithValue("@inFechaFin", fechaFin);

            connection.Open();
            sqlda.Fill(datatable);
            connection.Close();

            return datatable;
        }

        //spName can be either "csp_getJsonAntes" or "csp_getJsonDespues"
        public static string getJsonBitacora(int inputID, string spName)
        {
            SqlConnection connection = Globals.getConnection();
            SqlCommand cmd = new SqlCommand(spName, connection);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@inBitacoraID", inputID));
            cmd.Parameters.Add("@outJson", SqlDbType.VarChar, 100000).Direction = ParameterDirection.Output;

            connection.Open();
            cmd.ExecuteNonQuery();

            string spOutput = Convert.ToString(cmd.Parameters["@outJson"].Value);
            connection.Close();

            return spOutput;
        }

        #endregion
    }
}