using Restaurant.Data.DAO.MySQL;
using Restaurant.Data.DTO;
using Restaurant.Forms.Windows.Modals;
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

namespace Restaurant.Forms.Pages
{
    /// <summary>
    /// Interaction logic for BillsPage.xaml
    /// </summary>
    public partial class BillsPage : Page
    {
        private readonly GenericDataGridViewModel<Bill> billsViewModel;
        private readonly BillDAOImpl dao = new BillDAOImpl();

        public BillsPage()
        {
            InitializeComponent();
            List<Bill> bills = dao.GetBills();
            this.billsViewModel = new GenericDataGridViewModel<Bill>()
            {
                Objects = bills,
                Items = new ObservableCollection<Bill>(bills)
            };

            this.DataContext = billsViewModel;
        }

        public void ViewBill_Click(object sender, RoutedEventArgs e)
        {
            Bill bill = (Bill)DataGridBills.SelectedItem;
            if (bill == null)
                Snackbar.MessageQueue?.Enqueue("No selected items.", null, null, null, false, true, TimeSpan.FromSeconds(3));
            else
            {
                DetailedBill detailedBill = dao.GetBill(bill.Id);
                DetailedBillModal modal = new DetailedBillModal(detailedBill);
                modal.Show();
            }
        }

        private void ApplyButton_Click(object sender, RoutedEventArgs e)
        {
            DateTime? selectedFromDate = FromDatePicker.SelectedDate;
            DateTime? selectedToDate = ToDatePicker.SelectedDate;
            if (selectedFromDate.HasValue && selectedToDate.HasValue)
            {
                billsViewModel.Items.Clear();
                IEnumerable<Bill> filtered = billsViewModel.Objects.Where(bill => bill.DateTime >= selectedFromDate && bill.DateTime <= selectedToDate);
                foreach (Bill bill in filtered)
                {
                    billsViewModel.Items.Add(bill);
                }
                Snackbar.MessageQueue?.Enqueue("Filtered.", null, null, null, false, true, TimeSpan.FromSeconds(3));
            }
        }

        private void RefreshButton_Click(object sender, RoutedEventArgs e)
        {
            billsViewModel.Items.Clear();
            billsViewModel.Objects = dao.GetBills();
            foreach (Bill bill in billsViewModel.Objects)
            {
                billsViewModel.Items.Add(bill);
            }
            Snackbar.MessageQueue?.Enqueue("Refreshed.", null, null, null, false, true, TimeSpan.FromSeconds(3));
        }
    }
}
