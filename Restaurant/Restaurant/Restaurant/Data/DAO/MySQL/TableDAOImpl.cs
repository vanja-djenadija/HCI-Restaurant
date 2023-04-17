using MySql.Data.MySqlClient;
using Restaurant.Data.DAO.Exceptions;
using Restaurant.Data.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Data.DAO.MySQL
{
    public class TableDAOImpl : ITable
    {
        private static readonly string SELECT = "SELECT * FROM `STO` ORDER BY BrojMjesta";
        private static readonly string INSERT = "INSERT INTO `STO`(IdSto, BrojMjesta) VALUES (@IdSto, @BrojMjesta)";
        private static readonly string DELETE = "DELETE FROM `STO` WHERE IdSto=@IdSto";

        public bool Addtable(Table table)
        {
            bool result = false;
            MySqlConnection conn = null;
            MySqlCommand cmd;
            try
            {
                conn = MySQLUtil.GetMySQLConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = INSERT;
                cmd.Parameters.AddWithValue("@IdSto", table.Id);
                cmd.Parameters.AddWithValue("@BrojMjesta", table.NumberOfSeats);
                result = cmd.ExecuteNonQuery() == 1;
            }
            catch (Exception ex)
            {
                throw new DataAccessException("Exception in TableDAOImpl", ex);
            }
            finally
            {
                MySQLUtil.CloseQuietly(conn);
            }
            return result;
        }

        public bool DeleteTable(int tableId)
        {
            bool result = false;
            MySqlConnection conn = null;
            MySqlCommand cmd;
            try
            {
                conn = MySQLUtil.GetMySQLConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = DELETE;
                cmd.Parameters.AddWithValue("@IdSto", tableId);
                result = cmd.ExecuteNonQuery() == 1;
            }
            catch (Exception ex)
            {
                throw new DataAccessException("Exception in TableDAOImpl", ex);
            }
            finally
            {
                MySQLUtil.CloseQuietly(conn);
            }
            return result;
        }

        public List<Table> GetTables()
        {
            List<Table> result = new List<Table>();
            MySqlConnection conn = null;
            MySqlCommand cmd;
            MySqlDataReader reader = null;

            try
            {
                conn = MySQLUtil.GetMySQLConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = SELECT;
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    result.Add(new Table()
                    {
                        Id = reader.GetInt32(0),
                        NumberOfSeats = reader.GetInt32(1),
                        Taken = reader.GetBoolean(2)
                    });
                }
            }
            catch (Exception ex)
            {
                throw new DataAccessException("Exception in TableDAOImpl", ex);
            }
            finally
            {
                MySQLUtil.CloseQuietly(reader, conn);
            }
            return result;
        }

        public void UpdateTable(Table table)
        {
            throw new NotImplementedException();
        }
    }
}
