   M S B A M L   `   `   `  ���� E  ARestaurant, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:Restaurant.UtilRestaurant.Util  )    #Restaurant.Forms.Pages.SettingsPage   _ [MaterialDesignThemes.Wpf, Version=4.6.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  )localclr-namespace:Restaurant.Util  W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008       N� Title$  SettingsPage��   MaterialDesignFont N� 
FontFamily# [   N� FontSize$ 15(�.���  � RowDefinitions �� $
��Auto ��� $��* �.+�#  MaterialDesignThemes.Wpf.Card  $��0,0,0,10q�.���� $��0��$��10q�*   $Restaurant.Util.LocalizationProvider   	ContentID$ Settings��$��24(�$
��Bold"�  MaterialDesignLabel#��[   $��1��$��Stretch=�$��Stretch=�.����  �� TabStripPlacement$
 Left=�$
��Auto��.  (MaterialDesignThemes.Wpf.ColorZoneAssist   Mode$ PrimaryLight=�3  -MaterialDesignThemes.Wpf.NavigationRailAssist   ShowSelectionBackground$
 True��  MaterialDesignTabControl#��[ $��0,0,0,0q� � FocusVisualStyle Z� ��Z� .@��� $	��150��$��0,0,0,0q���Z�  Z� ���� $
��auto��$
��auto��	 �� Orientation$	 
Horizontal=�.+�'  !MaterialDesignThemes.Wpf.PackIcon  $��24��$��24��$��Center=�
   Kind$
 AccountOutline=�$��0,0,10,0q��� $��Center=�$ 	MyAccount��$��0,0,10,0q�.��� $��20,10,20,20q�.+�'  !MaterialDesignThemes.Wpf.Snackbar  -     Name$ SnackbarOne�� $  MaterialDesignSnackbarBackground#��[    MaterialDesignDarkForeground#��[    IsActive$ False��   MessageQueue 4  .MaterialDesignThemes.Wpf.MessageQueueExtension  �� $��Stretch=� � UseLayoutRounding$ False��$
��Left=�$	��300��.+��� $ 	MyAccount��$��	20,0,20,0q�$��Stretch=�$	��Top=�$
��Bold"�$��16(�$��4,4,4,4q��� $	��250��$��	0,20,0,10q�$��1��$	��Top=�$��Stretch=�  MaterialDesignFilledTextBox#��[ $
 Name������ *Name+�� $	��250��$��0,0,0,10q�$��2��#��[ $ Lastname������ *
Lastname+�� $	��250��$��0,0,0,10q�$��3��#��[ $ Username������ *
Username+G� $	��250��$��0,0,0,10q�$��4�� # MaterialDesignFilledPasswordBox#��[ $ Password���� $	��250��$��0,0,0,10q�$��5��#��[ $ PhoneNumber������ *PhoneNumber+�� $	��250��$��0,0,0,10q�$��6��#��[ $ PlaceOfResidence������ *PlaceOfResidence+��  �� 
IsEditable$
 True�� �� 
IsReadOnly$ False��$	��250��$��0,0,0,20q�   MaterialDesignFilledComboBox#��[  � IsSharedSizeScope$
 True��$
��Left=�$��Center=�$
 Role�� �� Text �� *Role+.@��� $��Konobar���� $
��Chef���� -   $ Update��$	��250��$
��Left=�$��95��$��16(�$
��Bold"�$��0,5,0,4q�$��7��$��
25,14,0,20q��� $	��150�� Z� ���� $
��auto��$
��auto��$	 
Horizontal=�.+�  $��24��$��24��$��Center=�$
 ThemeOutline=�$��0,0,10,0q��� $��Center=�$ 
Appearance��.��� $��20,10,20,20q�.+�  $	��Top=�.��� $��Stretch=� � ColumnDefinitions �� $
��Auto ��� $��* ��� $
��Auto �.+��� $��0��$ Theme��$
��Bold"�$
��Left=��� -    ��Name$ cbTheme��$��2�� �� SelectedIndex$ 0��$��Center=�$��Center=�$	��100��$��Center=�.@��� $ Light�� Z� �� $
 Dark�� Z� �� $	��150�� Z� ���� $
��auto��$
��auto��$	 
Horizontal=�.+�  $��24��$��24��$��Center=�$
 Language=�$��0,0,10,0q��� $��Center=�$ Language��.��� $��20,10,20,20q�.+�  $	��Top=�.��� $��Stretch=� �� $
��Auto ��� $��* ��� $
��Auto �.+��� $��0��$ Language��$
��Bold"�$
��Left=��� -   $ LanguageComboBox��$��2��$ 0��$��Center=�$��Center=�$	��100��$��Center=�.@��� $ English�� Z� �� $ Serbian�� Z� 