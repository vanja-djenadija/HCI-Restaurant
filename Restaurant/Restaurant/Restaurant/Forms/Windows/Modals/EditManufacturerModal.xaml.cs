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
    /// Interaction logic for EditManufacturerModal.xaml
    /// </summary>
    public partial class EditManufacturerModal : Window
    {
        private readonly ManufacturerCategory category;
        public bool CategoryUpdated { get; private set; } = false;

        public EditManufacturerModal(ManufacturerCategory category)
        {
            this.category = category;
            this.DataContext = category;
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
                CategoryUpdated = true;
                this.Close();
            }
        }

        private void Cancel_Click(object sender, RoutedEventArgs e)
        {
            CategoryUpdated = false;
            this.Close();
        }

        public ManufacturerCategory GetCategory()
        {
            return category;
        }
    }
}
