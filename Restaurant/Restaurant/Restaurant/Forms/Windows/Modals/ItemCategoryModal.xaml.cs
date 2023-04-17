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
    /// Interaction logic for ItemCategoryModal.xaml
    /// </summary>
    public partial class ItemCategoryModal : Window
    {

        private readonly ItemCategory itemCategory = new ItemCategory();
        public bool ItemCategoryAdded { get; private set; } = false;

        public ItemCategoryModal()
        {
            this.DataContext = itemCategory;
            InitializeComponent();
        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
            if (String.IsNullOrEmpty(NameTextBox.Text))
            {
                ModalSnackbar.MessageQueue?.Enqueue("Fill all fields.", null, null, null, false, true, TimeSpan.FromSeconds(3));
            }
            else
            {
                ItemCategoryAdded = true;
                itemCategory.Name = NameTextBox.Text;
                this.Close();
            }
        }

        private void Cancel_Click(object sender, RoutedEventArgs e)
        {
            ItemCategoryAdded = false;
            this.Close();
        }

        public ItemCategory GetItemCategory()
        {
            return itemCategory;
        }
    }
}
