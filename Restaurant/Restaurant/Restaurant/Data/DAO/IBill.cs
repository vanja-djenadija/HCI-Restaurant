using Restaurant.Data.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Data.DAO
{
    public interface IBill
    {
        int CreateBill(int orderId);
        List<Bill> GetBills();
        DetailedBill GetBill(int billId);
    }
}
