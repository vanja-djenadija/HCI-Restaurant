using Microsoft.Win32;
using Restaurant.Data.DAO.MySQL;
using Restaurant.Data.DTO;
using Restaurant.ViewModel;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.IO;
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
using System.Windows.Shapes;

namespace Restaurant.Forms.Windows.Modals
{
    /// <summary>
    /// Interaction logic for AddNewItemModal.xaml
    /// </summary>
    public partial class AddNewItemModal : Window
    {
        private readonly List<ItemCategory> ItemCategories = new ItemCategoryDAOImpl().GetCategories();
        private readonly List<ManufacturerCategory> ManufacturerCategories = new ManufacturerCategoryDAOImpl().GetCategories();
        private readonly List<string> ItemCategoryNames = new List<string>();
        private readonly List<string> ManufacturerCategoryNames = new List<string>();
        public string ItemImagePath { get; set; }
        public bool FoodAdded { get; private set; } = false;
        public bool DrinkAdded { get; private set; } = false;
        public Food Food = new Food();
        public Drink Drink = new Drink();

        public AddNewItemModal()
        {
            InitializeComponent();
            SetCategoryNames();
            FoodItemCategoryComboBox.ItemsSource = ItemCategoryNames;
            DrinkItemCategoryComboBox.ItemsSource = ItemCategoryNames;
            ManufacturerCategoryComboBox.ItemsSource = ManufacturerCategoryNames;
            FoodTabItem.DataContext = Food;
            DrinkTabItem.DataContext = Drink;
        }

        private void SetCategoryNames()
        {
            ItemCategories.ForEach(c => ItemCategoryNames.Add(c.Name));
            ManufacturerCategories.ForEach(c => ManufacturerCategoryNames.Add(c.Name));
        }

        private void AddFood_Click(object sender, RoutedEventArgs e)
        {
            if (!ValidFoodInput())
                return;

            foreach (ItemCategory category in ItemCategories)
            {
                if (category.Name.Equals(FoodItemCategoryComboBox.SelectedValue))
                {
                    Food.ItemCategory = category;
                    break;
                }
            }
            FoodAdded = true;
            this.Close();
        }

        private bool ValidFoodInput()
        {
            if (String.IsNullOrEmpty(FoodNameTextBox.Text) ||
                String.IsNullOrEmpty(FoodPriceTextBox.Text) ||
                String.IsNullOrEmpty(FoodDescriptionTextBox.Text) ||
                String.IsNullOrEmpty(FoodRecipeTextBox.Text) ||
                FoodPortionSizeComboBox.SelectedIndex < 0 ||
                FoodItemCategoryComboBox.SelectedIndex < 0 ||
                String.IsNullOrEmpty(FoodImageTextBox.Text))
            {
                Snackbar.MessageQueue?.Enqueue("Fill all fields", null, null, null, false, true, TimeSpan.FromSeconds(3));
                return false;
            }
            return true;
        }

        private bool ValidDrinkInput()
        {
            if (String.IsNullOrEmpty(DrinkNameTextBox.Text) ||
                String.IsNullOrEmpty(DrinkPriceTextBox.Text) ||
                String.IsNullOrEmpty(DrinkDescriptionTextBox.Text) ||
                String.IsNullOrEmpty(DrinkQuantityTextBox.Text) ||
                ManufacturerCategoryComboBox.SelectedIndex < 0 ||
                DrinkItemCategoryComboBox.SelectedIndex < 0 ||
                String.IsNullOrEmpty(DrinkImageTextBox.Text))
            {
                Snackbar.MessageQueue?.Enqueue("Fill all fields", null, null, null, false, true, TimeSpan.FromSeconds(3));
                return false;
            }
            return true;
        }

        private void Cancel_Click(object sender, RoutedEventArgs e)
        {
            FoodAdded = false;
            DrinkAdded = false;
            this.Close();
        }

        private void AddFoodImage_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();

            if (openFileDialog.ShowDialog() == true)
            {
                ItemImagePath = openFileDialog.FileName;
                FoodImageTextBox.Text = new DirectoryInfo(ItemImagePath).Name;
            }
        }

        private void AddDrinkImage_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();

            if (openFileDialog.ShowDialog() == true)
            {
                ItemImagePath = openFileDialog.FileName;
                DrinkImageTextBox.Text = new DirectoryInfo(ItemImagePath).Name;
            }
        }

        private void AddDrink_Click(object sender, RoutedEventArgs e)
        {
            if (!ValidDrinkInput())
                return;

            foreach (ItemCategory category in ItemCategories)
            {
                if (category.Name.Equals(DrinkItemCategoryComboBox.SelectedValue))
                {
                    Drink.ItemCategory = category;
                    break;
                }
            }
            foreach (ManufacturerCategory category in ManufacturerCategories)
            {
                if (category.Name.Equals(ManufacturerCategoryComboBox.SelectedValue))
                {
                    Drink.ManufacturerCategory = category;
                    break;
                }
            }
            DrinkAdded = true;
            this.Close();
        }
    }
}
