using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace AssetMgtSystem
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //SqlConnection conn = new SqlConnection();
            //conn.ConnectionString =
            //  "Data Source=lOCALHOST;" +
            //  "Initial Catalog=AMS;" +
            //  "User id=DESKTOP-EID8M0R;" +
            //  "Password=Brightsoft@20;";
            //conn.Open();

            //SqlCommand command;
            //SqlDataReader dataReader;
            //String sql, Output = "";
            //sql = "select Username,Password from User";
            //command = new SqlCommand(sql, conn);
            //dataReader = command.ExecuteReader();
            //while (dataReader.Read())
            //{
            //    Output = Output + dataReader.GetValue(0) + "" + dataReader.GetValue(1) + "\n";

            //}


            SqlConnection _connection = new SqlConnection(
            ConfigurationManager.ConnectionStrings["AMS"].ToString());

            try
            {
                if (_connection.State == ConnectionState.Closed)
                    _connection.Open();
            }
            catch { }
        }
    
        
    }
}