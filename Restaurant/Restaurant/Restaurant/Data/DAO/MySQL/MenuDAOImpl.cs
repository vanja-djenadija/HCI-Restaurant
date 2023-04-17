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
    public class MenuDAOImpl : IMenu
    {
        public int AddItem(Item type)
        {
            int itemId = -1;
            MySqlTransaction tr = null;
            MySqlConnection conn = null;
            MySqlCommand cmd;
            try
            {
                conn = MySQLUtil.GetMySQLConnection();
                tr = conn.BeginTransaction();
                cmd = new MySqlCommand("dodajArtikal", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@naziv", MySqlDbType.String).Value = type.Name;
                cmd.Parameters.Add("@cijena", MySqlDbType.Double).Value = type.Price;
                cmd.Parameters.Add("@opis", MySqlDbType.String).Value = type.Description;
                cmd.Parameters.Add("@idVrstaArtikla", MySqlDbType.Int32).Value = type.ItemCategory.Id;
                cmd.Parameters.Add("@idArtikal", MySqlDbType.Int32).Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                itemId = Convert.ToInt32(cmd.Parameters["@idArtikal"].Value);

                if (type.GetType() == typeof(Food))
                {
                    Food food = (Food)type;
                    cmd = new MySqlCommand("dodajJelo", conn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add("@artikalId", MySqlDbType.Int32).Value = itemId;
                    cmd.Parameters.Add("@recept", MySqlDbType.String).Value = food.Recipe;
                    cmd.Parameters.Add("@porcija", MySqlDbType.String).Value = food.PortionSize;

                }
                else if (type.GetType() == typeof(Drink))
                {
                    Drink drink = (Drink)type;
                    cmd = new MySqlCommand("dodajPiće", conn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add("@artikalId", MySqlDbType.Int32).Value = itemId;
                    cmd.Parameters.Add("@količina", MySqlDbType.String).Value = drink.Quantity;
                    cmd.Parameters.Add("@proizvođač", MySqlDbType.String).Value = drink.ManufacturerCategory.Name;

                }

                cmd.ExecuteNonQuery();
                tr.Commit();
            }
            catch (Exception ex)
            {
                throw new DataAccessException("Exception in MenuDAOImpl", ex);
            }
            finally
            {
                MySQLUtil.CloseQuietly(conn);
            }
            return itemId;
        }

        public bool DeleteItem(Item type)
        {
            bool result = false;
            MySqlConnection conn = null;
            MySqlCommand cmd;
            try
            {
                conn = MySQLUtil.GetMySQLConnection();
                cmd = new MySqlCommand("deaktivirajArtikal", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@artikalId", MySqlDbType.Int32).Value = type.Id;
                result = cmd.ExecuteNonQuery() == 1;
            }
            catch (Exception ex)
            {
                throw new DataAccessException("Exception in MenuDAOImpl", ex);
            }
            finally
            {
                MySQLUtil.CloseQuietly(conn);
            }
            return result;
        }

        public List<Item> GetItems(string name)
        {
            List<Item> result = new List<Item>();
            MySqlConnection conn = null;
            MySqlCommand cmd;
            try
            {
                conn = MySQLUtil.GetMySQLConnection();
                cmd = new MySqlCommand("artikli", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@naziv", MySqlDbType.String).Value = name;
                MySqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    result.Add(new Item()
                    {
                        Id = reader.GetInt32(0),
                        Name = reader.GetString(1),
                        Price = reader.GetDouble(2),
                        Description = reader.GetString(3),
                        Active = reader.GetBoolean(4),
                        ItemCategory = new ItemCategory
                        {
                            Id = reader.GetInt32(6),
                            Name = reader.GetString(7)
                        }
                    });
                }
            }
            catch (Exception ex)
            {
                throw new DataAccessException("Exception in MenuDAOImpl", ex);
            }
            finally
            {
                MySQLUtil.CloseQuietly(conn);
            }
            return result;
        }
    }
}
