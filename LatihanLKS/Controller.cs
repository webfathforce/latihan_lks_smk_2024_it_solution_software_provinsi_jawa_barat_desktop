using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using static LatihanLKS.ModelBase;

namespace LatihanLKS
{
    public class Controller
    {
        public static void message(string message)
        {
            MessageBox.Show(message);
        }

        public static string confirm(string message_text, string name_dialog = "Confirmation")
        {
            MessageBoxResult result = MessageBox.Show(message_text, name_dialog, MessageBoxButton.YesNo);
            return result.ToString();
        }

        public static void authentication(string username, string password)
        {
            
        }
    }
}
