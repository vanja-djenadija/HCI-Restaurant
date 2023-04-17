using CustomMessageBox;
using Restaurant.Data.DAO.Exceptions;
using Restaurant.Data.DAO.MySQL;
using Restaurant.Data.DTO;
using Restaurant.Forms.Windows;
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
using Table = Restaurant.Data.DTO.Table;

namespace Restaurant.Forms.Pages
{
    /// <summary>
    /// Interaction logic for CategoriesPage.xaml
    /// </summary>
    public partial class CategoriesPage : Page
    {
        // TODO Code repetition -> refactor
        // TODO DataAccessException try catch
        // TODO Hardcoding snackbar time
        // TODO Poruke u Snackbaru lokalizovati takođe
        private readonly GenericDataGridViewModel<ManufacturerCategory> manufacturerCategoryViewModel;
        private readonly GenericDataGridViewModel<ItemCategory> itemCategoryViewModel;
        private readonly GenericDataGridViewModel<Data.DTO.Table> tableViewModel;
        private readonly ManufacturerCategoryDAOImpl daoManufacurer = new ManufacturerCategoryDAOImpl();
        private readonly ItemCategoryDAOImpl daoItemCategory = new ItemCategoryDAOImpl();
        private readonly TableDAOImpl daoTable = new TableDAOImpl();

        public CategoriesPage()
        {
            InitializeComponent();
            manufacturerCategoryViewModel = new GenericDataGridViewModel<ManufacturerCategory>()
            {
                Items = new ObservableCollection<ManufacturerCategory>(daoManufacurer.GetCategories())
            };
            itemCategoryViewModel = new GenericDataGridViewModel<ItemCategory>()
            {
                Items = new ObservableCollection<ItemCategory>(daoItemCategory.GetCategories())
            };
            tableViewModel = new GenericDataGridViewModel<Data.DTO.Table>()
            {
                Items = new ObservableCollection<Data.DTO.Table>(daoTable.GetTables())
            };
            DataGridManufacturers.DataContext = manufacturerCategoryViewModel;
            DataGridItemCategories.DataContext = itemCategoryViewModel;
            DataGridTables.DataContext = tableViewModel;
        }

        public void DeleteManufacturer_Click(object sender, RoutedEventArgs e)
        {
            if (DataGridManufacturers.SelectedItems.Count == 0)
            {
                new MessageBoxCustom("No selected items.", MessageType.Info, MessageButtons.Ok).ShowDialog();
            }
            else
            {
                bool? Result = new MessageBoxCustom("Are you sure you want to delete?", MessageType.Confirmation, MessageButtons.YesNo).ShowDialog();
                if (Result == false)
                    return;

                int res = 0, toDelete = DataGridManufacturers.SelectedItems.Count;
                List<ManufacturerCategory> selected = new List<ManufacturerCategory>();
                foreach (ManufacturerCategory category in DataGridManufacturers.SelectedItems)
                    selected.Add(category);
                try
                {
                    foreach (ManufacturerCategory category in selected)
                    {
                        if (daoManufacurer.DeleteCategory(category) == true)
                            res++;

                        manufacturerCategoryViewModel.Items.Remove(category);
                    }
                    if (res == toDelete)
                        CategoriesSnackbar.MessageQueue?.Enqueue("Successfully deleted.", null, null, null, false, true, TimeSpan.FromSeconds(3));
                    else
                        CategoriesSnackbar.MessageQueue?.Enqueue("Unsuccessfully deleted.", null, null, null, false, true, TimeSpan.FromSeconds(3));
                }
                catch (DataAccessException)
                {
                    CategoriesSnackbar.MessageQueue?.Enqueue("Error.", null, null, null, false, true, TimeSpan.FromSeconds(3));
                }
            }
        }

        public void AddManufacturer_Click(object sender, RoutedEventArgs e)
        {
            ManufacturerModal modal = new ManufacturerModal();
            modal.ShowDialog();
            try
            {
                if (modal.ManufacturerAdded)
                {
                    manufacturerCategoryViewModel.Items.Add(modal.GetManufacturerCategory());
                    daoManufacurer.AddCategory(modal.GetManufacturerCategory());
                    CategoriesSnackbar.MessageQueue?.Enqueue("Manufacturer added.", null, null, null, false, true, TimeSpan.FromSeconds(5));
                }
            }
            catch (DataAccessException)
            {
                CategoriesSnackbar.MessageQueue?.Enqueue("Error.", null, null, null, false, true, TimeSpan.FromSeconds(3));
            }
        }

        public void EditManufacturer_Click(object sender, RoutedEventArgs e)
        {
            ManufacturerCategory category = (ManufacturerCategory)DataGridManufacturers.SelectedItem;
            if (category == null)
                new MessageBoxCustom("No selected items.", MessageType.Info, MessageButtons.Ok).ShowDialog();
            else
            {
                EditManufacturerModal modal = new EditManufacturerModal(category);
                modal.ShowDialog();
                try
                {
                    if (modal.CategoryUpdated)
                    {
                        manufacturerCategoryViewModel.Items.Remove(category);
                        manufacturerCategoryViewModel.Items.Add(modal.GetCategory());
                        daoManufacurer.UpdateCategory(modal.GetCategory());
                        CategoriesSnackbar.MessageQueue?.Enqueue("Manufacturer category updated.", null, null, null, false, true, TimeSpan.FromSeconds(3));
                    }
                }
                catch (DataAccessException)
                {
                    CategoriesSnackbar.MessageQueue?.Enqueue("Error.", null, null, null, false, true, TimeSpan.FromSeconds(3));
                }
            }
        }

