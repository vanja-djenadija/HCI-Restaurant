   M S B A M L   `   `   `  ����E  ARestaurant, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:Restaurant.UtilRestaurant.Util  5      5    /Restaurant.Forms.Windows.Modals.AddNewItemModal   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      /localclr-namespace:Restaurant.Util     5      _ [MaterialDesignThemes.Wpf, Version=4.6.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5        � Title$  AddNewItemModal��5	       � AllowsTransparency$
 True��5
      ���	#996F6F6F   MaterialDesignFont#��[  5       � WindowStartupLocation$ CenterOwner=�5       � WindowState$ 	Maximized=�5       � WindowStyle$
 None=�5      .��5      � $��Center=�5   	   $��Center=�5   	      MaterialDesignCardBackground#��[ 5   	   .+�5   
   '  !MaterialDesignThemes.Wpf.Snackbar  -   5          Name$ Snackbar��5         MaterialDesignSnackbarRipple#��[ 5         IsActive$ False��5         MessageQueue 5      4  .MaterialDesignThemes.Wpf.MessageQueueExtension  �� 5   
   .  (MaterialDesignThemes.Wpf.ColorZoneAssist   Mode$ SecondaryMid=�6   .@�5      �� -   5        	 ��Name$	 FoodTabItem��5      *   $Restaurant.Util.LocalizationProvider
   	ContentID$

 Food��6+   .��5      �� $	��300��5      $��Center=�5      $��Center=�5       � UseLayoutRounding$ False��5       .+�5!      �� -   5         ��Name$ FoodNameTextBox��5"      $	��250��5#      $��	0,30,0,10q�5$      $	��Top=�5%      $��Stretch=�5&      $

 Name��5'        MaterialDesignFilledTextBox#��[ 5(      $��1��5)      ��5*      �� *Name+�� 5+      -   5        $ FoodPriceTextBox��5,      $	��250��5-      $��0,0,0,10q�5.      $
 Price��5/      #��[ 50      $��2��51      ��52      �� *Price+�� 53      -   5        $ FoodDescriptionTextBox��54      $	��250��55      $��0,0,0,10q�56      $
 Description��57      #��[ 58      $��3��59      ��5:      �� *Description+�� 5;      -   5        $ FoodRecipeTextBox��5<      $	��250��5=      $��0,0,0,10q�5>      $
 Recipe��5?      #��[ 5@      $��3��5A      ��5B      �� *Recipe+�� 5C      -   5         ��Name$ FoodPortionSizeComboBox��5D      $	��250��5E      $��0,0,0,10q�5F      $
��Left=�5G      $��Center=�5H      $
 PortionSize��5I       � IsSharedSizeScope$
 True��5J       �� 
IsEditable$ False��5K       �� 
IsReadOnly$ False��5L         MaterialDesignFilledComboBox#��[ 5M       �� Text 5N      �� *PortionSize+.@�5O      �� $	
 Big��6'   �� 5P      $
 Medium��6'   �� 5Q      $
 Small��6'   5R      �� 5S      -   5        $ FoodItemCategoryComboBox��5T      $	��250��5U      $��0,0,0,10q�5V      $
��Left=�5W      $��Center=�5X      $
 ItemCategory��5Y      $
 True��5Z      $ False��5[      #��[ 5]      ��5\      �� *Items+5]      �� 5^      $	��300��5_      $��0,0,0,30q�5`       �� Orientation$ 
Horizontal=�5a      .+�5b      �� -	   5        $ FoodImageTextBox��5c      $	��220��5d      $��25,0,0,0q�5e      $
 Image��5f       �� 
IsReadOnly$
 True��5g      #��[ 5h      �� 5i      -
   5        $��5,5,5,5q�5j       " MaterialDesignFlatAccentButton#��[ 5l      .��5m      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ 	Paperclip=�66   5n      5o      �� 5q      $��0,0,0,50q�5r      $��Center=�5s      $ 
Horizontal=�5t      .+�5u      �� -   5        $	��110��5v      $��0,0,30,0q�5w      $	
 Add��5x      $��16(�5z      $
��Bold"�5{       �� 	IsDefault$
 True��5|       $  MaterialDesignFlatAccentBgButton#��[ 5}      $��2��5~      �� 5      -   5        $	��110��5�      $
 Cancel��5�      ���	#FF7D7373$��1,1,1,1q�5�      $��16(�5�      $
��Bold"�5�      #��[ 5�      $��8��5�      5�      5�      5�      �� 5�      -   5        $	 DrinkTabItem��5�      $
 Drink��6,   .��5�      �� $��Center=�5�      $��Center=�5�      $ False��5�      .+�5�      �� -   5        $ DrinkNameTextBox��5�      $	��250��5�      $��	0,30,0,10q�5�      $	��Top=�5�      $��Stretch=�5�      $

 Name��5�      #��[ 5�      $��1��5�      ��5�      �� *Name+�� 5�      -   5        $ DrinkPriceTextBox��5�      $	��250��5�      $��0,0,0,10q�5�      $
 Price��5�      #��[ 5�      $��2��5�      ��5�      �� *Price+�� 5�      -   5        $ DrinkDescriptionTextBox��5�      $	��250��5�      $��0,0,0,10q�5�      $
 Description��5�      #��[ 5�      $��3��5�      ��5�      �� *Description+�� 5�      -   5        $ DrinkQuantityTextBox��5�      $	��250��5�      $��0,0,0,10q�5�      $
 Quantity��5�      #��[ 5�      $��4��5�      ��5�      �� *
Quantity+�� 5�      -   5        $" ManufacturerCategoryComboBox��5�      $	��250��5�      $��0,0,0,10q�5�      $
��Left=�5�      $��Center=�5�      $
 ManufacturerCategory��5�      $
 True��5�      $ False��5�      $ False��5�      #��[ 5�       5�      �� *ManufacturerCategory+�� 5�      -   5        $ DrinkItemCategoryComboBox��5�      $	��250��5�      $��0,0,0,10q�5�      $
��Left=�5�      $��Center=�5�      $
 ItemCategory��5�      $
 True��5�      $ False��5�      #��[ 5�      ��5�      �� *Items+5�      �� 5�      $	��300��5�      $��0,0,0,30q�5�      $��Center=�5�      $ 
Horizontal=�5�      .+�5�      �� -   5        $ DrinkImageTextBox��5�      $	��220��5�      $��25,0,0,0q�5�      $
 Image��5�      $
 True��5�      #��[ 5�      �� 5�      -   5        $��5,5,5,5q�5�      #��[ 5�      .��5�        $ 	Paperclip=�66   5�      5�      �� 5�      $��0,0,0,50q�5�      $��Center=�5�      $ 
Horizontal=�5�      .+�5�      �� -   5        $	��110��5�      $��0,0,30,0q�5�      $	
 Add��5�      $��16(�5�      $
��Bold"�5�      $
 True��5�      #��[ 5�      $��2��5�      �� 5�      -   5        $	��110��5�      $
 Cancel��5�      ���	#FF7D7373$��1,1,1,1q�5�      $��16(�5�      $
��Bold"�5�      #��[ 5�      $��8��5�      5�      5�      5�      5�      5�      5�      