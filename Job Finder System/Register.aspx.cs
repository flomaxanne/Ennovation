using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Configuration;
using System.Data;
using System.Web.Security;
using System.Xml.Linq;
using System.Data.SqlClient;

namespace Job_Finder_System
{
    public partial class Register : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlConnection con;
        SqlDataAdapter da;

        public object MessageBox { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {

            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int userId = 0;
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Insert_User"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Firstname", firstname.Text.Trim());
                        cmd.Parameters.AddWithValue("@Lastname", lastname.Text.Trim());
                        cmd.Parameters.AddWithValue("@Username", username.Text.Trim());
                        cmd.Parameters.AddWithValue("@Password", password.Text.Trim());
                        cmd.Parameters.AddWithValue("@Email", email.Text.Trim());
                        cmd.Parameters.AddWithValue("@Role", role.SelectedValue.Trim());
                        cmd.Connection = con;
                        con.Open();
                        userId = Convert.ToInt32(cmd.ExecuteScalar());
                        con.Close();
                    }
                }
                string message = string.Empty;
                switch (userId)
                {
                    case -1:
                        message = "Username already exists.\\nPlease choose a different username.";
                        break;
                    case -2:
                        message = "Supplied email address has already been used.";
                        break;
                    default:
                        message = "Registration successful.\\nUser ID: " + userId.ToString();
                        break;
                }
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "');", true);
            }
        }
    }
}