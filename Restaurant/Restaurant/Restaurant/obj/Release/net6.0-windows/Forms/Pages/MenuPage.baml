   M S B A M L   `   `   `  ���� E  ARestaurant, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:Restaurant.UtilRestaurant.Util  E'clr-namespace:Restaurant.Forms.ControlsRestaurant.Forms.Controls  %    Restaurant.Forms.Pages.MenuPage   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     /localclr-namespace:Restaurant.Util     _ [MaterialDesignThemes.Wpf, Version=4.6.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  0uc'clr-namespace:Restaurant.Forms.Controls    N� Title$
  Menu��   MaterialDesignFont N� 
FontFamily# [  .��� -    �Name$ MenuGrid�� � RowDefinitions �� $
��Auto ��� $��* �.+�#  MaterialDesignThemes.Wpf.Card  $��0��$��0,0,0,10q�.���� $��10q�*   $Restaurant.Util.LocalizationProvider   	ContentID$
 Menu��$��24(�$
��Bold"�  MaterialDesignLabel#��[ � $��1�� � ColumnDefinitions �� $��2* ��� $��* � �� $
��Auto ��� $��* ��� $
��Auto �.+�  $��0��$��0��$��0,0,0,0q�.���� $��	0,10,0,10q�$��Right=� �� Orientation$ 
Horizontal=�.+��� -   $��0,0,10,0q�$��0,0,0,0q�$��Stretch=�$��Stretch=� & "MaterialDesignToolForegroundButton#��[ .��'  !MaterialDesignThemes.Wpf.PackIcon  $��30��$��30��$��Stretch=�$��Stretch=�   Kind$ PlusCircleOutline=�'  !MaterialDesignThemes.Wpf.PopupBox  $��	10,5,10,5q�   	ToolTipID$ FilterByItemCategory��	   PlacementMode$	 LeftAndAlignTopEdges=�
   	StaysOpen$

 True��   ToggleContent   $��30��$��30��$ FilterOutline=�   PopupContent. � $	��300��$��8,8,8,8q� �� $��* ��� $��* � �� $
��Auto ��� $��* ��� $
��Auto �.+��� $��0��$��0��$��80��$��	10,0,0,10q�$
��Left=�$��Center=�$ Filter�� $  MaterialDesignHeadline6TextBlock#��[ �� -    ��Name$ ItemCategoryListBox��$��1��$��2�� � IsSharedSizeScope$
 True��$
��True��$��Visible=����� *Items+ �� Mode$ TwoWay=� �� SelectedItem ��  �� Path$ SelectedItem�$ TwoWay=����� .R���  ��Name$ Border�� �� Padding$ 0,8,8,8q�._�� .+��� $ 
Horizontal=�.+���  ��Name$ CheckBox��$��0,0,10,0q�$��Center=� d� 	IsChecked �� $ 	IsChecked�$ TwoWay=��� $��Center=�$��15(�$
��Bold"����� *Name+ �� Triggers ��  �� Value$
 True�� �� Binding �� *
IsSelected+.a���  �� 
TargetName$ Border��  MaterialDesignSelection �� Value# �   �� Property � ���� $��2��$��2��$��0,10,0,0q�$��Right=�$ 
Horizontal=�.+��� -   $ Apply��   ClosePopupCommand#��Z  " MaterialDesignRaisedDarkButton#��[ �� $ Cancel��#��Z    MaterialDesignFlatDarkButton#��[ �� -   $��30��$��30��$��	10,0,30,0q�$��0,0,0,0q�$ RemoveAllFilters��#��[ .��  $��30��$��30��$ FilterRemoveOutline=��� -   $ UniformGrid��$��1��$��0��$��10,10,10,10q�$��Stretch=�$��Stretch=�$��Stretch=�$
��Auto=�$
��Auto=����� *Items+ �� $ SelectedItem�$ TwoWay=����� .R�A� ���� .R�  $	��200��$��Stretch=�$��Stretch=�$��Center=� � ContextMenu �� .@�m� -   $ Delete�� m� Icon 0  *MaterialDesignThemes.Wpf.PackIconExtension     Kind$ DeleteOutline=�.��� $ ItemElementGrid�� �� $��* ��� $��* ��� $��* �.+���   ��Name$  	ItemImage��$��0��$	��200��$	��200��$��Uniform=����� *ItemImagePath+�� ! ��Name$! ItemNameLabel��$��1��$��Center=�$��16(�$
��Bold"����� *Name+� $ 	PriceGrid��$��2��$��Right=� �� $��* ��� $
��Auto �.+��� $��0��$	��150��$��70,0,0,0q�" �� Padding$" 0,5,0,0q�$��Stretch=�$��16(�$
��Bold"�  PrimaryHueMidBrush#���  �� ��� *Price+ �� $	� KM���� -   $��1��$��	0,0,10,10q�$ 
AddToOrder�� / +MaterialDesignFloatingActionMiniLightButton#��[ 
# � Tag# �� $ �� RelativeSource$ �� % �� AncestorType% Grid& �� AncestorLevel$& 2��.��  $��16��$��16��$
 Plus=�'  !MaterialDesignThemes.Wpf.Snackbar  -	   '  Name$' Snackbar��$	��500��  	 MaterialDesignSnackbarRipple#��[	 (   IsActive$( False��)   MessageQueue) 4  .MaterialDesignThemes.Wpf.MessageQueueExtension    -
   *  Name$* 	OrderCard��$��2��$��1��$��
10,0,10,10q�#���  .���  �� $
��Auto ��� $��* ��� $
��Auto ��� $
��Auto ��� $
��Auto �.+��� $��0��$��10q�$��Center=�$ Order��$��24(�$
��Bold"�#��[ #��[ �� -   $ OrderedItemsListBox��$��1��$
��Auto=�$
��Auto=����� *Items+ �� $ SelectedItem�$ TwoWay=����� + �� 
TargetType"+ ��, �� Triggers, P� - P� Property- �@J�IsKeyboardFocusWithin. P� Value$
. True��. ���  �@��
IsSelected$
 True������ .R��� $��5q�$ 
Horizontal=�.+��� $  	ItemImage��$��80��$��80��$��Uniform=����� *ItemImagePath+�� $	��150��$��	20,0,20,0q�$��Center=�$��Center=�.+��� $! ItemNameLabel��$��18(�$��SemiCondensed&�$
��Bold"����� *Name+�� $" 4,4,4,4q�$��Stretch=�$��14(�$
��Bold"��� ��� *Price+ �� $	� KM���� $��50��$��80��$��Stretch=�$��Center=�/ J� OpacityMask/ !� 0 !� Visual0 �� 
���   �1 �� CornerRadius$1 4��2 J� SnapsToDevicePixels$
2 True������ *ActualWidth+$ �� *FindAncestor+
% Border���� *ActualHeight+$ �� *FindAncestor+
% Border._��  �� ��  �� $��* ��� $
��Auto �.+��� 3 ��Name$3 QuantityTextBox��$��2��$��0��$	��5,1q�$��Center=�$��Center=�$��14(�$��Medium"�4 �� 
IsReadOnly$
4 True��5 �� IsUndoEnabled$5 False������ *
Quantity+�� 6 ��Name$6 IncreaseQuantityButton��-   $��0��$��1��$��30��$��30��$��0,0,0,0q�$��Bottom=�$��Center=�# �� $ �� % Grid$& 1��.��  $ 	ChevronUp=��� $6 DecreaseQuantityButton��-   $��1��$��1��$��30��$��30��$��0,0,0,0q�$	��Top=�$��Center=�# �� $ �� % Grid$& 1��.��  $ ChevronDown=��� $��2��$��2��$��0q�$ 0q�
�������$��1q�$1 4��7 J� IsHitTestVisible$7 False���� -   $��30��$��30��$��10,0,0,0q�$��0,0,0,0q�$��Right=�$��Stretch=�$��Center=�$ 
RemoveItem��#��[ .��  $��24��$��24��$ DeleteOutline=��� $��2��$��10q�$ 
Horizontal=�.+��� $��0,0,10,0q�$��4,4,4,4q�$ 
TotalPrice��$��20(�$
��Bold"�#��[ �� -   $! TotalPriceLabel��$��4,4,4,4q�8 �� ContentStringFormat$8  {0} KM��$��20(�$
��Bold"�#��[ �� $��3��$��10q�$ 
Horizontal=�.+��� $��0,0,10,0q�$��4,4,4,4q�$ TableNumber��$��20(�$
��Bold"�#��[ �� -   9 ��Name$9 TableNumberComboBox��$	��100��$��Center=�$��Center=�$��Center=�: �� SelectedIndex$: 0������ *Items+ �� $ SelectedItem�$ TwoWay=����� .R��� ���� *Id+�� -   $��4��$��10q�$ CreateOrder�� $
  MaterialDesignFlatAccentBgButton#��[
 