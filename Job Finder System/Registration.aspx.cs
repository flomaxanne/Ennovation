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
    public partial class Registration : System.Web.UI.Page
    {

        string strConnString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {


            SqlConnection con = new SqlConnection(strConnString);
            con.Open();
            bool exists = false;

            // create a command to check if the username exists
            using (SqlCommand cmd = new SqlCommand("select count(*) from [User] where Username = @Username", con))
            {
                cmd.Parameters.AddWithValue("Username", txtUserName.Text);
                exists = (int)cmd.ExecuteScalar() > 0;
            }

            // if exists, show a message error
            lblMessage.Visible = false;
            checkusername.Visible = false;
            if (exists)
            {
                lblMessage.Visible = true;
                lblMessage.Text = "This username has been using by another user";

            }
            else
            {
                // does not exists, so, persist the user
                using (SqlCommand cmd = new SqlCommand("INSERT INTO [User] values (@Firstname, @Lastname, @Username, @Password, @Email, @Role, @LastLogin)", con))
                {
                    cmd.Parameters.AddWithValue("Firstname", txtFirstName.Text);
                    cmd.Parameters.AddWithValue("Lastname", txtLastName.Text);
                    cmd.Parameters.AddWithValue("Username", txtUserName.Text);
                    cmd.Parameters.AddWithValue("Password", txtPassword.Text);
                    cmd.Parameters.AddWithValue("Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("Role", ddlUserRole.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("LastLogin", DateTime.Now);

                    cmd.ExecuteNonQuery();

                    Response.Redirect("Login.aspx");
                }
            }

            con.Close();
        }

        protected void txtUserName_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtUserName.Text))
            {
                SqlConnection con = new SqlConnection(strConnString);
                con.Open();
                bool exists = false;

                // create a command to check if the username exists
                using (SqlCommand cmd = new SqlCommand("select count(*) from [User] where Username = @Username", con))
                {
                    cmd.Parameters.AddWithValue("Username", txtUserName.Text);
                    exists = (int)cmd.ExecuteScalar() > 0;
                }

                checkusername.Visible = false;
                if (exists)
                {
                    checkusername.Visible = true;
                    imgstatus.ImageUrl = "Images/NotAvailable.jpg";
                    lblStatus.Text = "Sorry, username is already taken";
                    
                }
                else
                {
                    checkusername.Visible = true;
                    imgstatus.ImageUrl = "Images/Icon_Available.gif";
                    lblStatus.Text = "Username is available";
                    
                }
            }
            
        }
    }
}





            
