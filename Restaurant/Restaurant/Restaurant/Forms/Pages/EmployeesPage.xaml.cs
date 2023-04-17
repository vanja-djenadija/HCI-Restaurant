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

namespace Restaurant.Forms.Pages
{
    /// <summary>
    /// Interaction logic for EmployeesPage.xaml
    /// </summary>
    public partial class EmployeesPage : Page
    {
        private readonly GenericDataGridViewModel<Employee> employeeViewModel;
        private readonly EmployeeDAOImpl dao = new EmployeeDAOImpl();

        public EmployeesPage()
        {
            InitializeComponent();
            this.employeeViewModel = new GenericDataGridViewModel<Employee>()
            {
                Items = new ObservableCollection<Employee>(dao.GetEmployees())
            };

            this.DataContext = employeeViewModel;
        }

        public void Delete_Click(object sender, RoutedEventArgs e)
        {
            if (DataGridEmployees.SelectedItems.Count == 0)
            {
                new MessageBoxCustom("No selected items.", MessageType.Info, MessageButtons.Ok).ShowDialog();
            }
            else
            {
                bool? Result = new MessageBoxCustom("Are you sure you want to delete?", MessageType.Confirmation, MessageButtons.YesNo).ShowDialog();
                if (Result == false)
                    return;

                int res = 0, toDelete = DataGridEmployees.SelectedItems.Count;
                List<Employee> selectedEmployees = new List<Employee>();
                foreach (Employee employee in DataGridEmployees.SelectedItems)
                    selectedEmployees.Add(employee);
                try
                {
                    foreach (Employee employee in selectedEmployees)
                    {
                        if (dao.DeleteEmployee(employee.Id) == true)
                            res++;

                        employeeViewModel.Items.Remove(employee);
                    }
                    if (res == toDelete)
                        EmployeesSnackbar.MessageQueue?.Enqueue("Successfully deleted.", null, null, null, false, true, TimeSpan.FromSeconds(3));
                    else
                        EmployeesSnackbar.MessageQueue?.Enqueue("Unsuccessfully deleted.", null, null, null, false, true, TimeSpan.FromSeconds(3));
                }
                catch (DataAccessException)
                {
                    EmployeesSnackbar.MessageQueue?.Enqueue("Error.", null, null, null, false, true, TimeSpan.FromSeconds(3));
                }
            }
        }

        public void Add_Click(object sender, RoutedEventArgs e)
        {
            EmployeeModal modal = new EmployeeModal();
            modal.ShowDialog();
            if (modal.EmployeeAdded)
            {
                employeeViewModel.Items.Add(modal.GetEmployee());
                dao.AddEmployee(modal.GetEmployee());
                EmployeesSnackbar.MessageQueue?.Enqueue("Employee added.", null, null, null, false, true, TimeSpan.FromSeconds(5));
            }
        }
    }
}
