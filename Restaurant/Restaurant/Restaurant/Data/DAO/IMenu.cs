using Restaurant.Data.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Data.DAO
{
    public interface IMenu
    {
        List<Item> GetItems(String name);

        int AddItem(Item type);

        bool DeleteItem(Item type);
    }
}
