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
            SqlConnection con = new SqlConnection(strConnString);
            con.Open();
            str = "select SeekerID from JobSeekerDetails where Username='" + Session["Username"] + "'";
            com = new SqlCommand(str, con);
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);
            DataTable dt = ds.Tables[0];
            con.Close();

            string seekerId = dt.Rows[0]["SeekerID"].ToString();
            string username = Session["Username"].ToString();
            string posterId = dt.Rows[0]["PosterID"].ToString();

            Response.Redirect("ContactPage.aspx?SeekerID="+seekerId);


   

        }

    }
}