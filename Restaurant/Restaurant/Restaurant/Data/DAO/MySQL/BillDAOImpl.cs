using Restaurant.Data.DAO.Exceptions;
using Restaurant.Data.DTO;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace Restaurant.Data.DAO.MySQL
{
    public class BillDAOImpl : IBill
    {
        private static readonly string SELECT = "SELECT IdRačun, UkupnaCijena, Datum FROM `RAČUN` ORDER BY Datum";

        public int CreateBill(int orderId)
        {
            MySqlConnection conn = null;
            MySqlCommand cmd;
            try
            {
                conn = MySQLUtil.GetMySQLConnection();
                cmd = conn.CreateCommand(); cmd = new MySqlCommand("kreirajRačun", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@idNarudžba", MySqlDbType.Int32).Value = orderId;
                cmd.Parameters.Add("@računId", MySqlDbType.Int32).Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                int billId = Convert.ToInt32(cmd.Parameters["@računId"].Value);
                return billId;
            }
            catch (Exception ex)
            {
                throw new DataAccessException("Exception in BillDAOImpl", ex);
            }
            finally
            {
                MySQLUtil.CloseQuietly(conn);
            }
        }

        public List<Bill> GetBills()
        {
            List<Bill> result = new List<Bill>();
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
                    result.Add(new Bill()
                    {
                        Id = reader.GetInt32(0),
                        TotalPrice = reader.GetDouble(1),
                        DateTime = reader.GetDateTime(2)
                    });
                }
            }
            catch (Exception ex)
            {
                throw new DataAccessException("Exception in BillDAOImpl", ex);
            }
            finally
            {
                MySQLUtil.CloseQuietly(reader, conn);
            }
            return result;
        }

        public DetailedBill GetBill(int billId)
        {
            double totalPrice = 0.0;
            DateTime date = new DateTime();
            String firstName = "", lastName = "";
            List<BillItem> items = new List<BillItem>();
            MySqlDataReader reader = null;
            MySqlConnection conn = null;
            MySqlCommand cmd;
            try
            {
                conn = MySQLUtil.GetMySQLConnection();
                cmd = new MySqlCommand("računDetalji", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@idRačuna", MySqlDbType.Int32).Value = billId;
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    totalPrice = reader.GetInt32(1);
                    date = reader.GetDateTime(0);
                    items.Add(new BillItem()
                    {
                        Id = reader.GetInt32(3),
                        Name = reader.GetString(4),
                        Price = reader.GetDouble(5),
                        Quantity = reader.GetInt32(6),
                        TotalPrice = reader.GetDouble(7)
                    });
                    firstName = reader.GetString(8);
                    lastName = reader.GetString(9);
                }
                DetailedBill db = new DetailedBill()
                {
                    BillId = billId,
                    TotalPrice = totalPrice,
                    DateTime = date,
                    Items = items,
                    EmployeeFirstName = firstName,
                    EmployeeLastName = lastName

                };
                return db;
            }
            catch (Exception ex)
            {
                throw new DataAccessException("Exception in OrderDAOImpl", ex);
            }
            finally
            {
                MySQLUtil.CloseQuietly(conn);
            }
        }

    }
}
