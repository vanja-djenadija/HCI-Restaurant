using Restaurant.Data.DAO.MySQL;
using Restaurant.Data.DTO;
using Restaurant.Forms.Windows.Modals;
using Restaurant.ViewModel;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Windows;
using System.Windows.Controls;
using System.Drawing;
using System;
using System.IO;
using Restaurant.Data.DAO.Exceptions;
using System.Linq;
using Restaurant.Forms.Windows;
using System.Linq;

namespace Restaurant.Forms.Pages
{
    /// <summary>
    /// Interaction logic for MenuPage.xaml
    /// </summary>
    public partial class MenuPage : Page
    {
        private MenuDAOImpl menuDao = new();
        private OrderDAOImpl orderDao = new();
        private readonly GenericDataGridViewModel<Item> ViewModel;
        private readonly GenericDataGridViewModel<ItemCategory> itemCategoryViewModel;
        private readonly GenericDataGridViewModel<OrderItem> orderedItemsCategoryViewModel;
        private readonly GenericDataGridViewModel<Table> tablesViewModel;

        private double totalPrice = 0.0;

        public MenuPage()
        {
            InitializeComponent();
            List<Item> items = menuDao.GetItems("%").FindAll(item => item.Active);
            List<ItemCategory> categories = new ItemCategoryDAOImpl().GetCategories();
            ViewModel = new GenericDataGridViewModel<Item>()
            {
                Objects = items,
                Items = new ObservableCollection<Item>(items)
            };
            itemCategoryViewModel = new GenericDataGridViewModel<ItemCategory>()
            {
                Objects = categories,
                Items = new ObservableCollection<ItemCategory>(categories)
            };
            orderedItemsCategoryViewModel = new GenericDataGridViewModel<OrderItem>()
            {
                Objects = new List<OrderItem>(),
                Items = new ObservableCollection<OrderItem>()
            };
            tablesViewModel = new GenericDataGridViewModel<Table>()
            {
                Objects = new List<Table>(),
                Items = new ObservableCollection<Table>(new TableDAOImpl().GetTables())
            };
            this.DataContext = ViewModel;
            ItemCategoryListBox.DataContext = itemCategoryViewModel;
            OrderedItemsListBox.DataContext = orderedItemsCategoryViewModel;
            TableNumberComboBox.DataContext = tablesViewModel;
        }



        private void RemoveFilter_Click(object sender, RoutedEventArgs e)
        {
            ViewModel.Items.Clear();
            foreach (Item item in ViewModel.Objects)
            {
                ViewModel.Items.Add(item);
            }
            itemCategoryViewModel.Items.Clear();
            foreach (ItemCategory item in itemCategoryViewModel.Objects)
            {
                item.IsChecked = false;
                itemCategoryViewModel.Items.Add(item);
            }
            Snackbar.MessageQueue?.Enqueue("Filters removed.", null, null, null, false, true, TimeSpan.FromSeconds(3));
        }

        private void ApplyCategoryFilter_Click(object sender, RoutedEventArgs e)
        {
            List<ItemCategory> selectedCategories = itemCategoryViewModel.Items.ToList().Where(obj => obj.IsChecked).ToList();
            if (selectedCategories.Count == 0)
            {
                ViewModel.Items.Clear();
                foreach (var item in ViewModel.Objects)
                {
                    ViewModel.Items.Add(item);
                }
                return;
            }
            IEnumerable<Item> filteredItems = ViewModel.Objects.Where(item =>
            {
                foreach (ItemCategory cat in selectedCategories)
                {
                    if (item.ItemCategory.Name.Equals(cat.Name))
                        return true;
                }
                return false;
            });
            ViewModel.Items.Clear();
            foreach (Item item in filteredItems)
            {
                ViewModel.Items.Add(item);
            }
            Snackbar.MessageQueue?.Enqueue("Filtered.", null, null, null, false, true, TimeSpan.FromSeconds(3));
        }

