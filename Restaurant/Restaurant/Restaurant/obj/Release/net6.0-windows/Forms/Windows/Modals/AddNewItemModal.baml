   M S B A M L   `   `   `  ���� E  ARestaurant, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:Restaurant.UtilRestaurant.Util  5    /Restaurant.Forms.Windows.Modals.AddNewItemModal   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     /localclr-namespace:Restaurant.Util     _ [MaterialDesignThemes.Wpf, Version=4.6.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006    � Title$  AddNewItemModal�� � AllowsTransparency$
 True�����	#996F6F6F   MaterialDesignFont#��[   � WindowStartupLocation$ CenterOwner=� � WindowState$ 	Maximized=� � WindowStyle$
 None=�.��� $��Center=�$��Center=�   MaterialDesignCardBackground#��[ .+�'  !MaterialDesignThemes.Wpf.Snackbar  -     Name$ Snackbar�� $  MaterialDesignSnackbarBackground#��[    MaterialDesignDarkForeground#��[    IsActive$ False��   MessageQueue 4  .MaterialDesignThemes.Wpf.MessageQueueExtension  �� .  (MaterialDesignThemes.Wpf.ColorZoneAssist   Mode$ SecondaryMid=�.@��� -   	 ��Name$	 FoodTabItem��*   $Restaurant.Util.LocalizationProvider
   	ContentID$

 Food��.���� $	��300��$��Center=�$��Center=� � UseLayoutRounding$ False��.+��� -    ��Name$ FoodNameTextBox��$	��250��$��	0,30,0,10q�$	��Top=�$��Stretch=�$

 Name��  MaterialDesignFilledTextBox#��[ $��1������ *Name+�� -   $ FoodPriceTextBox��$	��250��$��0,0,0,10q�$
 Price��#��[ $��2������ *Price+�� -   $ FoodDescriptionTextBox��$	��250��$��0,0,0,10q�$
 Description��#��[ $��3������ *Description+�� -   $ FoodRecipeTextBox��$	��250��$��0,0,0,10q�$
 Recipe��#��[ $��3������ *Recipe+�� -    ��Name$ FoodPortionSizeComboBox��$	��250��$��0,0,0,10q�$
��Left=�$��Center=�$
 PortionSize�� � IsSharedSizeScope$
 True�� �� 
IsEditable$ False�� �� 
IsReadOnly$ False��   MaterialDesignFilledComboBox#��[  �� Text �� *PortionSize+.@��� $	
 Big���� $
 Medium���� $
 Small���� -   $ FoodItemCategoryComboBox��$	��250��$��0,0,0,10q�$
��Left=�$��Center=�$
 ItemCategory��$
 True��$ False��#��[ ���� *Items+�� $	��300��$��0,0,0,30q�$��Center=� �� Orientation$ 
Horizontal=�.+��� -	   $ FoodImageTextBox��$	��220��$��25,0,0,0q�$
 Image�� �� 
IsReadOnly$
 True��#��[ �� -
   $��5,5,5,5q� " MaterialDesignFlatAccentButton#��[ .��'  !MaterialDesignThemes.Wpf.PackIcon     Kind$ 	Paperclip=��� $��0,0,0,50q�$��Center=�$ 
Horizontal=�.+��� -   $	��110��$��0,0,30,0q�$	
 Add��$��16(�$
��Bold"� �� 	IsDefault$
 True�� $  MaterialDesignFlatAccentBgButton#��[ $��2���� -   $	��110��$
 Cancel�����	#FF7D7373$��1,1,1,1q�$��16(�$
��Bold"�#��[ $��8���� -   $	 DrinkTabItem��$
 Drink��.���� $��Center=�$��Center=�$ False��.+��� -   $ DrinkNameTextBox��$	��250��$��	0,30,0,10q�$	��Top=�$��Stretch=�$

 Name��#��[ $��1������ *Name+�� -   $ DrinkPriceTextBox��$	��250��$��0,0,0,10q�$
 Price��#��[ $��2������ *Price+�� -   $ DrinkDescriptionTextBox��$	��250��$��0,0,0,10q�$
 Description��#��[ $��3������ *Description+�� -   $ DrinkQuantityTextBox��$	��250��$��0,0,0,10q�$
 Quantity��#��[ $��4������ *
Quantity+�� -   $" ManufacturerCategoryComboBox��$	��250��$��0,0,0,10q�$
��Left=�$��Center=�$
 ManufacturerCategory��$
 True��$ False��$ False��#��[  �� *ManufacturerCategory+�� -   $ DrinkItemCategoryComboBox��$	��250��$��0,0,0,10q�$
��Left=�$��Center=�$
 ItemCategory��$
 True��$ False��#��[ ���� *Items+�� $	��300��$��0,0,0,30q�$��Center=�$ 
Horizontal=�.+��� -   $ DrinkImageTextBox��$	��220��$��25,0,0,0q�$
 Image��$
 True��#��[ �� -   $��5,5,5,5q�#��[ .��  $ 	Paperclip=��� $��0,0,0,50q�$��Center=�$ 
Horizontal=�.+��� -   $	��110��$��0,0,30,0q�$	
 Add��$��16(�$
��Bold"�$
 True��#��[ $��2���� -   $	��110��$
 Cancel�����	#FF7D7373$��1,1,1,1q�$��16(�$
��Bold"�#��[ $��8��