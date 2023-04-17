using System;
using System.Collections.Generic;
using System.ComponentModel;
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

namespace Restaurant.Forms.Controls
{
    /// <summary>
    /// Interaction logic for NumericSpinner.xaml
    /// </summary>
    public partial class NumericSpinner : UserControl
    {
        #region Fields

        public event EventHandler PropertyChanged;
        public event EventHandler ValueChanged;
        #endregion

        public NumericSpinner()
        {
            InitializeComponent();

            tb_main.SetBinding(TextBox.TextProperty, new Binding("Value")
            {
                ElementName = "root_numeric_spinner",
                Mode = BindingMode.TwoWay,
                UpdateSourceTrigger = UpdateSourceTrigger.PropertyChanged
            });

            DependencyPropertyDescriptor.FromProperty(ValueProperty, typeof(NumericSpinner)).AddValueChanged(this, PropertyChanged);
            DependencyPropertyDescriptor.FromProperty(ValueProperty, typeof(NumericSpinner)).AddValueChanged(this, ValueChanged);
            DependencyPropertyDescriptor.FromProperty(DecimalsProperty, typeof(NumericSpinner)).AddValueChanged(this, PropertyChanged);
            DependencyPropertyDescriptor.FromProperty(MinValueProperty, typeof(NumericSpinner)).AddValueChanged(this, PropertyChanged);
            DependencyPropertyDescriptor.FromProperty(MaxValueProperty, typeof(NumericSpinner)).AddValueChanged(this, PropertyChanged);

            PropertyChanged += (x, y) => validate();
        }

        #region ValueProperty

        public readonly static DependencyProperty ValueProperty = DependencyProperty.Register(
            "Value",
            typeof(int),
            typeof(NumericSpinner),
            new PropertyMetadata(new int()));

        public decimal Value
        {
            get { return (int)GetValue(ValueProperty); }
            set
            {
                if (value < MinValue)
                    value = MinValue;
                if (value > MaxValue)
                    value = MaxValue;
                SetValue(ValueProperty, value);
                ValueChanged(this, new EventArgs());
            }
        }


        #endregion

        #region StepProperty

        public readonly static DependencyProperty StepProperty = DependencyProperty.Register(
            "Step",
            typeof(int),
            typeof(NumericSpinner),
            new PropertyMetadata(1));

        public decimal Step
        {
            get { return (int)GetValue(StepProperty); }
            set
            {
                SetValue(StepProperty, value);
            }
        }

        #endregion

        #region DecimalsProperty

        public readonly static DependencyProperty DecimalsProperty = DependencyProperty.Register(
            "Decimals",
            typeof(int),
            typeof(NumericSpinner),
            new PropertyMetadata(2));

        public int Decimals
        {
            get { return (int)GetValue(DecimalsProperty); }
            set
            {
                SetValue(DecimalsProperty, value);
            }
        }

        #endregion

        #region MinValueProperty

        public readonly static DependencyProperty MinValueProperty = DependencyProperty.Register(
            "MinValue",
            typeof(int),
            typeof(NumericSpinner),
            new PropertyMetadata(1));

        public int MinValue
        {
            get { return (int)GetValue(MinValueProperty); }
            set
            {
                if (value > MaxValue)
                    MaxValue = value;
                SetValue(MinValueProperty, value);
            }
        }

        #endregion

        #region MaxValueProperty

        public readonly static DependencyProperty MaxValueProperty = DependencyProperty.Register(
            "MaxValue",
            typeof(int),
            typeof(NumericSpinner),
            new PropertyMetadata(int.MaxValue));

        public int MaxValue
        {
            get { return (int)GetValue(MaxValueProperty); }
            set
            {
                if (value < MinValue)
                    value = MinValue;
                SetValue(MaxValueProperty, value);
            }
        }

        #endregion

        /// <summary>
        /// Revalidate the object, whenever a value is changed...
        /// </summary>
        private void validate()
        {
            // Logically, This is not needed at all... as it's handled within other properties...
            if (MinValue > MaxValue) MinValue = MaxValue;
            if (MaxValue < MinValue) MaxValue = MinValue;
            if (Value < MinValue) Value = MinValue;
            if (Value > MaxValue) Value = MaxValue;

            Value = Value;
        }

        private void cmdUp_Click(object sender, RoutedEventArgs e)
        {
            Value += Step;
        }

        private void cmdDown_Click(object sender, RoutedEventArgs e)
        {
            Value -= Step;
        }

        private void tb_main_Loaded(object sender, RoutedEventArgs e)
        {
            ValueChanged(this, new EventArgs());
        }
    }
}
