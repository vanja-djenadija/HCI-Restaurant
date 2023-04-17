using Restaurant.Data.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Data.DAO
{
    public interface IOrder
    {
        List<Order> GetOrders(Employee employee);

        bool AddOrder(int tableId, List<OrderItem> orderedItems, Employee employee);

        bool DeleteOrder(int orderId);
    }
}
