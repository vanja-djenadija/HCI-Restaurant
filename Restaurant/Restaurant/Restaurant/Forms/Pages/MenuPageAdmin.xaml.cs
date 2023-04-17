using Restaurant.Data.DAO.Exceptions;
using Restaurant.Data.DAO.MySQL;
using Restaurant.Data.DTO;
using Restaurant.Forms.Windows.Modals;
using Restaurant.ViewModel;
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

namespace Restaurant.Forms.Pages
{
    /// <summary>
    /// Interaction logic for MenuPageAdmin.xaml
    /// </summary>
    public partial class MenuPageAdmin : Page
    {
        private MenuDAOImpl menuDao = new();
        private OrderDAOImpl orderDao = new();
        private readonly GenericDataGridViewModel<Item> ViewModel;
        private readonly GenericDataGridViewModel<ItemCategory> itemCategoryViewModel;
        private readonly GenericDataGridViewModel<OrderItem> orderedItemsCategoryViewModel;
        private readonly GenericDataGridViewModel<Table> tablesViewModel;

        private double totalPrice = 0.0;

        public MenuPageAdmin()
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
        }

        private void AddNewItem_Click(object sender, RoutedEventArgs e)
        {
            AddNewItemModal modal = new AddNewItemModal();
            modal.ShowDialog();
            try
            {
                if (modal.FoodAdded)
                {
                    Food food = modal.Food;
                    int itemId = menuDao.AddItem(food);
                    if (itemId != -1)
                    {
                        food.Id = itemId;
                        // copy item image to Resources/ItemImages
                        string dest = App.ItemImagesDir + Path.DirectorySeparatorChar + itemId + ".png";
                        System.IO.File.Copy(modal.ItemImagePath, dest);
                        // add to viewmodel
                        ViewModel.Items.Add(food);
                        Snackbar.MessageQueue?.Enqueue("Item successfully added.", null, null, null, false, true, TimeSpan.FromSeconds(3));
                    }

                }
                else if (modal.DrinkAdded)
                {
                    Drink drink = modal.Drink;
                    int itemId = menuDao.AddItem(drink);
                    if (itemId != -1)
                    {
                        drink.Id = itemId;
                        // copy item image to Resources/ItemImages
                        string dest = App.ItemImagesDir + Path.DirectorySeparatorChar + itemId + ".png";
                        System.IO.File.Copy(modal.ItemImagePath, dest);
                        ViewModel.Items.Add(drink);
                        Snackbar.MessageQueue?.Enqueue("Item successfully added.", null, null, null, false, true, TimeSpan.FromSeconds(3));
                    }
                }
            }
            catch (DataAccessException)
            {
                Snackbar.MessageQueue?.Enqueue("Error.", null, null, null, false, true, TimeSpan.FromSeconds(3));
            }
        }

        private void DeleteItem_Click(object sender, RoutedEventArgs e)
        {
            Item selectedItem = (Item)ViewModel.SelectedItem;
            try
            {
                bool result = menuDao.DeleteItem(selectedItem);
                if (result)
                {
                    ViewModel.Items.Remove(selectedItem);
                    Snackbar.MessageQueue?.Enqueue("Successfully deleted item.", null, null, null, false, true, TimeSpan.FromSeconds(3));
                }
            }
            catch (DataAccessException)
            {
                Snackbar.MessageQueue?.Enqueue("Error.", null, null, null, false, true, TimeSpan.FromSeconds(3));
            }
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
    }
}
