using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace Job_Finder_System
{
    public partial class ViewAdvertisement : System.Web.UI.Page
    {
        string strConnString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string str;
        SqlCommand com;
        protected void Page_Load(object sender, EventArgs e)
        {
            GetData();
           

        }

        public void GetData()
        {
            string Id = Request["Id"].ToString();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select * from Advertisement where AdID = " + Id, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            Image1.ImageUrl = ds.Tables[0].Rows[0][3].ToString();
            Literal1.Text = ds.Tables[0].Rows[0][1].ToString();
            Literal2.Text = ds.Tables[0].Rows[0][2].ToString();
            Literal3.Text = ds.Tables[0].Rows[0][4].ToString();
            Literal4.Text = ds.Tables[0].Rows[0][5].ToString();
            Literal5.Text = ds.Tables[0].Rows[0][6].ToString();
            Literal6.Text = ds.Tables[0].Rows[0][7].ToString();
            Literal7.Text = ds.Tables[0].Rows[0][8].ToString();
            Literal8.Text = ds.Tables[0].Rows[0][9].ToString();
            Literal9.Text = ds.Tables[0].Rows[0][10].ToString();
        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
  

            string Id = Request["Id"].ToString();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Advertisement where AdID = " + Id, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
          
            string adID  = ds.Tables[0].Rows[0][0].ToString();
            string posterUsername= Literal9.Text = ds.Tables[0].Rows[0][10].ToString();


            using (SqlCommand command = new SqlCommand("INSERT INTO JobApplication values (@SeekerUsername, @PosterUsername, @AdID)", con))
            {
                command.Parameters.AddWithValue("SeekerUsername", Session["Username"].ToString());
                command.Parameters.AddWithValue("PosterUsername", posterUsername);
                command.Parameters.AddWithValue("AdID", adID);

                command.ExecuteNonQuery();
                lblsuccess.Visible = true;
                lblsuccess.Text = Session["Username"].ToString() + ", Job successfully applied!";



            }



           


            con.Close();




   

        }

    }
}