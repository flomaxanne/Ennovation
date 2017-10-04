using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Configuration;

using System.Data.SqlClient;
namespace Job_Finder_System
{
   
    public partial class AddAdvertisements : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlConnection con;
        SqlDataAdapter da;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

       

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

          

            int length = Image.PostedFile.ContentLength;
            byte[] pic = new byte[length];


            Image.PostedFile.InputStream.Read(pic, 0, length);

            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();
                cmd = new SqlCommand("INSERT INTO Advertisement (CompanyName, Title, Image) values (@CompanyName,@Title,@Image)", con);

                cmd.Parameters.AddWithValue("@CompanyName", CompanyName.Text);
                cmd.Parameters.AddWithValue("@Title", Title.Text);
                cmd.Parameters.AddWithValue("@Image", pic);
                cmd.ExecuteNonQuery();

                CompanyName.Text = "";
                Title.Text = "";

                Label1.Visible = true;

                Label1.Text = "Image Uploaded Sucessfully";

            }
            finally
            {
                con.Close();
            }

           
        }
    }
}