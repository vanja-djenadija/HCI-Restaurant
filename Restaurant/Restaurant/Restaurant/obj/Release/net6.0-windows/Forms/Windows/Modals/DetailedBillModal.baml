   M S B A M L   `   `   `  ���� E  ARestaurant, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:Restaurant.UtilRestaurant.Util  7    1Restaurant.Forms.Windows.Modals.DetailedBillModal   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     /localclr-namespace:Restaurant.Util     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006       � Title$  DetailedBillModal�� � AllowsTransparency$
 True�����	#33000000   MaterialDesignFont#��[  $��15(� � 
ResizeMode$ NoResize=� � WindowStartupLocation$ CenterScreen=� � WindowState$ 	Maximized=� � WindowStyle$
 None=� J� CommandBindings )  #System.Windows.Input.CommandBinding  -      Command$ ApplicationCommands.Close��.��� $	��400��$	��400��$��Center=�$��Center=�   MaterialDesignCardBackground#��[  � RowDefinitions �� $��* ��� $��6* ��� $��* ��� $��* ��� $��* ��� $��* �.+��� $��0��$��Center=�$��Center=�*   $Restaurant.Util.LocalizationProvider	   	ContentID$
	 Bill��$��24(�  MaterialDesignLabel#��[ &   System.Windows.Controls.DataGrid  -   
  Name$
 DataGridItems��$��1��$	��400��$��Center=�$��Stretch=�   AutoGenerateColumns$ False��   CanUserAddRows$ False��   CanUserDeleteRows$ False��#���   $��12(�$   HorizontalScrollBarVisibility$ Disabled=�   
IsReadOnly$
 True��  MaterialDesignDataGrid#��[  � UseLayoutRounding$
 True��"   VerticalScrollBarVisibility$
 Auto=����� *Items+   Columns 0  *System.Windows.Controls.DataGridTextColumn  ,  &System.Windows.Controls.DataGridColumn   Width5  /System.Windows.Controls.DataGridLengthConverter$ 2* $	 ItemName��   Header$
 Name��1  +System.Windows.Controls.DataGridBoundColumn   Binding �� *Name+  $ * $	 Price�� �� *Price+ �� StringFormat$ {0} KM��  $ * $	 Quantity�� �� *
Quantity+  $ *  �� *
TotalPrice+$ {0} KM���� $��2��$��10,0,0,0q�$��Stretch=�$��Center=� �� Orientation$ 
Horizontal=�.+��� $��0,0,10,0q�$��4,4,4,4q�$	 
TotalPrice��$
��Bold"�#��[ ��  �� ContentStringFormat$  {0} KM��#��[ ���� *
TotalPrice+�� $��3��$��10,0,0,0q�$��Stretch=�$��Center=�$ 
Horizontal=�.+��� $��0,0,10,0q�$��4,4,4,4q�$	 DateTime��$
��Bold"�#��[ �� #��[ ���� *
DateTime+�� $��4��$��10,0,0,0q�$��Stretch=�$��Center=�$ 
Horizontal=�.+��� $��0,0,10,0q�$��4,4,4,4q�$	 Employee��$
��Bold"�#��[ �� #��[ ���� *
FullName+�� $��5��$��1��$��5q�$��Right=�$	 Close��$��ApplicationCommands.Close��   MaterialDesignOutlinedButton#��[ 