using Restaurant.Data.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Data.DAO
{
    public interface ITable
    {
        List<Table> GetTables();
        bool Addtable(Table table);

        bool DeleteTable(int tableId);

        void UpdateTable(Table table);
    }
}
