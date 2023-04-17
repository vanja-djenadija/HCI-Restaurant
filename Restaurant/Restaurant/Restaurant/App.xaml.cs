﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;

namespace Restaurant
{

    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        public static string ItemImagesDir = Directory.GetCurrentDirectory() + Path.DirectorySeparatorChar + "ItemImages";

        public App()
        {
            if (!Directory.Exists(ItemImagesDir))
                Directory.CreateDirectory(ItemImagesDir);
        }
    }
}
