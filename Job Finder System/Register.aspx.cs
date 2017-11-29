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
        string strConnString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
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
                        cmd.Parameters.AddWithValue("@Firstname", txtFirstName.Text.Trim());
                        cmd.Parameters.AddWithValue("@Lastname", txtLastName.Text.Trim());
                        cmd.Parameters.AddWithValue("@Username", txtUserName.Text.Trim());
                        cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                        cmd.Parameters.AddWithValue("@Role", ddlUserRole.SelectedValue.Trim());

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
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + message + "');", true);
                        break;
                    case -2:
                        message = "Supplied email address has already been used.";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + message + "');", true);
                        break;
                    default:
                        message = "You have successfully registered!\\nUser ID: " + userId.ToString();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + message + "');window.location ='Login.aspx';", true);
                        break;
                }
                //ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "');", true);
            }
        }
    }
}