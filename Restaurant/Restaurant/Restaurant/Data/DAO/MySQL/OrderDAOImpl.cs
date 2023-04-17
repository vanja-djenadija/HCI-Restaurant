using MySql.Data.MySqlClient;
using Restaurant.Data.DAO.Exceptions;
using Restaurant.Data.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Data.DAO.MySQL
{
    public class OrderDAOImpl : IOrder
    {

        public bool AddOrder(int tableId, List<OrderItem> orderedItems, Employee employee)
        {
            bool result = false;
            MySqlTransaction tr = null;
            MySqlConnection conn = null;
            MySqlCommand cmd;
            try
            {
                conn = MySQLUtil.GetMySQLConnection();
                tr = conn.BeginTransaction();
                cmd = new MySqlCommand("dodajNarudžbu", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@idSto", MySqlDbType.Int32).Value = tableId;
                cmd.Parameters.Add("@zaposleniId", MySqlDbType.Int32).Value = employee.Id;
                cmd.Parameters.Add("@narudžbaId", MySqlDbType.Int32).Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                int orderId = Convert.ToInt32(cmd.Parameters["@narudžbaId"].Value);

                foreach (OrderItem item in orderedItems)
                {
                    cmd = new MySqlCommand("dodajArtikalUNarudžbu", conn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add("@idNarudžba", MySqlDbType.Int32).Value = orderId;
                    cmd.Parameters.Add("@idArtikal", MySqlDbType.Int32).Value = item.Id;
                    cmd.Parameters.Add("@kol", MySqlDbType.Int32).Value = item.Quantity;
                    cmd.ExecuteNonQuery();
                }
                tr.Commit();
            }
            catch (Exception ex)
            {
                throw new DataAccessException("Exception in OrderDAOImpl", ex);
            }
            finally
            {
                MySQLUtil.CloseQuietly(conn);
            }
            return result;
        }

        public bool DeleteOrder(int orderId)
        {
            bool result = false;
            MySqlConnection conn = null;
            MySqlCommand cmd;
            try
            {
                conn = MySQLUtil.GetMySQLConnection();
                cmd = new MySqlCommand("obrišiNarudžbu", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@idNarudžba", MySqlDbType.Int32).Value = orderId;
                result = cmd.ExecuteNonQuery() == 1;
            }
            catch (Exception ex)
            {
                throw new DataAccessException("Exception in OrderDAOImpl", ex);
            }
            finally
            {
                MySQLUtil.CloseQuietly(conn);
            }
            return result;
        }

        public List<Order> GetOrders(Employee employee)
        {
            List<Order> result = new List<Order>();
            MySqlConnection conn = null;
            MySqlDataReader reader = null;
            MySqlCommand cmd;
            try
            {
                conn = MySQLUtil.GetMySQLConnection();
                cmd = new MySqlCommand("narudžbeZaposlenog", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@idZaposleni", MySqlDbType.Int32).Value = employee.Id;
                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    result.Add(new Order()
                    {
                        Id = reader.GetInt32(0),
                        DateTime = reader.GetDateTime(1),
                        TableId = reader.GetInt32(2),
                        OrderStatus = new Status { Id = reader.GetInt32(6), Name = reader.GetString(7) },
                        BillId = reader.IsDBNull(4) ? 0 : reader.GetInt32(4),
                        EmployeeId = reader.GetInt32(5)
                    });
                }
            }
            catch (Exception ex)
            {
                throw new DataAccessException("Exception in OrderDAOImpl", ex);
            }
            finally
            {
                MySQLUtil.CloseQuietly(conn);
            }
            return result;
        }
    }
}
