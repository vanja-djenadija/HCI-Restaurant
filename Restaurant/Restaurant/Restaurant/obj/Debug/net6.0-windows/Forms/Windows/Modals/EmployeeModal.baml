   M S B A M L   `   `   `  ����E  ARestaurant, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:Restaurant.UtilRestaurant.Util  5      3    -Restaurant.Forms.Windows.Modals.EmployeeModal   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      /localclr-namespace:Restaurant.Util     5      _ [MaterialDesignThemes.Wpf, Version=4.6.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5        � Title$  EmployeeModal��5	       � AllowsTransparency$
 True��5
      ���	#33000000 � WindowStartupLocation$ CenterOwner=�5       � WindowState$ 	Maximized=�5       � WindowStyle$
 None=�5      .��5      � $��0,0,0,0q�5   	   $��Center=�5   	   $��Center=�5   	       MaterialDesignCardBackground#��[  5   	   .+�5   
   '  !MaterialDesignThemes.Wpf.Snackbar  -   5          Name$ EmployeeModalSnackbar��5         MaterialDesignSnackbarRipple#��[ 5         IsActive$ False��5         MessageQueue 5      4  .MaterialDesignThemes.Wpf.MessageQueueExtension  �� 5   
   $	��300��5      $��Center=�5      $��Stretch=�5       � UseLayoutRounding$ False��5      .+�5      �� $��
20,20,20,0q�5       $��4,4,4,4q�5!      $��Center=�5"      $	��Top=�5#      *   $Restaurant.Util.LocalizationProvider	   	ContentID$	 AddNewEmployee��5$      $��16(�5%      $
��Bold"�5&      �� 5'      -   5        
 ��Name$
 NameTextBox��5(      $	��250��5)      $��	0,20,0,10q�5*      $	��Top=�5+      $��Stretch=�5,      $
	 Name��5-        MaterialDesignFilledTextBox#��[ 5.      $��1��5/      ��50      �� *Name+�� 51      -   5        $
 LastNameTextBox��52      $	��250��53      $��0,0,0,10q�54      $	 Lastname��55      #��[ 56      $��2��57      ��58      �� *
Lastname+�� 59      -   5        $
 UsernameTextBox��5:      $	��250��5;      $��0,0,0,10q�5<      $	 Username��5=      #��[ 5>      $��3��5?      ��5@      �� *
Username+G� 5A      -   5         G�Name$ PasswordBox��5B      $	��250��5C      $��0,0,0,10q�5D      $	 Password��5E       # MaterialDesignFilledPasswordBox#��[ 5F      $��4��5G      �� 5H      -   5        $
 PhoneNumberTextBox��5I      $	��250��5J      $��0,0,0,10q�5K      $	 PhoneNumber��5L      #��[ 5M      $��5��5N      ��5O      �� *PhoneNumber+�� 5P      -   5        $
 PlaceOfResidenceTextBox��5Q      $	��250��5R      $��0,0,0,10q�5S      $	 PlaceOfResidence��5T      #��[ 5U      $��6��5V      ��5W      �� *PlaceOfResidence+�� 5X      -   5         ��Name$ RoleComboBox��5Y      $	��250��5Z      $��0,0,0,20q�5[      $
��Left=�5\      $��Center=�5]      $
	 Role��5^       � IsSharedSizeScope$
 True��5_       �� 
IsEditable$
 True��5`       �� 
IsReadOnly$ False��5a       �� SelectedIndex$ 0��5b         MaterialDesignFilledComboBox#��[ 5c       �� Text 5d      �� *Role+.@�5e      �� $��Konobar��6   �� 5f      $
��Chef��6   5g      �� 5h      $��0,0,0,50q�5i      $��Center=�5j       �� Orientation$ 
Horizontal=�5k      .+�5l      �� -	   5        $	��110��5m      $��0,0,30,0q�5n      $
��Left=�5o      $		 Add��5p      $��16(�5r      $
��Bold"�5s      $��7��5t      �� 5u      -
   5        $	��110��5v      $	 Cancel��5w      ���	#FF7D7373$��1,1,1,1q�5y      $��16(�5{      $
��Bold"�5|        MaterialDesignFlatButton#��[ 5}      $��8��5~      5      5�      5�      5�      