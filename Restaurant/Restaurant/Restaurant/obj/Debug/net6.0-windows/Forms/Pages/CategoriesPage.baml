   M S B A M L   `   `   `  ����E  ARestaurant, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:Restaurant.UtilRestaurant.Util  5      +    %Restaurant.Forms.Pages.CategoriesPage   5      _ [MaterialDesignThemes.Wpf, Version=4.6.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      )localclr-namespace:Restaurant.Util  5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5        N� Title$  CategoriesPage��5
      .��5      �  � RowDefinitions 5   
   �� 5      $
��auto �6   �� 5      $��* �6   .+�5   
   #  MaterialDesignThemes.Wpf.Card  $��0��6   $��0,0,0,10q�5      .��5       �� $��0��6   $��10q�5!      *   $Restaurant.Util.LocalizationProvider   	ContentID$ 
Categories��5"      $��24(�5#      $
��Bold"�5$         MaterialDesignLabel#��[  5%      5&        5(   
   $��1��6   $��Stretch=�5)      $��0,0,0,0q�5*      .��5+      �� $��Center=�6   .  (MaterialDesignThemes.Wpf.ColorZoneAssist   Mode$ PrimaryLight=�5,      3  -MaterialDesignThemes.Wpf.NavigationRailAssist   SelectionCornerRadius$ 20��5-         ShowSelectionBackground$
 True��5.        MaterialDesignTabControl#��[ 5/       �� TabStripPlacement$
 Left=�50      .@�52      �� $
��auto��6   ��53      �� 54      $
��auto��6%   $
��auto��62    �� Orientation$ 
Horizontal=�6@   .+�55      '  !MaterialDesignThemes.Wpf.PackIcon  $��24��66   $��24��6A   $��Center=�6M      Kind$ Factory=�6j   $��0,0,10,0q�6y   �� 56      $��Center=�6(   $ Manufacturers��6E   57      ��59      &   System.Windows.Controls.DataGrid  5:      -   5        	  Name$	 DataGridManufacturers��5:   #   $��Visible=�5=   #   
   AutoGenerateColumns$
 False��5>   #      
IsReadOnly$
 True��5?   #      CanUserAddRows$ False��5@   #      CanUserDeleteRows$ False��5A   #     MaterialDesignDataGrid#��[ 5B   #   $��Stretch=�5C   #   $��20,10,20,10q�5D   #   $��15(�5E   #     MaterialDesignFont#���  5F   #   ��5;   #   �� *Items+ �� SelectedItem 5<   #   ��  �� Path$ SelectedItem� �� Mode$ TwoWay=� � ContextMenu 5G      �� 5H   "   .@�5I   &   m� -   5        $ Delete��5I   /    m� Icon 6~   0  *MaterialDesignThemes.Wpf.PackIconExtension     Kind$ DeleteOutline=�m� 5J   &   -   5        $	 Add��5J   /    6x     $ PlusCircleOutline=�m� 5K   &   -   5        $
 Edit��5K   /    6z     $ PencilOutline=�5L   #      Columns 5N      0  *System.Windows.Controls.DataGridTextColumn  5O   "   $
 Name��65   ,	  &System.Windows.Controls.DataGridColumn 	  Width5
  /System.Windows.Controls.DataGridLengthConverter$ *
 6{   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6a   �� *Name+6{   5Q      5S      �� 5T      $
��auto��6   $��4q�6(   ��5U      �� 5V      $
��auto��6%   $
��auto��62   $ 
Horizontal=�6@   .+�5W        $��24��66   $��24��6A   $��Center=�6M   $ 
Silverware=�6j   $��0,0,10,0q�6|   �� 5X      $��Center=�6(   $ Items��6E   5Y      ��5[        5\      -   5        $	 DataGridItemCategories��5\   #   $��Visible=�5_   #   $
 False��5`   #   $
 True��5a   #   $ False��5b   #   $ False��5c   #   #��[ 5d   #   $��Stretch=�5e   #   $��20,10,20,10q�5f   #   #���  5g   #   $��15(�5h   #   ��5]   #   �� *Items+ 5^   #   �� $ SelectedItem�$ TwoWay=� 5i      �� 5j   "   .@�5k   &   m� -   5        $ Delete��5k   /    6~     $ DeleteOutline=�m� 5l   &   -   5        $	 Add��5l   /    6x     $ PlusCircleOutline=�m� 5m   &   -   5        $
 Edit��5m   /    6z     $ PencilOutline=�5n   #    5p        5q   "   $
 Name��65   $ *
 6{    6a   �� *Name+6{   5s      5u      �� 5v      $
��auto��6   $��4q�6(   ��5w      �� 5x      $
��auto��6%   $
��auto��62   $ 
Horizontal=�6@   .+�5y        $��24��66   $��24��6A   $��Center=�6M   $ TableFurniture=�6j   $��0,0,10,0q�6�   �� 5z      $��Center=�6(   $ Tables��6E   5{      ��5}        5~      -	   5        $	 DataGridTables��5~   #   $��Visible=�5�   #   $
 False��5�   #   $
 True��5�   #   $ False��5�   #   $ False��5�   #   #��[ 5�   #   $��Stretch=�5�   #   $��20,10,20,10q�5�   #   $��Center=�5�   #   #���  5�   #   $��15(�5�   #   ��5   #   �� *Items+ 5�   #   �� $ SelectedItem�$ TwoWay=� 5�      �� 5�   "   .@�5�   &   m� -
   5        $ Delete��5�   /    6w     $ DeleteOutline=�m� 5�   &   -   5        $	 Add��5�   /    6q     $ PlusCircleOutline=�5�   #    5�        5�   "   $ TableNumber��65   $ *
 6�    6h   �� *Id+6�     5�   "   $ NumberOfSeats��65   $ *
 6�    6j   �� *NumberOfSeats+6�   5�      5�      5�      5�      '  !MaterialDesignThemes.Wpf.Snackbar  5�   
   -   5          Name$ CategoriesSnackbar��5�   "      MaterialDesignSnackbarRipple#��[ 5�   "      IsActive$ False��5�   "      MessageQueue 5�   "   4  .MaterialDesignThemes.Wpf.MessageQueueExtension  5�      5�      