using MaterialDesignThemes.Wpf;
using Restaurant.Data.DAO.MySQL;
using Restaurant.Data.DTO;
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

namespace Restaurant.Forms.Pages
{
    /// <summary>
    /// Interaction logic for SettingsPage.xaml
    /// </summary>
    public partial class SettingsPage : Page
    {
        private Employee employee;

        public SettingsPage()
        {
            employee = MainWindow.Employee;
            this.DataContext = employee;
            InitializeComponent();
            cbTheme.SelectedIndex = employee.SelectedTheme;
        }

        public static void ModifyTheme(int selectedTheme)
        {
            var paletteHelper = new PaletteHelper();
            var theme = paletteHelper.GetTheme();
            switch (selectedTheme)
            {
                // light
                case 0:
                    ThemeExtensions.SetPrimaryColor(theme, Colors.OrangeRed);
                    ThemeExtensions.SetSecondaryColor(theme, Colors.Orange);
                    theme.SetBaseTheme(MaterialDesignThemes.Wpf.Theme.Light);
                    break;
                // dark
                case 1:
                    ThemeExtensions.SetPrimaryColor(theme, Colors.OrangeRed);
                    ThemeExtensions.SetSecondaryColor(theme, Colors.Orange);
                    theme.SetBaseTheme(MaterialDesignThemes.Wpf.Theme.Dark);
                    break;
                // surprise
                case 2:
                    ThemeExtensions.SetPrimaryColor(theme, Colors.DeepSkyBlue);
                    ThemeExtensions.SetSecondaryColor(theme, Colors.Orange);
                    theme.SetBaseTheme(MaterialDesignThemes.Wpf.Theme.Light);
                    break;
            }

            paletteHelper.SetTheme(theme);
        }

        private void ComboBoxTheme_DropDownClosed(object sender, EventArgs e)
        {
            ModifyTheme(cbTheme.SelectedIndex);
        }

        private void UpdateAccount_Click(object sender, RoutedEventArgs e)
        {
            // TODO Da li je i u viewmodelu employees došlo do promjene?
            new EmployeeDAOImpl().UpdateEmployee(employee);
            SnackbarOne.MessageQueue?.Enqueue("Account updated.", null, null, null, false, true, TimeSpan.FromSeconds(3));
        }

        private void ComboBoxLanguage_DropDownClosed(object sender, EventArgs e)
        {
            ((MainWindow)Window.GetWindow(this)).ChangeLanguage(LanguageComboBox.SelectedIndex);
        }
    }

}
