using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace Restaurant.Util
{
    public class LanguageModel
    {
        public static event EventHandler LanguageChanged;

        protected virtual void OnLanguageChanged(EventArgs e)
        {
            LanguageChanged?.Invoke(this, e);
        }

        public ICommand EnglishLanguageCmd { get { return new RelayCommand(p => SetLanguageToEnglish()); } }

        public ICommand SerbianLanguageCmd { get { return new RelayCommand(p => SetLanguageToSerbian()); } }

        private void SetLanguageToEnglish()
        {
            AppSettings.AppLanguage = "English";
            OnLanguageChanged(EventArgs.Empty);
            UpdateLocalizedElements();
        }

        private void SetLanguageToSerbian()
        {
            AppSettings.AppLanguage = "Serbian";
            OnLanguageChanged(EventArgs.Empty);
            UpdateLocalizedElements();
        }

        private void UpdateLocalizedElements()
        {
            LocalizationProvider.UpdateAllObjects();
        }
    }
}
