using Restaurant.Data.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Data.DAO
{
    public interface IEmployee
    {
        List<Employee> GetEmployees();

        bool AddEmployee(Employee employee);

        bool DeleteEmployee(int employeeId);

        void UpdateEmployee(Employee employee);
    }
}
