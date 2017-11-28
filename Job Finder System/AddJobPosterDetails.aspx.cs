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

namespace Job_Finder_System.JobPoster
{
    public partial class AddJobPosterDetails : System.Web.UI.Page
    {

        string strConnString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string str;
        SqlCommand com;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

            SqlConnection con = new SqlConnection(strConnString);
            con.Open();
            str = "select * from [User] where Username='" + Session["Username"] + "'";
            com = new SqlCommand(str, con);
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);
            txtUserName.Text = ds.Tables[0].Rows[0]["UserName"].ToString();

        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int length = fuPosterImage.PostedFile.ContentLength;
            byte[] pic = new byte[length];
            fuPosterImage.PostedFile.InputStream.Read(pic, 0, length);


            SqlConnection con = new SqlConnection(strConnString);
            con.Open();
         
                using (SqlCommand cmd = new SqlCommand("INSERT INTO JobPosterDetails values (@ContactNo, @Address, @Image, @State,@Username)", con))
                {
                    cmd.Parameters.AddWithValue("ContactNo", txtContactNumber.Text);
                    cmd.Parameters.AddWithValue("Address", txtAddress.Text);
                    cmd.Parameters.AddWithValue("Image", pic);
                    cmd.Parameters.AddWithValue("State", ddlState.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("Username", txtUserName.Text);
                    cmd.ExecuteNonQuery();

                    Response.Redirect("/Home.aspx");
            }

            con.Close();
            }

            
        }

    }

