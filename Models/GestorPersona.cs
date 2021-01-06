﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace VirtualWallet.Models
{
    public class GestorPersonas
    {
        private string StrConn;
        public GestorPersonas ()
        { 
            this.StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString(); 
        }
        public int AgregarPersona(Persona nueva)
        {
            int id = 0;

            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "insertar_persona";
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                /*comm.Parameters.Add(new SqlParameter("@Nombre", nueva.Nombre));
                comm.Parameters.Add(new SqlParameter("@Apellido", nueva.Apellido));
                comm.Parameters.Add(new SqlParameter("@Direccion", nueva.Direccion));
                comm.Parameters.Add(new SqlParameter("@Provincia", nueva.Provincia));
                comm.Parameters.Add(new SqlParameter("@Ciudad", nueva.Ciudad));*/
                comm.Parameters.Add(new SqlParameter("@Usuario", nueva.Usuario));
                comm.Parameters.Add(new SqlParameter("@Password", nueva.Password));
                comm.Parameters.Add(new SqlParameter("@Email", nueva.Email));

                id = Convert.ToInt32(comm.ExecuteScalar());
            }
            return id;
        }

        public List<Persona> ObtenerPersonas()
        {
            List<Persona> lista = new List<Persona>();

            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "obtener_personas";
                comm.CommandType = System.Data.CommandType.StoredProcedure;

                //DataTable result = new DataTable();
                SqlDataReader dr = comm.ExecuteReader();
                //result.Load(dr);
                //foreach (DataRow row in result.Rows)
                //{
                //    Persona p = new Persona(row.Field<int>(0), row.Field<string>(1), row.Field<string>(2));
                //    lista.Add(p);
                //}
                while (dr.Read())
                {


                    /*int id = dr.GetInt32(0);
                    string nombre = dr.GetString(1).Trim();
                    string apellido = dr.GetString(2).Trim();
                    string usuario = dr.GetString(3).Trim();
                    string contraseña = dr.GetString(4).Trim();
                    string email = dr.GetString(5).Trim();
                    string direccion = dr.GetString(6).Trim();
                    string provincia = dr.GetString(7).Trim();
                    string ciudad = dr.GetString(8).Trim();*/

                    int id = dr.GetInt32(0);
                    string nombre = "";
                    string apellido = "";
                    string usuario = "";
                    string contraseña = "";
                    string email = "";
                    string direccion = "";
                    string provincia = "";
                    string ciudad = "";

                    Persona p = new Persona(id, nombre, apellido, email, usuario, contraseña, direccion, provincia, ciudad);
                    lista.Add(p);
                }

                dr.Close();
            }

            return lista;
        }

        public void Eliminar(int id)
        {

            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                SqlCommand comm = new SqlCommand("eliminar_persona", conn);
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@IdCliente", id));

                comm.ExecuteNonQuery();
            }

        }

        public Persona ObtenerPorId(int id)
        {
            Persona p = null;

            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                SqlCommand comm = new SqlCommand("obtener_persona", conn);
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@id", id));

                SqlDataReader dr = comm.ExecuteReader();
                if (dr.Read())
                {
                    string nombre = dr.GetString(1);
                    string apellido = dr.GetString(2);
                    string usuario = dr.GetString(3).Trim();
                    string contraseña = dr.GetString(4).Trim();
                    string email = dr.GetString(5).Trim();
                    string direccion = dr.GetString(6).Trim();
                    string provincia = dr.GetString(7).Trim();
                    string ciudad = dr.GetString(8).Trim();

                    p = new Persona(id, nombre, apellido, email, usuario, contraseña, direccion, provincia, ciudad);
                }

                dr.Close();
            }

            return p;

        }

        public void ModificarPersona(Persona p)
        {

            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                SqlCommand comm = conn.CreateCommand();
                comm.CommandText = "modificar_persona";
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@Nombre", p.Nombre));
                comm.Parameters.Add(new SqlParameter("@Apellido", p.Apellido));
                comm.Parameters.Add(new SqlParameter("@IdCliente", p.Id));
                comm.Parameters.Add(new SqlParameter("@Direccion", p.Direccion));
                comm.Parameters.Add(new SqlParameter("@Provincia", p.Provincia));
                comm.Parameters.Add(new SqlParameter("@Ciudad", p.Ciudad));

                comm.ExecuteNonQuery();


            }
        }
    }
}
