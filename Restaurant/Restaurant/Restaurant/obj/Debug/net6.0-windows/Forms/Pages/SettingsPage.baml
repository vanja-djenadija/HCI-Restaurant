   M S B A M L   `   `   `  ����E  ARestaurant, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:Restaurant.UtilRestaurant.Util  5      )    #Restaurant.Forms.Pages.SettingsPage   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      /localclr-namespace:Restaurant.Util     5      _ [MaterialDesignThemes.Wpf, Version=4.6.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5        N� Title$  SettingsPage��5	         MaterialDesignFont N� 
FontFamily# [  5       N� FontSize$ 15(�5      .��5      �  � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $��* �6   .+�5   
   #  MaterialDesignThemes.Wpf.Card  $��0,0,0,10q�6   .��5      �� $��0��5      $��10q�5      *   $Restaurant.Util.LocalizationProvider   	ContentID$ Settings��5      $��24(�5      $
��Bold"�5        MaterialDesignLabel#��[ 5      5        5   
   $��1��5       $��Stretch=�5!      $��Stretch=�5"      .��5#      �� $
��Auto��5$      .  (MaterialDesignThemes.Wpf.ColorZoneAssist   Mode$ PrimaryLight=�5%      3  -MaterialDesignThemes.Wpf.NavigationRailAssist   ShowSelectionBackground$
 True��5&      $��0,0,0,0q�5(        MaterialDesignTabControl#��[ 5*       �� TabStripPlacement$
 Left=�5+      ��5'      Z�  � FocusVisualStyle 5)      Z� .@�5,      �� $	��150��5-      $��0,0,0,0q�5.      ��5/      Z�  50      Z� ��51      �� 52      $
��auto��53      $
��auto��54      	 �� Orientation$	 
Horizontal=�55      .+�56      '  !MaterialDesignThemes.Wpf.PackIcon  $��24��57   !   $��24��58   !   $��0,0,10,0q�59   !   $��Center=�5:   !   
   Kind$
 AccountOutline=�5;   !   �� 5<      $��0,0,10,0q�5=   !   $��Center=�5>   !   $ 	MyAccount��5?   !   5@      .��5B      � $��20,10,20,20q�6   .+�5C      '  !MaterialDesignThemes.Wpf.Snackbar  -   5          Name$ SnackbarOne��5D       $  MaterialDesignSnackbarBackground#��[ 5E         MaterialDesignDarkForeground#��[ 5F         IsActive$ False��5G         MessageQueue 5H      4  .MaterialDesignThemes.Wpf.MessageQueueExtension  �� 5I      $	��300��5J      $
��Left=�5K      $��Stretch=�5L       � UseLayoutRounding$ False��5M      .+�5N      �� $��	20,0,20,0q�5O   !   $��4,4,4,4q�5P   !   $��Stretch=�5Q   !   $	��Top=�5R   !   $ 	MyAccount��5S   !   $��16(�5T   !   $
��Bold"�5U   !   �� 5V      $	��250��5W   !   $��	0,20,0,10q�5X   !   $	��Top=�5Y   !   $��Stretch=�5Z   !   $
 Name��5[   !     MaterialDesignFilledTextBox#��[ 5\   !   $��1��5]   !   ��5^   !   �� *Name+�� 5_      $	��250��5`   !   $��0,0,0,10q�5a   !   $ Lastname��5b   !   #��[ 5c   !   $��2��5d   !   ��5e   !   �� *
Lastname+�� 5f      $	��250��5g   !   $��0,0,0,10q�5h   !   $ Username��5i   !   #��[ 5j   !   $��3��5k   !   ��5l   !   �� *
Username+G� 5m      $	��250��5n   !   $��0,0,0,10q�5o   !   $ Password��5p   !    # MaterialDesignFilledPasswordBox#��[ 5q   !   $��4��5r   !   �� 5s      $	��250��5t   !   $��0,0,0,10q�5u   !   $ PhoneNumber��5v   !   #��[ 5w   !   $��5��5x   !   ��5y   !   �� *PhoneNumber+�� 5z      $	��250��5{   !   $��0,0,0,10q�5|   !   $ PlaceOfResidence��5}   !   #��[ 5~   !   $��6��5   !   ��5�   !   �� *PlaceOfResidence+�� 5�      $	��250��5�   !   $��0,0,0,20q�5�   !   $
��Left=�5�   !   $��Center=�5�   !   $
 Role��5�   !    � IsSharedSizeScope$
 True��5�   !    �� 
IsEditable$
 True��5�   !    �� 
IsReadOnly$ False��5�   !      MaterialDesignFilledComboBox#��[ 5�   !    �� Text 5�   !   �� *Role+.@�5�   "   �� $��Konobar��6/   �� 5�   "   $
��Chef��6/   5�      �� 5�      -   5        $��95��5�   !   $	��250��5�   !   $��
25,14,0,20q�5�   !   $��0,5,0,4q�5�   !   $
��Left=�5�   !   $ Update��5�   !   $��16(�5�   !   $
��Bold"�5�   !   $��7��5�   !   5�      5�      5�      �� 5�      $	��150��6    6&   Z� ��5�      �� 5�      $
��auto��5�      $
��auto��5�      $	 
Horizontal=�5�      .+�5�        $��24��5�   !   $��24��5�   !   $��0,0,10,0q�5�   !   $��Center=�5�   !   $
 ThemeOutline=�5�   !   �� 5�      $��Center=�6(   $ 
Appearance��6E   5�      .��5�      � $��20,10,20,20q�6   .+�5�        $	��Top=�6.   .��5�      � $��Stretch=�6#    � ColumnDefinitions 5�   "   �� 5�   &   $
��Auto �67   �� 5�   &   $��* �67   �� 5�   &   $
��Auto �67   .+�5�   "   �� $��0��5�   %   $
��Left=�5�   %   $ Theme��5�   %   $
��Bold"�5�   %   �� 5�   "   -   5         ��Name$ cbTheme��5�   %   $��2��5�   %   $	��100��5�   %   $��Center=�5�   %   $��Center=�5�   %   $��Center=�5�   %    �� SelectedIndex$ 0��5�   %   .@�5�   &   �� $ Light��63    6`   Z� �� 5�   &   $
 Dark��63    6_   Z� �� 5�   &   $ Surprise��63    6c   Z� 5�   #   5�      5�      5�      5�      �� 5�      $	��150��6    6&   Z� ��5�      �� 5�      $
��auto��5�      $
��auto��5�      $	 
Horizontal=�5�      .+�5�        $��24��5�   !   $��24��5�   !   $��0,0,10,0q�5�   !   $��Center=�5�   !   $
 Language=�5�   !   �� 5�      $��Center=�6(   $ Language��6E   5�      .��5�      � $��20,10,20,20q�6   .+�5�        $	��Top=�6.   .��5�      � $��Stretch=�6#    5�   "   �� 5�   &   $
��Auto �67   �� 5�   &   $��* �67   �� 5�   &   $
��Auto �67   .+�5�   "   �� $��0��5�   %   $
��Left=�5�   %   $ Language��5�   %   $
��Bold"�5�   %   �� 5�   "   -   5        $ LanguageComboBox��5�   %   $��2��5�   %   $	��100��5�   %   $��Center=�5�   %   $��Center=�5�   %   $��Center=�5�   %   $ 0��5�   %   .@�5�   &   �� $ English��63    6b   Z� �� 5�   &   $ Serbian��63    6b   Z� 5�   #   5�      5�      5�      5�      5�      5�      5�      5�      