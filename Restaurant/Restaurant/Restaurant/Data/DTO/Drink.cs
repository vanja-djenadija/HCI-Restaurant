using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Data.DTO
{
    public class Drink : Item
    {
        protected Drink(Item other) : base(other)
        {
        }

        public Drink()
        {

        }
        public int Quantity { get; set; }
        public ManufacturerCategory ManufacturerCategory { get; set; }
    }
}
