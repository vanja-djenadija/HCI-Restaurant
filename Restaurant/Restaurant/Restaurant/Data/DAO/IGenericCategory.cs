using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Data.DAO
{
    public interface IGenericCategory<T>
    {
        List<T> GetCategories();

        bool AddCategory(T type);

        bool DeleteCategory(T type);

        void UpdateCategory(T type);
    }
}
