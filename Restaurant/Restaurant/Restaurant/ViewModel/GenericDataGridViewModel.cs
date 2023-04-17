using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.ViewModel
{
    public class GenericDataGridViewModel<T>
    {
        public IList<T> Objects = new List<T>();
        public ObservableCollection<T> Items { get; set; }
        public T SelectedItem { get; set; }
    }
}
