   M S B A M L   `   `   `  ����E  ARestaurant, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE'clr-namespace:Restaurant.Forms.ControlsRestaurant.Forms.Controls  5      .    (Restaurant.Forms.Controls.NumericSpinner   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      9local'clr-namespace:Restaurant.Forms.Controls     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      -   5          >�Name$  root_numeric_spinner��5       � 	Resources 5         updown_button_style �� 
TargetType ��Name  PrimaryHueLightBrush  MaterialDesignTextBoxBorder �� CornerRadius ��Name �� Triggers P� Property P� Value	 �� 
TargetName  ThemeBrushActive
 �� Value �� Property �� 
TargetType��%  &	        7  7  '�� �    7   �� 5   
   " ��66   .R�5      �� $ br��5      8��  8�� $��0q�5      $ 0��5      ._�5      �� $ cp��5      #��z��5      #��z��5      #��z��5      5       5      P� 5       �@J�IsMouseOver$
 true��61   . �5      �� $	 br��6   #
 �  6C    � ��5      P� 5       � {�$ false��6/   . �5      �� $	 br��6    � ��

 �����6C   5       5"      �� 5$   
   " ��6   .�5%      ��  � ��8
   6)   5&      5'      .��5(      ��  J� OpacityMask 5)   
   !� 5*       !� Visual 5+      �� 5,      
���   �$ 4��50       J� SnapsToDevicePixels$
 True��51      ��5-      �� *ActualWidth+ �� RelativeSource �� *FindAncestor+ �� AncestorType
 Border��5.      �� *ActualHeight+ �� *FindAncestor+
 Border51      53      ._�55   
   �  � RowDefinitions 56      �� 57      �� 58       � ColumnDefinitions 5:      �� 5;      �� 5<      $��22 �6#   .+�5>      �� -   5         ��Name$ tb_main��5?      $��2��5@      $��0��5A      $	��5,1q�5B      $��Center=�5C      $��14(�5E      $��Medium"�5F      $��0��5G      �� 5H      -   5         ��Name$ cmdUp��5I      $��0��5J      $��1��5K      $
��auto��5L      $
��auto��5M      ��5P      F� 5Q      $��Center=�5R      $��Center=�5S      "���� 	=     �     	= � z  	= 	
���   �5U      5W      �� 5X      -   5        $ cmdDown��5Y      $��1��5Z      $��1��5[      $
��auto��5\      $
��auto��5]      ��5`      F� 5a      $��Center=�5b      $��Center=�5c      "����        � z     � 	=  	= 	
���   �5e      5g      �� 5h      $��2��5i      $��2��5j      $��0q�5k       �� Padding$ 0q�5l      
�������$��1q�5n      $ 4��5o       J� IsHitTestVisible$ False��5p      5q      5r      5s      