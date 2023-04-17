using MySql.Data.MySqlClient;
using Restaurant.Data.DAO.Exceptions;
using Restaurant.Data.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Restaurant.Data.DAO.MySQL
{
    public class MySQLUtil
    {
        private static readonly string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;

        public static MySqlConnection GetMySQLConnection()
        {
            MySqlConnection conn = null;
            try
            {
                conn = new MySqlConnection(connectionString);
                conn.Open();
            }
            catch (MySqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
            return conn;
        }


        public static void CloseQuietly(MySqlConnection conn)
        {
            if (conn != null)
            {
                conn.Close();
            }
        }

        public static void CloseQuietly(MySqlDataReader reader)
        {
            if (reader != null)
            {
                reader.Close();
            }
        }

        public static void CloseQuietly(MySqlDataReader reader, MySqlConnection conn)
        {
            CloseQuietly(reader);
            CloseQuietly(conn);
        }

        public static Employee SignIn(String username, String password)
        {
            bool signIn = false;
            MySqlConnection conn = null;
            MySqlCommand cmd;
            try
            {
                conn = MySQLUtil.GetMySQLConnection();
                cmd = new MySqlCommand("prijava", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@korisnickoIme", MySqlDbType.String).Value = username;
                cmd.Parameters.Add("@lozinka", MySqlDbType.String).Value = password;
                cmd.Parameters.Add("@prijava", MySqlDbType.Bit).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@id", MySqlDbType.Int32).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@u", MySqlDbType.String).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@i", MySqlDbType.String).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@p", MySqlDbType.String).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@broj", MySqlDbType.String).Direction = ParameterDirection.Output;
                cmd.Parameters.Add("@mjesto", MySqlDbType.String).Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                if (cmd.Parameters["@prijava"].Value != DBNull.Value)
                    signIn = Convert.ToBoolean(cmd.Parameters["@prijava"].Value);
                if (signIn)
                {
                    Employee e = new Employee()
                    {
                        Id = Convert.ToInt32(cmd.Parameters["@id"].Value),
                        Role = Convert.ToString(cmd.Parameters["@u"].Value),
                        Name = Convert.ToString(cmd.Parameters["@i"].Value),
                        Lastname = Convert.ToString(cmd.Parameters["@p"].Value),
                        Username = username,
                        Password = password,
                        PhoneNumber = Convert.ToString(cmd.Parameters["@broj"].Value),
                        PlaceOfResidence = Convert.ToString(cmd.Parameters["@mjesto"].Value)
                    };
                    return e;
                }
                else
                {
                    return new Employee();
                }
            }
            catch (Exception ex)
            {
                throw new DataAccessException("Exception in MySQLUtil", ex);
            }
            finally
            {
                MySQLUtil.CloseQuietly(conn);
            }
        }
    }
}
