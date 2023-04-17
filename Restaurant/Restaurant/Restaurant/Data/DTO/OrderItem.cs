using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Data.DTO
{
    public class OrderItem : Item
    {
        public int Quantity { get; set; }

        public OrderItem(Item other) : base(other)
        {
            Quantity = 1;
        }

        public void IncrementQuantity()
        {
            Quantity++;
        }

        public void DecrementQuantity()
        {
            Quantity--;
        }
    }
}
