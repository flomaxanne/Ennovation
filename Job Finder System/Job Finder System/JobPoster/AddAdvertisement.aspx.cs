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
    public partial class AddAdvertisement : System.Web.UI.Page
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

            int length = fuAdImage.PostedFile.ContentLength;
            byte[] pic = new byte[length];
            fuAdImage.PostedFile.InputStream.Read(pic, 0, length);

           

            SqlConnection con = new SqlConnection(strConnString);
            con.Open();

            try
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Advertisement (CompanyName, Title, Image,Location,Pay,SkillsRequired,TimeFrom,TimeTo,Username,DateDetails) values (@CompanyName,@Title,@Image,@Location,@Pay,@SkillsRequired,@TimeFrom,@TimeTo,@Username,@DateDetails)", con))
                {

                   

                    cmd.Parameters.AddWithValue("@CompanyName", txtCompanyName.Text);
                    cmd.Parameters.AddWithValue("@Title", txtAdTitle.Text);
                    cmd.Parameters.AddWithValue("@Image", pic);
                    cmd.Parameters.AddWithValue("@Location", txtAdLocation.Text);
                    cmd.Parameters.AddWithValue("@Pay", txtPay.ToString());
                    cmd.Parameters.AddWithValue("@SkillsRequired", txtSkillsRequired.Text);
                    cmd.Parameters.Add("@TimeFrom", datetimepickerfrom.ToString());
                    cmd.Parameters.Add("@TimeTo", datetimepickerto.ToString());
                    cmd.Parameters.AddWithValue("@Username", txtUserName.ToString());
                    cmd.Parameters.Add("@DateDetails", datetimepickerdate.ToString());

                    cmd.ExecuteNonQuery();


                    lblsuccess.Visible = true;

                    lblsuccess.Text = "Advertisement Uploaded Sucessfully";

                }
            }
            finally
            {
                con.Close();
            }


        }
    }
}