        private void AddItemToOrder_Click(object sender, RoutedEventArgs e)
        {
            var button = (FrameworkElement)sender;
            var grid = (Grid)button.Tag;
            var label = grid.Children.OfType<Label>().First(i => i.Name == "ItemNameLabel");
            var labelContent = label.Content.ToString();
            Item item = ViewModel.Items.ToList().Find(item => labelContent.Equals(item.Name));
            OrderItem orderItem = new OrderItem(item);
            if (orderedItemsCategoryViewModel.Items.Contains(orderItem))
            {
                Snackbar.MessageQueue?.Enqueue("Item has already been added to order.", null, null, null, false, true, TimeSpan.FromSeconds(3));
                return;
            }
            orderedItemsCategoryViewModel.Items.Add(orderItem);
            // update TotalPriceLabel
            totalPrice += orderItem.Price;
            TotalPriceLabel.Content = totalPrice;
        }

        private void RemoveOrderItem_Click(object sender, RoutedEventArgs e)
        {
            OrderItem orderItem = (OrderItem)orderedItemsCategoryViewModel.SelectedItem;
            orderedItemsCategoryViewModel.Items.Remove(orderItem);
            Snackbar.MessageQueue?.Enqueue(orderItem.Name + " removed from order.", null, null, null, false, true, TimeSpan.FromSeconds(3));
            // update TotalPriceLabel
            totalPrice -= (orderItem.Price * orderItem.Quantity);
            TotalPriceLabel.Content = totalPrice;
        }

        private void IncreaseQuantityButton_Click(object sender, RoutedEventArgs e)
        {
            var button = (FrameworkElement)sender;
            var grid = (Grid)button.Tag;
            var quantityTextBox = grid.Children.OfType<TextBox>().First(i => i.Name == "QuantityTextBox");
            int prevQuantity = Int32.Parse(quantityTextBox.Text);
            quantityTextBox.Text = (++prevQuantity).ToString();
            // update TotalPriceLabel
            OrderItem orderItem = (OrderItem)orderedItemsCategoryViewModel.SelectedItem;
            orderItem.Quantity++;
            totalPrice += orderItem.Price;
            TotalPriceLabel.Content = totalPrice;
        }

        private void DecreaseQuantityButton_Click(object sender, RoutedEventArgs e)
        {
            var button = (FrameworkElement)sender;
            var grid = (Grid)button.Tag;
            var quantityTextBox = grid.Children.OfType<TextBox>().First(i => i.Name == "QuantityTextBox");
            int prevQuantity = Int32.Parse(quantityTextBox.Text);
            if (prevQuantity == 1)
            {
                RemoveOrderItem_Click(sender, e);
                return;
            }
            quantityTextBox.Text = (--prevQuantity).ToString();
            // update TotalPriceLabel
            OrderItem orderItem = (OrderItem)orderedItemsCategoryViewModel.SelectedItem;
            orderItem.Quantity--;
            totalPrice -= orderItem.Price;
            TotalPriceLabel.Content = totalPrice;
        }

        private void CreateOrder_Click(object sender, RoutedEventArgs e)
        {
            List<OrderItem> orderItems = orderedItemsCategoryViewModel.Items.ToList();
            Table table = (Table)TableNumberComboBox.SelectedItem;
            if (orderItems.Count == 0 || table == null)
            {
                Snackbar.MessageQueue?.Enqueue("Not able to create order.", null, null, null, false, true, TimeSpan.FromSeconds(3));
                return;
            }
            try
            {
                orderDao.AddOrder(table.Id, orderItems, MainWindow.Employee);
                Snackbar.MessageQueue?.Enqueue("Order is created.", null, null, null, false, true, TimeSpan.FromSeconds(3));
                TotalPriceLabel.Content = 0;
                totalPrice = 0;
                orderedItemsCategoryViewModel.Items.Clear();
            }
            catch (DataAccessException)
            {
                Snackbar.MessageQueue?.Enqueue("Error", null, null, null, false, true, TimeSpan.FromSeconds(3));
            }
        }
    }
}
