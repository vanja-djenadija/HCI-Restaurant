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
    public class ItemCategoryDAOImpl : IGenericCategory<ItemCategory>
    {
        private static readonly string SELECT = "SELECT * FROM `VRSTA_ARTIKLA` ORDER BY Naziv";
        private static readonly string DELETE = "DELETE FROM `VRSTA_ARTIKLA` WHERE IdVrstaArtikla=@IdVrstaArtikla";
        private static readonly string UPDATE = "UPDATE `VRSTA_ARTIKLA` SET Naziv=@Naziv WHERE IdVrstaArtikla=@IdVrstaArtikla";
        private static readonly string INSERT = "INSERT INTO `VRSTA_ARTIKLA`(Naziv) VALUES (@Naziv)";

        public bool AddCategory(ItemCategory type)
        {
            bool result = false;
            MySqlConnection conn = null;
            MySqlCommand cmd;
            try
            {
                conn = MySQLUtil.GetMySQLConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = INSERT;
                cmd.Parameters.AddWithValue("@Naziv", type.Name);
                result = cmd.ExecuteNonQuery() == 1;
                type.Id = (int)cmd.LastInsertedId;
            }
            catch (Exception ex)
            {
                throw new DataAccessException("Exception in ItemCategoryDAOImpl", ex);
            }
            finally
            {
                MySQLUtil.CloseQuietly(conn);
            }
            return result;
        }

        public bool DeleteCategory(ItemCategory type)
        {
            bool result = false;
            MySqlConnection conn = null;
            MySqlCommand cmd;
            try
            {
                conn = MySQLUtil.GetMySQLConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = DELETE;
                cmd.Parameters.AddWithValue("@IdVrstaArtikla", type.Id);
                result = cmd.ExecuteNonQuery() == 1;
            }
            catch (Exception ex)
            {
                throw new DataAccessException("Exception in ItemCategoryDAOImpl", ex);
            }
            finally
            {
                MySQLUtil.CloseQuietly(conn);
            }
            return result;
        }

        public List<ItemCategory> GetCategories()
        {
            List<ItemCategory> result = new List<ItemCategory>();
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
                    result.Add(new ItemCategory()
                    {
                        Id = reader.GetInt32(0),
                        Name = reader.GetString(1)
                    });
                }
            }
            catch (Exception ex)
            {
                throw new DataAccessException("Exception in ItemCategoryDAOImpl", ex);
            }
            finally
            {
                MySQLUtil.CloseQuietly(reader, conn);
            }
            return result;
        }

        public void UpdateCategory(ItemCategory type)
        {
            MySqlConnection conn = null;
            MySqlCommand cmd;
            try
            {
                conn = MySQLUtil.GetMySQLConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = UPDATE;
                cmd.Parameters.AddWithValue("@IdVrstaArtikla", type.Id);
                cmd.Parameters.AddWithValue("@Naziv", type.Name);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new DataAccessException("Exception in ItemCategoryDAOImpl", ex);
            }
            finally
            {
                MySQLUtil.CloseQuietly(conn);
            }
        }
    }
}
