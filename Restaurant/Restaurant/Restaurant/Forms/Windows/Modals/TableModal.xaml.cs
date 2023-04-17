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
using Table = Restaurant.Data.DTO.Table;

namespace Restaurant.Forms.Windows.Modals
{
    /// <summary>
    /// Interaction logic for TableModal.xaml
    /// </summary>
    public partial class TableModal : Window
    {

        private readonly Table table = new Table();
        public bool TableAdded { get; private set; } = false;

        public TableModal()
        {
            this.DataContext = table;
            InitializeComponent();
        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
            if (String.IsNullOrEmpty(TableNumberTextBox.Text) || String.IsNullOrEmpty(NumberOfSeatsTextBox.Text))
            {
                ModalSnackbar.MessageQueue?.Enqueue("Fill all fields.", null, null, null, false, true, TimeSpan.FromSeconds(3));
            }
            else
            {
                try
                {
                    table.Id = Int32.Parse(TableNumberTextBox.Text);
                    table.NumberOfSeats = Int32.Parse(NumberOfSeatsTextBox.Text);
                    TableAdded = true;
                }
                catch (Exception)
                {
                    ModalSnackbar.MessageQueue?.Enqueue("Error.", null, null, null, false, true, TimeSpan.FromSeconds(3));
                }
                finally
                {
                    this.Close();
                }
            }
        }

        private void Cancel_Click(object sender, RoutedEventArgs e)
        {
            TableAdded = false;
            this.Close();
        }

        public Table GetTable()
        {
            return table;
        }
    }
}
