using Restaurant.Data.DTO;
using Restaurant.ViewModel;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Restaurant.Forms.Windows.Modals
{
    /// <summary>
    /// Interaction logic for DetailedBillModal.xaml
    /// </summary>
    public partial class DetailedBillModal : Window
    {
        private readonly DetailedBill detailedBill;
        private readonly GenericDataGridViewModel<BillItem> ViewModel;

        public DetailedBillModal(DetailedBill detailedBill)
        {
            this.detailedBill = detailedBill;
            this.DataContext = detailedBill;
            InitializeComponent();
            this.ViewModel = new GenericDataGridViewModel<BillItem>()
            {
                Items = new ObservableCollection<BillItem>(detailedBill.Items)
            };

            DataGridItems.DataContext = ViewModel;
        }

        private void CloseCommandHandler(object sender, ExecutedRoutedEventArgs e)
        {
            this.Close();
        }
    }
}
