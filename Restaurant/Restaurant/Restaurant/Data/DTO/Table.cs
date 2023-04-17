using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Data.DTO
{
    public class Table
    {
        public int Id { get; set; }
        public int NumberOfSeats { get; set; }
        public bool Taken { get; set; }

    }
}
