using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;

namespace Job_Finder_System
{
    public partial class JobsApplied : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

            //Label1.Text = Session["AdminID"].ToString();

            try
            {
               
                if (!IsPostBack)
                {
                    FillGrid();
                }
            }
            catch
            {

            }
        }

        protected void gvAd_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAd.PageIndex = e.NewPageIndex;
            FillGrid();
        }

        void FillGrid()
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "SELECT * FROM Advertisement INNER JOIN JobApplication ON Advertisement.AdID = JobApplication.AdID Where PosterUsername = '" + Session["Username"] + "'";
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                gvAd.DataSource = ds;
                gvAd.DataBind();
            }
            catch
            {

            }
        }

       
       
       
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
               
                Button btn = sender as Button;
                GridViewRow grow = btn.NamingContainer as GridViewRow;
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "DELETE JobApplication where ID=@ID";
                cmd.Parameters.AddWithValue("@ID", (grow.FindControl("lblID") as Label).Text);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                FillGrid();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Advertisement has been deleted successfully');", true);
            }
            catch
            {

            }
            finally
            {
                if (con.State == ConnectionState.Open)
                    con.Close();
            }
        }

    }
}
