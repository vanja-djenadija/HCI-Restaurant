using Restaurant.Data.DTO;
using System;
using System.Collections.Generic;
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
    /// Interaction logic for EditItemCategoryModal.xaml
    /// </summary>
    public partial class EditItemCategoryModal : Window
    {
        private readonly ItemCategory itemCategory;
        public bool ItemCategoryUpdated { get; private set; } = false;

        public EditItemCategoryModal(ItemCategory itemCategory)
        {
            this.itemCategory = itemCategory;
            this.DataContext = itemCategory;
            InitializeComponent();
        }

        private void Update_Click(object sender, RoutedEventArgs e)
        {
            if (String.IsNullOrEmpty(NameTextBox.Text))
            {
                ModalSnackbar.MessageQueue?.Enqueue("Fill all fields.", null, null, null, false, true, TimeSpan.FromSeconds(3));
            }
            else
            {
                ItemCategoryUpdated = true;
                this.Close();
            }
        }

        private void Cancel_Click(object sender, RoutedEventArgs e)
        {
            ItemCategoryUpdated = false;
            this.Close();
        }

        public ItemCategory GetItemCategory()
        {
            return itemCategory;
        }
    }
}
