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
    /// Interaction logic for ManufacturerModal.xaml
    /// </summary>
    public partial class ManufacturerModal : Window
    {
        private readonly ManufacturerCategory manufacturerCategory = new ManufacturerCategory();
        public bool ManufacturerAdded { get; private set; } = false;

        public ManufacturerModal()
        {
            this.DataContext = manufacturerCategory;
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
                ManufacturerAdded = true;
                manufacturerCategory.Name = NameTextBox.Text;
                this.Close();
            }
        }

        private void Cancel_Click(object sender, RoutedEventArgs e)
        {
            ManufacturerAdded = false;
            this.Close();
        }

        public ManufacturerCategory GetManufacturerCategory()
        {
            return manufacturerCategory;
        }
    }
}
