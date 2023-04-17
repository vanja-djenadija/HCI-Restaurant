using MySql.Data.MySqlClient;
using Restaurant.Data.DAO.Exceptions;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Data.DAO.MySQL
{
    public class DrinkDAOImpl : IDrink
    {
        public bool CheckDrinkQuantity(int drinkId, int quantity)
        {
            MySqlConnection conn = null;
            MySqlCommand cmd;
            try
            {
                conn = MySQLUtil.GetMySQLConnection();
                cmd = new MySqlCommand("provjeraStanjaPića", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@idArtikal", MySqlDbType.Int32).Value = drinkId;
                cmd.Parameters.Add("@količina", MySqlDbType.Int32).Value = quantity;
                cmd.Parameters.Add("@dodajArtikal", MySqlDbType.Bit).Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                bool canAddDrink = Convert.ToBoolean(cmd.Parameters["@dodajArtikal"].Value);
                return canAddDrink;
            }
            catch (Exception ex)
            {
                throw new DataAccessException("Exception in CheckDrinkQuantity", ex);
            }
            finally
            {
                MySQLUtil.CloseQuietly(conn);
            }
        }
    }
}
