using CustomMessageBox;
using Restaurant.Data.DAO.MySQL;
using Restaurant.Data.DTO;
using Restaurant.Forms.Pages;
using Restaurant.Forms.Windows;
using Restaurant.Util;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Restaurant
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class SignIn : Window
    {
        public LanguageModel model;

        public SignIn()
        {
            model = new LanguageModel();
            DataContext = model;
            InitializeComponent();
            model.EnglishLanguageCmd.Execute(null); // setting to default language English
        }

        private void SignInButton_Click(object sender, RoutedEventArgs e)
        {
            if (String.IsNullOrEmpty(UsernameTextBox.Text) || String.IsNullOrEmpty(PasswordBox.Password))
            {
                Snackbar.MessageQueue?.Enqueue("Please fill all the fields.", null, null, null, false, true, TimeSpan.FromSeconds(3));
            }
            else
            {
                Employee employee = MySQLUtil.SignIn(UsernameTextBox.Text, PasswordBox.Password);
                if (employee.Id == 0)
                {
                    Snackbar.MessageQueue?.Enqueue("Invalid credentials.", null, null, null, false, true, TimeSpan.FromSeconds(3));
                    return;
                }
                // TODO load theme
                string[] lines = System.IO.File.ReadAllLines("./users-theme.txt");
                string selectedIndex = "0";
                for (int i = 0; i < lines.Length; i++)
                {
                    if (lines[i].Split(":")[0].Equals("" + employee.Id))
                    {
                        selectedIndex = lines[i].Split(":")[1];
                        break;
                    }
                }
                employee.SelectedTheme = Int32.Parse(selectedIndex);

                MainWindow mainWindow = new MainWindow(employee, model);
                mainWindow.Show();
                this.Close();
            }
        }
    }
}
