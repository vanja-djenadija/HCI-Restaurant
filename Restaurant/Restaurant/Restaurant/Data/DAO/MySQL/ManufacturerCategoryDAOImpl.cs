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
    public class ManufacturerCategoryDAOImpl : IGenericCategory<ManufacturerCategory>
    {
        private static readonly string SELECT = "SELECT * FROM `PROIZVOĐAČ` ORDER BY Naziv";
        private static readonly string DELETE = "DELETE FROM `PROIZVOĐAČ` WHERE IdProizvođač=@IdProizvođač";
        private static readonly string UPDATE = "UPDATE `PROIZVOĐAČ` SET Naziv=@Naziv WHERE IdProizvođač=@IdProizvođač";
        private static readonly string INSERT = "INSERT INTO `PROIZVOĐAČ`(Naziv) VALUES (@Naziv)";

        public bool AddCategory(ManufacturerCategory type)
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
                throw new DataAccessException("Exception in ManufacturerCategoryDAOImpl", ex);
            }
            finally
            {
                MySQLUtil.CloseQuietly(conn);
            }
            return result;
        }

        public bool DeleteCategory(ManufacturerCategory type)
        {
            bool result = false;
            MySqlConnection conn = null;
            MySqlCommand cmd;
            try
            {
                conn = MySQLUtil.GetMySQLConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = DELETE;
                cmd.Parameters.AddWithValue("@IdProizvođač", type.Id);
                result = cmd.ExecuteNonQuery() == 1;
            }
            catch (Exception ex)
            {
                throw new DataAccessException("Exception in ManufacturerCategoryDAOImpl", ex);
            }
            finally
            {
                MySQLUtil.CloseQuietly(conn);
            }
            return result;
        }

        public List<ManufacturerCategory> GetCategories()
        {
            List<ManufacturerCategory> result = new List<ManufacturerCategory>();
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
                    result.Add(new ManufacturerCategory()
                    {
                        Id = reader.GetInt32(0),
                        Name = reader.GetString(1)
                    });
                }
            }
            catch (Exception ex)
            {
                throw new DataAccessException("Exception in ManufacturerCategoryDAOImpl", ex);
            }
            finally
            {
                MySQLUtil.CloseQuietly(reader, conn);
            }
            return result;
        }

        public void UpdateCategory(ManufacturerCategory type)
        {
            MySqlConnection conn = null;
            MySqlCommand cmd;
            try
            {
                conn = MySQLUtil.GetMySQLConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = UPDATE;
                cmd.Parameters.AddWithValue("@IdProizvođač", type.Id);
                cmd.Parameters.AddWithValue("@Naziv", type.Name);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new DataAccessException("Exception in ManufacturerCategoryDAOImpl", ex);
            }
            finally
            {
                MySQLUtil.CloseQuietly(conn);
            }
        }
    }
}