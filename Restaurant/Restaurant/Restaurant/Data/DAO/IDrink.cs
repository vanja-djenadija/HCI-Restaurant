using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Data.DAO
{
    public interface IDrink
    {
        bool CheckDrinkQuantity(int drinkId, int quantity);
    }
}
