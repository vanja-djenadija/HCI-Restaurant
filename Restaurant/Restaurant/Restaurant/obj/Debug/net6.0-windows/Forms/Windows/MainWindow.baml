   M S B A M L   `   `   `  ����E  ARestaurant, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:Restaurant.UtilRestaurant.Util  5      )    #Restaurant.Forms.Windows.MainWindow   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      /localclr-namespace:Restaurant.Util     5      _ [MaterialDesignThemes.Wpf, Version=4.6.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5      -   5          � Title$  
Restaurant��5	       � WindowStartupLocation$ CenterScreen=�5       � WindowState$ 	Maximized=�5      .��5      #  MaterialDesignThemes.Wpf.Card  .��5   
   �� $��5q�5      $��Stretch=�5      $	��Top=�5      .  (MaterialDesignThemes.Wpf.ColorZoneAssist   Mode$ 
PrimaryMid=�5       )  %MaterialDesignNavigatilRailTabControl#��[  5       � 	Resources 5       �� 
TargetType �� Property �� Value��%S   '��       �� 5      " ��6   .�5      ��  � ��$	 100��61   5      5      .@�5,      �� -   5         ��Name$ MenuTabItem��5-      $	��100��5.      $��5q�5/      ��50      �� 51      $
��auto��6!   $
��auto��6.   .+�52      '  !MaterialDesignThemes.Wpf.PackIcon  $��24��53      $��24��54      $��Center=�55      	   Kind$	 SilverwareClean=�56      �� 57      $��Center=�58      *   $Restaurant.Util.LocalizationProvider
   	ContentID$

 Menu��59         MaterialDesignBody1TextBlock#��[ 5:      5;      ��5=       � 5>      -   5        $��MenuPage��5>      5@      �� 5B      -   5        $ OrdersTabItem��5C      $	��100��5D      $��5q�5E      ��5F      �� 5G      $
��auto��5H      $
��auto��5I      $��0,0,0,0q�5J      .+�5K        $��24��5L      $��24��5M      $��Center=�5N      $	 ListBoxOutline=�5O      �� 5P      $��Center=�5Q      $
 Orders��5R      #��[ 5S      5T      ��5V       � 5W      -   5        $��
OrdersPage��5W        � Source$" /Forms/Pages/OrdersPage.xaml?�6.   5Y      �� 5[      -   5        $ CategoriesTabItem��5\      $	��100��5]      $��5q�5^      ��5_      �� 5`      $
��auto��5a      $
��auto��5b      $��0,0,0,0q�5c      .+�5d        $��24��5e      $��24��5f      $��Center=�5g      $	 RhombusSplit=�5h      �� 5i      $��0,0,0,0q�5j      $��Center=�5k      $
 
Categories��5l      #��[ 5m      5n      ��5p       � 5q      -   5        $��CategoriesPage��5q      $&  /Forms/Pages/CategoriesPage.xaml?�62   5s      �� 5u      -   5        $ BillsTabItem��5v      $	��100��5w      $��5q�5x      ��5y      �� 5z      $
��auto��6!   $
��auto��6.   .+�5{        $��24��5|      $��24��5}      $��Center=�5~      $	 ReceiptTextOutline=�5      �� 5�      $��Center=�5�      $
 Bills��5�      #��[ 5�      5�      ��5�       � 5�      -	   5        $��	BillsPage��5�      $! /Forms/Pages/BillsPage.xaml?�6-   5�      �� 5�      -
   5        $ EmployeesTabItem��5�      $	��100��5�      $��5q�5�      ��5�      �� 5�      $
��auto��6!   $
��auto��6.   .+�5�        $��24��5�      $��24��5�      $��Center=�5�      $	 PersonOutline=�5�      �� 5�      $��Center=�5�      $
 	Employees��5�      #��[ 5�      5�      ��5�       � 5�      -   5        $��EmployeesPage��5�      $% /Forms/Pages/EmployeesPage.xaml?�61   5�      �� 5�      -   5        $ SettingsTabItem��5�      $	��100��5�      $��5q�5�      ��5�      �� 5�      $
��auto��6!   $
��auto��6.   .+�5�        $��24��5�      $��24��5�      $��Center=�5�      $	 SettingsOutline=�5�      �� 5�      $��Center=�5�      $
 Settings��5�      #��[ 5�      5�      ��5�       � 5�      -   5        $��SettingsPage��5�      $$ /Forms/Pages/SettingsPage.xaml?�60   5�      �� 5�      -   5        $ LogOutTabItem��5�      $	��100��5�      $��5q�5�      ��5�      �� 5�      $
��auto��6!   $
��auto��6.   .+�5�        $��24��5�      $��24��5�      $��Stretch=�5�      $��Stretch=�5�      $	 LogoutVariant=�5�      �� 5�      $��Center=�5�      $
 LogOut��5�      #��[ 5�      5�      5�      5�      5�      5�      