   M S B A M L   `   `   `  ����E  ARestaurant, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:Restaurant.UtilRestaurant.Util  5      7    1Restaurant.Forms.Windows.Modals.DetailedBillModal   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      /localclr-namespace:Restaurant.Util     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5        � Title$  DetailedBillModal��5       � AllowsTransparency$
 True��5	      ���	#33000000   MaterialDesignFont#��[  5      $��15(�5       � 
ResizeMode$ NoResize=�5       � WindowStartupLocation$ CenterScreen=�5       � WindowState$ 	Maximized=�5       � WindowStyle$
 None=�5       J� CommandBindings 5      )  #System.Windows.Input.CommandBinding  5   
   -   5           Command$ ApplicationCommands.Close��5      6=   .��5      � $	��400��5   	   $	��400��5   	   $��Center=�5   	   $��Center=�5   	      MaterialDesignCardBackground#��[ 5   	    � RowDefinitions 5   
   �� 5      $��* �6   �� 5      $��6* �6   �� 5      $��* �6   �� 5      $��* �6   �� 5       $��* �6   �� 5!      $��* �6   .+�5#   
   �� $��0��5$      $��Center=�5%      $��Center=�5&      *   $Restaurant.Util.LocalizationProvider	   	ContentID$
	 Bill��5'      $��24(�5(        MaterialDesignLabel#��[ 5)      &   System.Windows.Controls.DataGrid  5*   
   -   5        
  Name$
 DataGridItems��5+      $��1��5,      $	��400��5-      $��Center=�5.      $��Stretch=�5/         AutoGenerateColumns$ False��50         CanUserAddRows$ False��51         CanUserDeleteRows$ False��52      #���   53      $��12(�54      $   HorizontalScrollBarVisibility$ Disabled=�55         
IsReadOnly$
 True��56        MaterialDesignDataGrid#��[ 58       � UseLayoutRounding$
 True��59      "   VerticalScrollBarVisibility$
 Auto=�5:      ��57      �� *Items+   Columns 5;      0  *System.Windows.Controls.DataGridTextColumn  5<      ,  &System.Windows.Controls.DataGridColumn   Width5  /System.Windows.Controls.DataGridLengthConverter$ 2* 5=      $	 ItemName��5>         Header$
 Name��5@      1  +System.Windows.Controls.DataGridBoundColumn   Binding 5?      �� *Name+5@        5A      $ * 5B      $	 Price��5C       5D      �� *Price+ �� StringFormat$ {0} KM��  5E      $ * 5F      $	 Quantity��5G       5H      �� *
Quantity+  5I      $ * 6%    6/   �� *
TotalPrice+$ {0} KM��5K      �� 5M   
   $��2��5N      $��10,0,0,0q�5O      $��Stretch=�5P      $��Center=�5Q       �� Orientation$ 
Horizontal=�5R      .+�5S      �� $��0,0,10,0q�5T      $��4,4,4,4q�5U      $	 
TotalPrice��5V      $
��Bold"�5W      #��[ 5X      �� 5Y       �� ContentStringFormat$ 	 {}{0} KM��5[      #��[ 5\      ��5Z      �� *
TotalPrice+5\      5]      �� 5_   
   $��3��5`      $��10,0,0,0q�5a      $��Stretch=�5b      $��Center=�5c      $ 
Horizontal=�5d      .+�5e      �� $��0,0,10,0q�5f      $��4,4,4,4q�5g      $	 DateTime��5h      $
��Bold"�5i      #��[ 5j      �� 5k      #��[ 61   ��6   �� *
DateTime+61   5l      �� 5n   
   $��4��5o      $��10,0,0,0q�5p      $��Stretch=�5q      $��Center=�5r      $ 
Horizontal=�5s      .+�5t      �� $��0,0,10,0q�5u      $��4,4,4,4q�5v      $	 Employee��5w      $
��Bold"�5x      #��[ 5y      �� 5z      #��[ 61   ��6   �� *
FullName+61   5{      �� 5}   
   $��5��5~      $��1��5      $��5q�5�      $��Right=�5�      $	 Close��5�      $��ApplicationCommands.Close��5�         MaterialDesignOutlinedButton#��[ 5�      5�      5�      