   M S B A M L   `   `   `  ���� E  ARestaurant, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE'clr-namespace:Restaurant.Forms.ControlsRestaurant.Forms.Controls  .    (Restaurant.Forms.Controls.NumericSpinner   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     9local'clr-namespace:Restaurant.Forms.Controls     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     -     >�Name$  root_numeric_spinner�� � 	Resources    updown_button_style �� 
TargetType ��Name  PrimaryHueLightBrush  MaterialDesignTextBoxBorder �� CornerRadius ��Name �� Triggers P� Property P� Value	 �� 
TargetName  ThemeBrushActive
 �� Value �� Property �� 
TargetType��%  &	        7  7  '�� �     7   �� " ��.R��� $ br��8��  8�� $��0q�$ 0��._��� $ cp��#��z��#��z��#��z�� P�  �@J�IsMouseOver$
 true��. ��� $	 br��#
 �   � ��P�  � {�$ false��. ��� $	 br�� � ��

 ������� " ��.���  � ��8
   .����  J� OpacityMask !�  !� Visual �� 
���   �$ 4�� J� SnapsToDevicePixels$
 True������ *ActualWidth+ �� RelativeSource �� *FindAncestor+ �� AncestorType
 Border���� *ActualHeight+ �� *FindAncestor+
 Border._��  � RowDefinitions �� ��  � ColumnDefinitions �� �� $��22 �.+��� -    ��Name$ tb_main��$��2��$��0��$	��5,1q�$��Center=�$��14(�$��Medium"�$��0���� -    ��Name$ cmdUp��$��0��$��1��$
��auto��$
��auto����F� $��Center=�$��Center=�"���� 	=     �     	= � z  	= 	
���   ��� -   $ cmdDown��$��1��$��1��$
��auto��$
��auto����F� $��Center=�$��Center=�"����        � z     � 	=  	= 	
���   ��� $��2��$��2��$��0q� �� Padding$ 0q�
�������$��1q�$ 4�� J� IsHitTestVisible$ False��