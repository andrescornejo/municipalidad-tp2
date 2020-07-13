﻿using System;
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

        #region CRUD
        public static void updatePropietario(string OldDocIDVal, string name, string docID, string docIDVal, string user, string ip)
        {
            SqlConnection connection = Globals.getConnection();
            SqlCommand cmd = new SqlCommand("csp_adminUpdatePropietario", connection);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@inputOLDDocID", OldDocIDVal);
            cmd.Parameters.AddWithValue("@inputName", name);
            cmd.Parameters.AddWithValue("@inputDocIDVal", docID);
            cmd.Parameters.AddWithValue("@inputDocID", docIDVal);
            cmd.Parameters.AddWithValue("@inputInsertedBy", user);
            cmd.Parameters.AddWithValue("@inputInsertedIn", ip);

            connection.Open();
            int rowAffected = cmd.ExecuteNonQuery();
            connection.Close();
        }

        public static void updateUsuario(string OldUsername, string username, string password, bool isAdmin, string user, string ip)
        {
            SqlConnection connection = Globals.getConnection();
            SqlCommand cmd = new SqlCommand("csp_adminUpdateUsuario", connection);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@inputOLDUsername", OldUsername);
            cmd.Parameters.AddWithValue("@inputNewUsername", username);
            cmd.Parameters.AddWithValue("@inputNewPassword", password);
            cmd.Parameters.AddWithValue("@inputAdminStatus", isAdmin);
            cmd.Parameters.AddWithValue("@inputInsertedBy", user);
            cmd.Parameters.AddWithValue("@inputInsertedIn", ip);

            connection.Open();
            int rowAffected = cmd.ExecuteNonQuery();
            connection.Close();
        }

        #endregion

        #endregion

        #region CRUD

        #region CreateTables

        public static void createPropiedad(int numFinca, int valor, string dir, string user, string ip)
        {
            SqlConnection connection = Globals.getConnection();
            SqlCommand cmd = new SqlCommand("csp_adminAddPropiedades", connection);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@inputNumFinca", numFinca);
            cmd.Parameters.AddWithValue("@inputValorFinca", valor);
            cmd.Parameters.AddWithValue("@inputDir", dir);
            cmd.Parameters.AddWithValue("@inputInsertedBy", user);
            cmd.Parameters.AddWithValue("@inputInsertedIn", ip);

            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
        }

        #endregion

        #region ReadTables

        public static DataTable getPropiedades()
        {
            SqlConnection connection = Globals.getConnection();

            DataTable datatable = new DataTable();
            SqlDataAdapter sqlda = new SqlDataAdapter("csp_getPropiedades", connection);
            sqlda.SelectCommand.CommandType = CommandType.StoredProcedure;

            connection.Open();
            sqlda.Fill(datatable);
            connection.Close();

            return datatable;
        }

        #endregion

        #region DeleteTables

        public static void deletePropiedad(int numFinca, string user, string ip)
        {
            SqlConnection connection = Globals.getConnection();
            SqlCommand cmd = new SqlCommand("csp_adminDeletePropiedad", connection);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@inputNumFinca", numFinca);
            cmd.Parameters.AddWithValue("@inputInsertedBy", user);
            cmd.Parameters.AddWithValue("@inputInsertedIn", ip);

            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
        }

        #endregion

        #endregion
    }
}