using Restaurant.Data.DAO.MySQL;
using Restaurant.Data.DTO;
using Restaurant.ViewModel;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using Restaurant.Forms.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using CustomMessageBox;
using Restaurant.Data.DAO.Exceptions;

namespace Restaurant.Forms.Pages
{
    /// <summary>
    /// Interaction logic for OrdersPage.xaml
    /// </summary>
    public partial class OrdersPage : Page
    {
        private readonly GenericDataGridViewModel<Order> ordersViewModel;
        private readonly OrderDAOImpl daoOrder = new OrderDAOImpl();
        private readonly BillDAOImpl daoBill = new BillDAOImpl();


        public OrdersPage()
        {
            InitializeComponent();
            this.ordersViewModel = new GenericDataGridViewModel<Order>()
            {
                Items = new ObservableCollection<Order>(daoOrder.GetOrders(MainWindow.Employee))
            };
            this.DataContext = ordersViewModel;
        }

        private void Delete_Click(object sender, RoutedEventArgs e)
        {
            if (DataGridOrders.SelectedItems.Count == 0)
            {
                Snackbar.MessageQueue?.Enqueue("No selected items.", null, null, null, false, true, TimeSpan.FromSeconds(3));
            }
            else
            {
                bool? Result = new MessageBoxCustom("Are you sure you want to delete?", MessageType.Confirmation, MessageButtons.YesNo).ShowDialog();
                if (Result == false)
                    return;

                int res = 0, toDelete = DataGridOrders.SelectedItems.Count;
                List<Order> selectedOrders = new List<Order>();
                foreach (Order order in DataGridOrders.SelectedItems)
                    selectedOrders.Add(order);
                try
                {
                    foreach (Order order in selectedOrders)
                    {
                        if (daoOrder.DeleteOrder(order.Id) == true)
                            res++;

                        ordersViewModel.Items.Remove(order);
                    }
                    if (res == toDelete)
                        Snackbar.MessageQueue?.Enqueue("Successfully deleted.", null, null, null, false, true, TimeSpan.FromSeconds(3));
                    else
                        Snackbar.MessageQueue?.Enqueue("Unsuccessfully deleted.", null, null, null, false, true, TimeSpan.FromSeconds(3));
                }
                catch (DataAccessException)
                {
                    Snackbar.MessageQueue?.Enqueue("Error.", null, null, null, false, true, TimeSpan.FromSeconds(3));
                }
            }
        }

        private void MakeBill_Click(object sender, RoutedEventArgs e)
        {
            if (DataGridOrders.SelectedItems.Count == 0)
            {
                Snackbar.MessageQueue?.Enqueue("No selected items.", null, null, null, false, true, TimeSpan.FromSeconds(3));
            }
            else
            {
                Order selectedOrder = (Order)DataGridOrders.SelectedItem;
                if (selectedOrder.OrderStatus.Name.Equals("Završena"))
                {
                    Snackbar.MessageQueue?.Enqueue("Invoice already issued.", null, null, null, false, true, TimeSpan.FromSeconds(3));
                    return;
                }
                try
                {
                    int billId = daoBill.CreateBill(selectedOrder.Id);
                    ordersViewModel.Items.Remove(selectedOrder);
                    selectedOrder.OrderStatus.Id = 3;
                    selectedOrder.OrderStatus.Name = "Završena";
                    selectedOrder.BillId = billId;
                    ordersViewModel.Items.Add(selectedOrder);
                    Snackbar.MessageQueue?.Enqueue("Bill is issued.", null, null, null, false, true, TimeSpan.FromSeconds(3));
                }
                catch (DataAccessException)
                {
                    Snackbar.MessageQueue?.Enqueue("Error.", null, null, null, false, true, TimeSpan.FromSeconds(3));
                }
            }
        }

        private void RefreshButton_Click(object sender, RoutedEventArgs e)
        {
            ordersViewModel.Items.Clear();
            ordersViewModel.Objects = daoOrder.GetOrders(MainWindow.Employee);
            foreach (Order order in ordersViewModel.Objects)
            {
                ordersViewModel.Items.Add(order);
            }
            Snackbar.MessageQueue?.Enqueue("Refreshed.", null, null, null, false, true, TimeSpan.FromSeconds(3));
        }
    }
}
