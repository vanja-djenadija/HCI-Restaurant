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
    public class EmployeeDAOImpl : IEmployee
    {
        private static readonly string SELECT = "SELECT * FROM `ZAPOSLENI` ORDER BY Prezime";
        private static readonly string DELETE = "DELETE FROM `ZAPOSLENI` WHERE IdZaposleni=@IdZaposleni";
        private static readonly string UPDATE = "UPDATE `ZAPOSLENI` SET Uloga=@Uloga, Ime=@Ime, Prezime=@Prezime, KorisničkoIme=@KorisničkoIme, Lozinka=@Lozinka, BrojTelefona=@BrojTelefona, MjestoStanovanja=@MjestoStanovanja  WHERE IdZaposleni=@IdZaposleni";
        private static readonly string INSERT = "INSERT INTO `ZAPOSLENI`(Uloga, Ime, Prezime, KorisničkoIme, Lozinka, BrojTelefona, MjestoStanovanja) VALUES (@Uloga, @Ime, @Prezime, @KorisničkoIme, @Lozinka, @BrojTelefona, @MjestoStanovanja)";


        public bool AddEmployee(Employee employee)
        {
            bool result = false;
            MySqlConnection conn = null;
            MySqlCommand cmd;
            try
            {
                conn = MySQLUtil.GetMySQLConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = INSERT;
                cmd.Parameters.AddWithValue("@Uloga", employee.Role);
                cmd.Parameters.AddWithValue("@Ime", employee.Name);
                cmd.Parameters.AddWithValue("@Prezime", employee.Lastname);
                cmd.Parameters.AddWithValue("@KorisničkoIme", employee.Username);
                cmd.Parameters.AddWithValue("@Lozinka", employee.Password);
                cmd.Parameters.AddWithValue("@BrojTelefona", employee.PhoneNumber);
                cmd.Parameters.AddWithValue("@MjestoStanovanja", employee.PlaceOfResidence);
                result = cmd.ExecuteNonQuery() == 1;
                employee.Id = (int)cmd.LastInsertedId;
            }
            catch (Exception ex)
            {
                throw new DataAccessException("Exception in EmployeeDAOImpl", ex);
            }
            finally
            {
                MySQLUtil.CloseQuietly(conn);
            }
            return result;
        }

        public bool DeleteEmployee(int employeeId)
        {
            bool result = false;
            MySqlConnection conn = null;
            MySqlCommand cmd;
            try
            {
                conn = MySQLUtil.GetMySQLConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = DELETE;
                cmd.Parameters.AddWithValue("@IdZaposleni", employeeId);
                result = cmd.ExecuteNonQuery() == 1;
            }
            catch (Exception ex)
            {
                throw new DataAccessException("Exception in EmployeeDAOImpl", ex);
            }
            finally
            {
                MySQLUtil.CloseQuietly(conn);
            }
            return result;
        }

        public List<Employee> GetEmployees()
        {
            List<Employee> result = new List<Employee>();
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
                    result.Add(new Employee()
                    {
                        Id = reader.GetInt32(0),
                        Role = reader.GetString(1),
                        Name = reader.GetString(2),
                        Lastname = reader.GetString(3),
                        Username = reader.GetString(4),
                        Password = reader.GetString(5),
                        PhoneNumber = reader.GetString(6),
                        PlaceOfResidence = reader.GetString(7)
                    });
                }
            }
            catch (Exception ex)
            {
                throw new DataAccessException("Exception in EmployeeDAOImpl", ex);
            }
            finally
            {
                MySQLUtil.CloseQuietly(reader, conn);
            }
            return result;
        }

        public void UpdateEmployee(Employee employee)
        {
            MySqlConnection conn = null;
            MySqlCommand cmd;
            try
            {
                conn = MySQLUtil.GetMySQLConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = UPDATE;
                cmd.Parameters.AddWithValue("@IdZaposleni", employee.Id);
                cmd.Parameters.AddWithValue("@Uloga", employee.Role);
                cmd.Parameters.AddWithValue("@Ime", employee.Name);
                cmd.Parameters.AddWithValue("@Prezime", employee.Lastname);
                cmd.Parameters.AddWithValue("@KorisničkoIme", employee.Username);
                cmd.Parameters.AddWithValue("@Lozinka", employee.Password);
                cmd.Parameters.AddWithValue("@BrojTelefona", employee.PhoneNumber);
                cmd.Parameters.AddWithValue("@MjestoStanovanja", employee.PlaceOfResidence);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new DataAccessException("Exception in EmployeeDAOImpl", ex);
            }
            finally
            {
                MySQLUtil.CloseQuietly(conn);
            }
        }
    }
}
