using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Data.DTO
{
    public class Order
    {
        public int Id { get; set; }
        public DateTime DateTime { get; set; }
        public int TableId { get; set; }
        public Status OrderStatus { get; set; }
        public int? BillId { get; set; }
        public int EmployeeId { get; set; }
    }
}
