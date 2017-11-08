using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace Job_Finder_System
{
    public partial class JobApplication : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string AdId = Request["AdId"].ToString();
            string PosterId = Request["PosterId"].ToString();

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select * from Advertisement where AdID = " + AdId, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            
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
    }
}