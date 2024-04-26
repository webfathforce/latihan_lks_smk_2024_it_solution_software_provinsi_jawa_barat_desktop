using LatihanLKS.Properties;
using System.Data.SqlClient;
using static LatihanLKS.Controller;

namespace LatihanLKS
{
    internal class ModelBase
    {
        public static string connection(string status)
        {
            SqlConnection conn = new SqlConnection(Settings.Default.conString);
            if (status ==  null)
            {
                conn.Open();
                return "Connection Test was Successfully!";
                conn.Close();
            }else if (status == "open")
            {
                conn.Open();
                return "Connection Opened!";
            }
            else if (status == "close")
            {
                conn.Close();
                return "Connection Closed!";
            }
            return "";
        }

        /*public static void querry(string status)
        {
            query
        }*/
    }
}