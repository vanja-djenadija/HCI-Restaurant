using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Data.DTO
{
    public class Bill
    {
        public int Id { get; set; }
        public double TotalPrice { get; set; }
        public DateTime DateTime { get; set; }

        public override string ToString()
        {
            return Id + " " + TotalPrice + " " + DateTime;
        }
    }
}
