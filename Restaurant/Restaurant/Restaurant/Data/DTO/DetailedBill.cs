using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Data.DTO
{
    public class DetailedBill
    {

        public int BillId { get; set; }
        public double TotalPrice { get; set; }
        public DateTime DateTime { get; set; }
        public List<BillItem> Items = new List<BillItem>();
        public String? EmployeeFirstName { get; set; }
        public String? EmployeeLastName { get; set; }

        public string FullName
        {
            get
            {
                return EmployeeFirstName + " " + EmployeeLastName;
            }
        }

    }
}
