   M S B A M L   `   `   `  ����   
Restaurant'    !CustomMessageBox.MessageBoxCustom   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     _ [MaterialDesignThemes.Wpf, Version=4.6.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes    � Title$  MessageBoxWindow��$	��200��$	��500�� � WindowStartupLocation$ CenterScreen=� � WindowStyle$
 None=�
������� � 
ResizeMode$ 	CanResize=� � Topmost$
 True�� � ShowInTaskbar$ False��   MaterialDesignBody#���   $��Regular"�$��10(�&   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�   TextRenderingMode$
 Auto=�  MaterialDesignFont#���  .���  � ColumnDefinitions �� $
��197* ��� $
��295* �	 � RowDefinitions	 �� $
��auto ��� $��* �.+�#  MaterialDesignThemes.Wpf.Card  -   
  Name$
 
cardHeader��$��0��$��10q�$��0q�+  %MaterialDesignThemes.Wpf.ShadowAssist   ShadowDepth$ Depth5=����#DC462B ! PrimaryHueDarkForegroundBrush#���  $y�Visible=�$��2��.���� .+��� -    ��Name$ txtTitle��$��Center=�$��Stretch=�   MaterialDesignTitleTextBlock#���  $��20(�Message Title�� $��Right=�$��0,5,5,0q�$	��Top=�$��1��.+��� -    ��Name$ btnClose��$��35��$��35��
����������#ff9661 * &MaterialDesignFloatingActionDarkButton#��[ .��'  !MaterialDesignThemes.Wpf.PackIcon     Kind$ Close=�� $��1��$��2��.+�� $��20q�	 �� $
��auto ��� $
��auto ��� $��* �.+�� $��0��	 �� $
��auto ��� $��* �.+�?  9MaterialDesignThemes.Wpf.Transitions.TransitioningContent  C  =MaterialDesignThemes.Wpf.Transitions.TransitioningContentBase   OpeningEffects ;  5MaterialDesignThemes.Wpf.Transitions.TransitionEffect     Kind$ FadeIn=�  $ SlideInFromBottom=�.���� -    ��Name$ 
txtMessage��$��Center=�$��0��$��5q�)  #MaterialDesignThemes.Wpf.HintAssist   Hint$  ��$��18(�$��Medium"�$
��auto��$
��auto��� $��1��$��0,20,0,5q� �� $��* ��� $
��auto ��� $
��auto ��� $��* �.+��� -   $ btnOk��$��1��  MaterialDesignRaisedButton#��[ $��5q�$	��100��$��OK�� � ToolTip$ Ok���� -   $ 	btnCancel��$��2��#��[ $��5q�$	��100��$��Cancel��$ Cancel���� -   $ btnYes��$��1��#��[ $��5q�$	��100��$	��Yes��$	 Yes���� -   $ btnNo��$��2��#��[ $��5q�$	��100��$��No��$ No��