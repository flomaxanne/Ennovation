using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;


namespace Job_Finder_System.Admin
{
    public partial class EditUsers : System.Web.UI.Page
    {
        string CT = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string userID = Request.QueryString["userid"];

                using (SqlConnection cn = new SqlConnection(CT))
                {
                    string query = "Select * from [User] where UserID='" + userID + "'";
                    using (SqlCommand cmd = new SqlCommand(query, cn))
                    {
                        cn.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            txtUserID.Text = userID;
                            txtFirstName.Text = dr["Firstname"].ToString();
                            txtLastName.Text = dr["Lastname"].ToString();
                            txtUserName.Text = dr["Username"].ToString();
                            txtEmail.Text = dr["Email"].ToString();
                            txtRole.Text = dr["Role"].ToString();
                        }
                        cn.Close();
                        cn.Dispose();

                    }
                }
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {


            using (SqlConnection cn = new SqlConnection(CT))
            {
                string query = "Update [User]  Set Firstname='" + txtFirstName.Text + "', Lastname='" + txtLastName.Text +
                    "', Username='" + txtUserName.Text + "', Email='" + txtEmail.Text + "', Role='" + txtRole.Text +
                    "' where UserID='" + txtUserID.Text + "'";



                using (SqlCommand cmd = new SqlCommand(query, cn))
                {
                    cn.Open();
                    cmd.ExecuteNonQuery();

                    cn.Close();
                    cn.Dispose();
                    lblResult.Text = "User Data Saved!!";
                    pnlEdit.Visible = false;
                }
            }

        }
    }
}