using CustomMessageBox;
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
    /// Interaction logic for EmployeeModal.xaml
    /// </summary>
    public partial class EmployeeModal : Window
    {
        private readonly Employee newEmployee = new Employee();
        public bool EmployeeAdded { get; set; } = false;

        public EmployeeModal()
        {
            this.DataContext = newEmployee;
            InitializeComponent();
        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
            if (String.IsNullOrEmpty(NameTextBox.Text) || String.IsNullOrEmpty(LastNameTextBox.Text) ||
                String.IsNullOrEmpty(UsernameTextBox.Text) || String.IsNullOrEmpty(PasswordBox.Password) ||
                String.IsNullOrEmpty(PhoneNumberTextBox.Text) || String.IsNullOrEmpty(PlaceOfResidenceTextBox.Text))
            {
                EmployeeModalSnackbar.MessageQueue?.Enqueue("Fill all fields.", null, null, null, false, true, TimeSpan.FromSeconds(3));
            }
            else
            {
                EmployeeAdded = true;
                newEmployee.Password = PasswordBox.Password;
                this.Close();
            }
        }

        private void Cancel_Click(object sender, RoutedEventArgs e)
        {
            EmployeeAdded = false;
            this.Close();
        }

        public Employee GetEmployee()
        {
            return newEmployee;
        }
    }
}
