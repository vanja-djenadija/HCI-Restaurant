   M S B A M L   `   `   `  ����  
Restaurant'    !CustomMessageBox.MessageBoxCustom   5   	   W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   _ [MaterialDesignThemes.Wpf, Version=4.6.1.0, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	     � Title$  MessageBoxWindow��5   	   $	��200��5   	   $	��500��5	   	    � WindowStartupLocation$ CenterScreen=�5
   	    � WindowStyle$
 None=�5   	   
������� � 
ResizeMode$ 	CanResize=�5   	    � Topmost$
 True��5   	    � ShowInTaskbar$ False��5   	      MaterialDesignBody#���   5   	   $��Regular"�5   	   $��10(�5   	   &   System.Windows.Media.TextOptions   TextFormattingMode$ Ideal=�5   	      TextRenderingMode$
 Auto=�5   	     MaterialDesignFont#���  5   	   .��5      �  � ColumnDefinitions 5   
   �� 5      $
��197* �6   �� 5      $
��295* �6   	 � RowDefinitions	 5   
   �� 5      $
��auto �6   �� 5      $��* �6   .+�5    
   #  MaterialDesignThemes.Wpf.Card  -   5        
  Name$
 
cardHeader��5       $��0��5!      $��10q�5"      $��0q�5#      +  %MaterialDesignThemes.Wpf.ShadowAssist   ShadowDepth$ Depth5=�5$      ���#DC462B ! PrimaryHueDarkForegroundBrush#���  5&      $y�Visible=�5'      $��2��5(      .��5)      �� .+�5*      �� -   5         ��Name$ txtTitle��5*      $��Center=�5+      $��Stretch=�5,         MaterialDesignTitleTextBlock#���  5-      $��20(�5.      Message Title69   5/      50      �� 51   
   $��Right=�6   $��0,5,5,0q�52      $	��Top=�53      $��1��54      .+�55      �� -   5         ��Name$ btnClose��55      $��35��57      $��35��58      
����������#ff9661 * &MaterialDesignFloatingActionDarkButton#��[ 5;      .��5<      '  !MaterialDesignThemes.Wpf.PackIcon     Kind$ Close=�6*   5=      5>      � 5?   
   $��1��6   $��2��5@      .+�5A      � $��20q�6   	 5B      �� 5C      $
��auto �6$   �� 5D      $
��auto �6$   �� 5E      $��* �6$   .+�5H      � $��0��6   	 5I      �� 5J      $
��auto �6(   �� 5K      $��* �6(   .+�5N      ?  9MaterialDesignThemes.Wpf.Transitions.TransitioningContent  C  =MaterialDesignThemes.Wpf.Transitions.TransitioningContentBase   OpeningEffects 5O      ;  5MaterialDesignThemes.Wpf.Transitions.TransitionEffect  5P         Kind$ FadeIn=�6>     5Q      $ SlideInFromBottom=�6>   .��5S      �� -   5         ��Name$ 
txtMessage��5S       $��Center=�5T       $��0��5U       $��5q�5V       )  #MaterialDesignThemes.Wpf.HintAssist   Hint$  ��5W       $��18(�5X       $��Medium"�5Y       $
��auto��5Z       $
��auto��5[       5\      5^      � 5_      $��1��6   $��0,20,0,5q�5`       5a      �� 5b      $��* �6+   �� 5c      $
��auto �6+   �� 5d      $
��auto �6+   �� 5e      $��* �6+   .+�5h      �� -   5        $ btnOk��5h      $��1��5j        MaterialDesignRaisedButton#��[ 5k      $��5q�5l      $	��100��5m      $��OK��5n       � ToolTip$ Ok��5o      �� 5p      -   5        $ 	btnCancel��5p      $��2��5r      #��[ 5s      $��5q�5t      $	��100��5u      $��Cancel��5v      $ Cancel��5w      �� 5x      -   5        $ btnYes��5x      $��1��5z      #��[ 5{      $��5q�5|      $	��100��5}      $	��Yes��5~      $	 Yes��5      �� 5�      -   5        $ btnNo��5�      $��2��5�      #��[ 5�      $��5q�5�      $	��100��5�      $��No��5�      $ No��5�      5�      5�      5�      5�      5�      