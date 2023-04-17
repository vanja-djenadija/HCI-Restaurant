using Restaurant.Data.DTO;
using Restaurant.Forms.Pages;
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
using System.Windows.Shapes;

namespace Restaurant.Forms.Windows
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public static Employee Employee { get; set; }
        private LanguageModel model;

        public MainWindow(Employee employee, LanguageModel model)
        {
            Employee = employee;
            this.model = model;
            this.DataContext = model;
            InitializeComponent();
        }

        private void LogOut_Click(object sender, RoutedEventArgs e)
        {
            // Save chosen theme
            var settingsPage = (SettingsPage)SettingsPage.Content;
            int selectedIndex = settingsPage.cbTheme.SelectedIndex;
            string[] lines = System.IO.File.ReadAllLines("./users-theme.txt");
            string[] newArray = new string[lines.Length + 1];
            bool found = false;
            for (int i = 0; i < lines.Length; i++)
            {
                if (lines[i].Split(":")[0].Equals("" + Employee.Id))
                {
                    lines[i] = Employee.Id + ":" + selectedIndex;
                    found = true;
                }
                newArray[i] = lines[i];
            }
            if (!found)
            {
                newArray[lines.Length] = Employee.Id + ":" + selectedIndex;
            }
            System.IO.File.WriteAllLines("./users-theme.txt", newArray);

            SignIn signIn = new SignIn();
            signIn.Show();
            this.Close();
        }

        public void ChangeLanguage(int index)
        {
            switch (index)
            {
                case 0:
                    model.EnglishLanguageCmd.Execute(null);
                    break;
                case 1:
                    model.SerbianLanguageCmd.Execute(null);
                    break;
            }
        }

        private async void Window_Loaded(object sender, RoutedEventArgs e)
        {
            //
            if (Employee.Role == "Konobar")
            {
                MenuPage page = new MenuPage();
                MenuPage.Navigate(page);
                CategoriesTabItem.Visibility = Visibility.Collapsed;
                EmployeesTabItem.Visibility = Visibility.Collapsed;
            }
            // Admin 
            else
            {
                MenuPageAdmin page = new MenuPageAdmin();
                MenuPage.Navigate(page);
                OrdersTabItem.Visibility = Visibility.Collapsed;
            }
            Restaurant.Forms.Pages.SettingsPage.ModifyTheme(Employee.SelectedTheme);
        }
    }
}
