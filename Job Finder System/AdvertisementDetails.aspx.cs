using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace Job_Finder_System.Admin
{
    public partial class AdvertisementDetails : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            BindGrid();
        }


        public string conString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        private DataTable GetUserRecords()
        {
            SqlConnection conn = new SqlConnection(conString);
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Select * from [User]";

            SqlDataAdapter dAdapter = new SqlDataAdapter();
            dAdapter.SelectCommand = cmd;
            DataSet objDs = new DataSet();
            dAdapter.Fill(objDs);
            return objDs.Tables[0];

        }

        public static DataTable dt;
        protected void DeleteUser(object sender, EventArgs e)
        {
            LinkButton lnkRemove = (LinkButton)sender;
            SqlConnection con = new SqlConnection(conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "delete from [User] where UserID=@UserID";
            cmd.Parameters.Add("@ID", SqlDbType.VarChar).Value = lnkRemove.CommandArgument;
            AdvertisementGridView.DataSource = GetData(cmd);
            BindGrid();
        }



        private void BindGrid()
        {
            DataTable dt = GetUserRecords();

            if (dt.Rows.Count > 0)
            {
                AdvertisementGridView.DataSource = dt;
                AdvertisementGridView.DataBind();
            }
        }

        private DataTable GetData(SqlCommand cmd)
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(conString);
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            con.Open();
            sda.SelectCommand = cmd;
            sda.Fill(dt);
            return dt;
        }


        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            AdvertisementGridView.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            AdvertisementGridView.DataBind();
        }



    }
}