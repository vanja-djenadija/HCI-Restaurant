   M S B A M L   `   `   `  ���� E  ARestaurant, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:Restaurant.UtilRestaurant.Util  3    -Restaurant.Forms.Windows.Modals.EmployeeModal   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     /localclr-namespace:Restaurant.Util     _ [MaterialDesignThemes.Wpf, Version=4.6.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006    � Title$  EmployeeModal�� � AllowsTransparency$
 True�����	#33000000 � WindowStartupLocation$ CenterOwner=� � WindowState$ 	Maximized=� � WindowStyle$
 None=�.��� $��0,0,0,0q�$��Center=�$��Center=�    MaterialDesignCardBackground#��[  .+�'  !MaterialDesignThemes.Wpf.Snackbar  -     Name$ EmployeeModalSnackbar��   MaterialDesignSnackbarRipple#��[    IsActive$ False��   MessageQueue 4  .MaterialDesignThemes.Wpf.MessageQueueExtension  �� $	��300��$��Center=�$��Stretch=� � UseLayoutRounding$ False��.+��� $��
20,20,20,0q�$��4,4,4,4q�$��Center=�$	��Top=�*   $Restaurant.Util.LocalizationProvider	   	ContentID$	 AddNewEmployee��$��16(�$
��Bold"��� -   
 ��Name$
 NameTextBox��$	��250��$��	0,20,0,10q�$	��Top=�$��Stretch=�$
	 Name��  MaterialDesignFilledTextBox#��[ $��1������ *Name+�� -   $
 LastNameTextBox��$	��250��$��0,0,0,10q�$	 Lastname��#��[ $��2������ *
Lastname+�� -   $
 UsernameTextBox��$	��250��$��0,0,0,10q�$	 Username��#��[ $��3������ *
Username+G� -    G�Name$ PasswordBox��$	��250��$��0,0,0,10q�$	 Password�� # MaterialDesignFilledPasswordBox#��[ $��4���� -   $
 PhoneNumberTextBox��$	��250��$��0,0,0,10q�$	 PhoneNumber��#��[ $��5������ *PhoneNumber+�� -   $
 PlaceOfResidenceTextBox��$	��250��$��0,0,0,10q�$	 PlaceOfResidence��#��[ $��6������ *PlaceOfResidence+�� -    ��Name$ RoleComboBox��$	��250��$��0,0,0,20q�$
��Left=�$��Center=�$
	 Role�� � IsSharedSizeScope$
 True�� �� 
IsEditable$
 True�� �� 
IsReadOnly$ False�� �� SelectedIndex$ 0��   MaterialDesignFilledComboBox#��[  �� Text �� *Role+.@��� $��Konobar���� $
��Chef���� $��0,0,0,50q�$��Center=� �� Orientation$ 
Horizontal=�.+��� -	   $	��110��$��0,0,30,0q�$
��Left=�$		 Add��$��16(�$
��Bold"�$��7���� -
   $	��110��$	 Cancel�����	#FF7D7373$��1,1,1,1q�$��16(�$
��Bold"�  MaterialDesignFlatButton#��[ $��8��