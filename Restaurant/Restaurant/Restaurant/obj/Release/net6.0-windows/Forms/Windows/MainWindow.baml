   M S B A M L   `   `   `  ���� E  ARestaurant, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:Restaurant.UtilRestaurant.Util  )    #Restaurant.Forms.Windows.MainWindow   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     /localclr-namespace:Restaurant.Util     _ [MaterialDesignThemes.Wpf, Version=4.6.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006    � Title$  
Restaurant�� � WindowStartupLocation$ CenterScreen=� � WindowState$ 	Maximized=�.��#  MaterialDesignThemes.Wpf.Card  .���� $��5q�$��Stretch=�$	��Top=�.  (MaterialDesignThemes.Wpf.ColorZoneAssist   Mode$ 
PrimaryMid=� )  %MaterialDesignNavigatilRailTabControl#��[   � 	Resources  �� 
TargetType �� Property �� Value��%.   '��       �� " ��.���  � ��$	 100��.@��� -    ��Name$ MenuTabItem��$	��100��$��5q����� $
��auto��$
��auto��.+�'  !MaterialDesignThemes.Wpf.PackIcon  $��24��$��24��$��Center=�	   Kind$	 SilverwareClean=��� $��Center=�*   $Restaurant.Util.LocalizationProvider
   	ContentID$

 Menu��   MaterialDesignBody1TextBlock#��[ �� � -   $��MenuPage��  � Source$  /Forms/Pages/MenuPage.xaml?��� -   $ OrdersTabItem��$	��100��$��5q����� $
��auto��$
��auto��$��0,0,0,0q�.+�  $��24��$��24��$��Center=�$	 ListBoxOutline=��� $��Center=�$
 Orders��#��[ �� � -   $��
OrdersPage��$" /Forms/Pages/OrdersPage.xaml?��� -   $ CategoriesTabItem��$	��100��$��5q����� $
��auto��$
��auto��$��0,0,0,0q�.+�  $��24��$��24��$��Center=�$	 RhombusSplit=��� $��0,0,0,0q�$��Center=�$
 
Categories��#��[ �� � -   $��CategoriesPage��$&  /Forms/Pages/CategoriesPage.xaml?��� -   $ BillsTabItem��$	��100��$��5q����� $
��auto��$
��auto��.+�  $��24��$��24��$��Center=�$	 ReceiptTextOutline=��� $��Center=�$
 Bills��#��[ �� � -   $��	BillsPage��$! /Forms/Pages/BillsPage.xaml?��� -	   $ EmployeesTabItem��$	��100��$��5q����� $
��auto��$
��auto��.+�  $��24��$��24��$��Center=�$	 PersonOutline=��� $��Center=�$
 	Employees��#��[ �� � -
   $��EmployeesPage��$% /Forms/Pages/EmployeesPage.xaml?��� -   $ SettingsTabItem��$	��100��$��5q����� $
��auto��$
��auto��.+�  $��24��$��24��$��Center=�$	 SettingsOutline=��� $��Center=�$
 Settings��#��[ �� � -   $��SettingsPage��$$ /Forms/Pages/SettingsPage.xaml?��� -   $ LogOutTabItem��$	��100��$��5q����� $
��auto��$
��auto��.+�  $��24��$��24��$��Stretch=�$��Stretch=�$	 LogoutVariant=��� $��Center=�$
 LogOut��#��[ 