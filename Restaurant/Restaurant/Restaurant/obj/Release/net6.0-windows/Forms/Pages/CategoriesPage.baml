   M S B A M L   `   `   `  ���� E  ARestaurant, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:Restaurant.UtilRestaurant.Util  +    %Restaurant.Forms.Pages.CategoriesPage   _ [MaterialDesignThemes.Wpf, Version=4.6.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  )localclr-namespace:Restaurant.Util  W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008       N� Title$  CategoriesPage��.���  � RowDefinitions �� $
��auto ��� $��* �.+�#  MaterialDesignThemes.Wpf.Card  $��0��$��0,0,0,10q�.���� $��0��$��10q�*   $Restaurant.Util.LocalizationProvider   	ContentID$ 
Categories��$��24(�$
��Bold"�   MaterialDesignLabel#��[    $��1��$��Stretch=�$��0,0,0,0q�.���� $��Center=�.  (MaterialDesignThemes.Wpf.ColorZoneAssist   Mode$ PrimaryLight=�3  -MaterialDesignThemes.Wpf.NavigationRailAssist   SelectionCornerRadius$ 20��   ShowSelectionBackground$
 True��  MaterialDesignTabControl#��[  �� TabStripPlacement$
 Left=�.@��� $
��auto������ $
��auto��$
��auto�� �� Orientation$ 
Horizontal=�.+�'  !MaterialDesignThemes.Wpf.PackIcon  $��24��$��24��$��Center=�   Kind$ Factory=�$��0,0,10,0q��� $��Center=�$ Manufacturers����&   System.Windows.Controls.DataGrid  -   	  Name$	 DataGridManufacturers��$��Visible=�
   AutoGenerateColumns$
 False��   
IsReadOnly$
 True��   CanUserAddRows$ False��   CanUserDeleteRows$ False��  MaterialDesignDataGrid#��[ $��Stretch=�$��20,10,20,10q�$��15(�  MaterialDesignFont#���  ���� *Items+ �� SelectedItem ��  �� Path$ SelectedItem� �� Mode$ TwoWay=� � ContextMenu �� .@�m� -   $ Delete�� m� Icon 0  *MaterialDesignThemes.Wpf.PackIconExtension     Kind$ DeleteOutline=�m� -   $	 Add��   $ PlusCircleOutline=�m� -   $
 Edit��   $ PencilOutline=�   Columns 0  *System.Windows.Controls.DataGridTextColumn  $
 Name��,	  &System.Windows.Controls.DataGridColumn 	  Width5
  /System.Windows.Controls.DataGridLengthConverter$ *
 1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *Name+�� $
��auto��$��4q����� $
��auto��$
��auto��$ 
Horizontal=�.+�  $��24��$��24��$��Center=�$ 
Silverware=�$��0,0,10,0q��� $��Center=�$ Items����  -   $	 DataGridItemCategories��$��Visible=�$
 False��$
 True��$ False��$ False��#��[ $��Stretch=�$��20,10,20,10q�#���  $��15(����� *Items+ �� $ SelectedItem�$ TwoWay=� �� .@�m� -   $ Delete��   $ DeleteOutline=�m� -   $	 Add��   $ PlusCircleOutline=�m� -   $
 Edit��   $ PencilOutline=�   $
 Name��$ *
  �� *Name+�� $
��auto��$��4q����� $
��auto��$
��auto��$ 
Horizontal=�.+�  $��24��$��24��$��Center=�$ TableFurniture=�$��0,0,10,0q��� $��Center=�$ Tables����  -	   $	 DataGridTables��$��Visible=�$
 False��$
 True��$ False��$ False��#��[ $��Stretch=�$��20,10,20,10q�$��Center=�#���  $��15(����� *Items+ �� $ SelectedItem�$ TwoWay=� �� .@�m� -
   $ Delete��   $ DeleteOutline=�m� -   $	 Add��   $ PlusCircleOutline=�   $ TableNumber��$ *
  �� *Id+  $ NumberOfSeats��$ *
  �� *NumberOfSeats+'  !MaterialDesignThemes.Wpf.Snackbar  -     Name$ CategoriesSnackbar��   MaterialDesignSnackbarRipple#��[    IsActive$ False��   MessageQueue 4  .MaterialDesignThemes.Wpf.MessageQueueExtension  