using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Configuration;
using System.Data.SqlClient;

namespace Job_Finder_System
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            string str1 = "select * from [User] where [Password] ='" + txtCurrentPwd.Text + "'";
            SqlCommand cmd = new SqlCommand(str1, con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con1.Open();
                string str = "update [User] set [Password]='" + txtNewPwd.Text + "'where Password= '" + txtCurrentPwd.Text + "'";
                SqlCommand cmd1 = new SqlCommand(str, con1);
                cmd1.ExecuteNonQuery();
                Response.Write(@"<script language='javascript'>alert('Your Password has been changed successfully!')</script>");
                con1.Close();
                con.Close();
            }
            else
            {
                Response.Write(@"<script language='javascript'>alert('Your Current Password is incorrect! Please Try Again.')</script>");
            }
        }
    }
}


    