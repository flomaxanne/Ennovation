using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using System.IO;
using System.Text;
using System.Security.Cryptography;

namespace Job_Finder_System
{
    public partial class ForgetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string Username = "";
            string Password = "";
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("SELECT [Username], [Password] FROM [User] where Email=@Email", con);
            cmd.Parameters.AddWithValue("Email", txtEmail.Text);
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                if (sdr.Read())
                {
                    Username = sdr["Username"].ToString();
                    Password = sdr["Password"].ToString();
                }
            }
            con.Close();

            string message = string.Empty;

            if (!string.IsNullOrEmpty(Password))
            {
                MailMessage msg = new MailMessage();
                msg.From = new MailAddress("aisinwee95@hotmail.com");
                msg.To.Add(txtEmail.Text);
                msg.Subject = " Recover your Password";
                msg.Body = ("<b>Your Username is: </b>" + Username + "<br/><br/>" + "<b>Your Password is: </b>" + Password);
                msg.IsBodyHtml = true;
                SmtpClient smt = new SmtpClient();
                smt.Host = "smtp.live.com";
                System.Net.NetworkCredential ntwd = new NetworkCredential();
                ntwd.UserName = "aisinwee95@hotmail.com"; //Your Email ID  
                ntwd.Password = "sinsin95"; // Your Password  
                smt.UseDefaultCredentials = true;
                smt.Credentials = ntwd;
                smt.Port = 587;
                smt.EnableSsl = true;
                smt.Send(msg);
                message = "Username and Password has been sent to your mailbox successfully!";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + message + "');window.location ='Login.aspx';", true);
            }
            else
            {
                Response.Write("<script>alert('Email you entered does not exist');</script>");
            }
        }

    }
}