        public void DeleteItemCategory_Click(object sender, RoutedEventArgs e)
        {
            if (DataGridItemCategories.SelectedItems.Count == 0)
            {
                new MessageBoxCustom("No selected items.", MessageType.Info, MessageButtons.Ok).ShowDialog();
            }
            else
            {
                bool? Result = new MessageBoxCustom("Are you sure you want to delete?", MessageType.Confirmation, MessageButtons.YesNo).ShowDialog();
                if (Result == false)
                    return;

                int res = 0, toDelete = DataGridItemCategories.SelectedItems.Count;
                List<ItemCategory> selected = new List<ItemCategory>();
                foreach (ItemCategory category in DataGridItemCategories.SelectedItems)
                    selected.Add(category);
                try
                {
                    foreach (ItemCategory category in selected)
                    {
                        if (daoItemCategory.DeleteCategory(category) == true)
                            res++;

                        itemCategoryViewModel.Items.Remove(category);
                    }
                    if (res == toDelete)
                        CategoriesSnackbar.MessageQueue?.Enqueue("Successfully deleted.", null, null, null, false, true, TimeSpan.FromSeconds(3));
                    else
                        CategoriesSnackbar.MessageQueue?.Enqueue("Unsuccessfully deleted.", null, null, null, false, true, TimeSpan.FromSeconds(3));
                }
                catch (DataAccessException)
                {
                    CategoriesSnackbar.MessageQueue?.Enqueue("Error.", null, null, null, false, true, TimeSpan.FromSeconds(3));
                }
            }
        }

        public void AddItemCategory_Click(object sender, RoutedEventArgs e)
        {
            ItemCategoryModal modal = new ItemCategoryModal();
            modal.ShowDialog();
            try
            {
                if (modal.ItemCategoryAdded)
                {
                    itemCategoryViewModel.Items.Add(modal.GetItemCategory());
                    daoItemCategory.AddCategory(modal.GetItemCategory());
                    CategoriesSnackbar.MessageQueue?.Enqueue("Item category added.", null, null, null, false, true, TimeSpan.FromSeconds(3));
                }
            }
            catch (DataAccessException)
            {
                CategoriesSnackbar.MessageQueue?.Enqueue("Error.", null, null, null, false, true, TimeSpan.FromSeconds(3));
            }
        }

        public void EditItemCategory_Click(object sender, RoutedEventArgs e)
        {
            ItemCategory itemCategory = (ItemCategory)DataGridItemCategories.SelectedItem;
            if (itemCategory == null)
                new MessageBoxCustom("No selected items.", MessageType.Info, MessageButtons.Ok).ShowDialog();
            else
            {
                EditItemCategoryModal modal = new EditItemCategoryModal(itemCategory);
                modal.ShowDialog();
                try
                {
                    if (modal.ItemCategoryUpdated)
                    {
                        itemCategoryViewModel.Items.Remove(itemCategory);
                        itemCategoryViewModel.Items.Add(modal.GetItemCategory());
                        daoItemCategory.UpdateCategory(modal.GetItemCategory());
                        CategoriesSnackbar.MessageQueue?.Enqueue("Item category updated.", null, null, null, false, true, TimeSpan.FromSeconds(3));
                    }
                }
                catch (DataAccessException)
                {
                    CategoriesSnackbar.MessageQueue?.Enqueue("Error.", null, null, null, false, true, TimeSpan.FromSeconds(3));
                }
            }
        }

        public void DeleteTable_Click(object sender, RoutedEventArgs e)
        {
            if (DataGridTables.SelectedItems.Count == 0)
            {
                new MessageBoxCustom("No selected items.", MessageType.Info, MessageButtons.Ok).ShowDialog();
            }
            else
            {
                bool? Result = new MessageBoxCustom("Are you sure you want to delete?", MessageType.Confirmation, MessageButtons.YesNo).ShowDialog();
                if (Result == false)
                    return;

                int res = 0, toDelete = DataGridTables.SelectedItems.Count;
                List<Table> selected = new List<Table>();
                foreach (Table category in DataGridTables.SelectedItems)
                    selected.Add(category);
                try
                {
                    foreach (Table category in selected)
                    {
                        if (daoTable.DeleteTable(category.Id) == true)
                            res++;

                        tableViewModel.Items.Remove(category);
                    }
                    if (res == toDelete)
                        CategoriesSnackbar.MessageQueue?.Enqueue("Successfully deleted.", null, null, null, false, true, TimeSpan.FromSeconds(3));
                    else
                        CategoriesSnackbar.MessageQueue?.Enqueue("Unsuccessfully deleted.", null, null, null, false, true, TimeSpan.FromSeconds(3));
                }
                catch (DataAccessException)
                {
                    CategoriesSnackbar.MessageQueue?.Enqueue("Error.", null, null, null, false, true, TimeSpan.FromSeconds(3));
                }
            }
        }

        public void AddTable_Click(object sender, RoutedEventArgs e)
        {
            TableModal modal = new TableModal();
            modal.ShowDialog();

            if (modal.TableAdded)
            {
                tableViewModel.Items.Add(modal.GetTable());
                daoTable.Addtable(modal.GetTable());
                CategoriesSnackbar.MessageQueue?.Enqueue("Table added.", null, null, null, false, true, TimeSpan.FromSeconds(3));
            }
        }
    }
}
