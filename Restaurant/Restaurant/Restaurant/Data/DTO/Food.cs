using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Data.DTO
{
    public class Food : Item
    {
        protected Food(Item other) : base(other)
        {
        }

        public Food()
        {

        }
        public string Recipe { get; set; }
        public string PortionSize { get; set; }
    }
}
