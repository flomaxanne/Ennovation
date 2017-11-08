using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Text.RegularExpressions;

namespace Job_Finder_System.JobPoster
{
    public partial class AddAdvertisement : System.Web.UI.Page
    {
        string strConnString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string str;
        SqlCommand com;

        protected void Page_Load(object sender, EventArgs e)
        {
            BindGrid();

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
            string query = "INSERT INTO Advertisement (CompanyName, Title, Image,Location,Pay,SkillsRequired,TimeFrom,TimeTo,DateDetails,Username) values (@CompanyName,@Title,@Image,@Location,@Pay,@SkillsRequired,@TimeFrom,@TimeTo,@DateDetails,@Username)";
           

            try
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();

                    cmd.Parameters.AddWithValue("@CompanyName", txtCompanyName.Text);
                    cmd.Parameters.AddWithValue("@Title", txtAdTitle.Text);
                    cmd.Parameters.AddWithValue("@Image", pic);
                    cmd.Parameters.AddWithValue("@Location", txtAdLocation.Text);
                    cmd.Parameters.AddWithValue("@Pay", txtPay.Value);
                    cmd.Parameters.AddWithValue("@SkillsRequired", txtSkillsRequired.Text);
                    cmd.Parameters.AddWithValue("@TimeFrom", datetimepickerfrom.Value);
                    cmd.Parameters.AddWithValue("@TimeTo", datetimepickerto.Value);
                    cmd.Parameters.AddWithValue("@DateDetails",datetimepickerdate.Value);
                    cmd.Parameters.AddWithValue("@Username", txtUserName.Text);


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


        private DataTable GetAdvertisementRecords()
        {
            SqlConnection conn = new SqlConnection(strConnString);
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Select * from Advertisement";

            SqlDataAdapter dAdapter = new SqlDataAdapter();
            dAdapter.SelectCommand = cmd;
            DataSet objDs = new DataSet();
            dAdapter.Fill(objDs);
            return objDs.Tables[0];

        }

        public static DataTable dt;
  
        protected void DeleteAdvertisement(object sender, EventArgs e)
        {
            LinkButton lnkRemove = (LinkButton)sender;
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "delete from Advertisement where AdID=@AdID";
            cmd.Parameters.Add("@AdvID", SqlDbType.VarChar).Value = lnkRemove.CommandArgument;
            AdvertisementGridView.DataSource = GetData(cmd);
            BindGrid();
        }

        private void BindGrid()
        {
            DataTable dt = GetAdvertisementRecords();

            if (dt.Rows.Count > 0)
            {
                AdvertisementGridView.DataSource = dt;
                AdvertisementGridView.DataBind();
            }
        }

        private DataTable GetData(SqlCommand cmd)
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(strConnString);
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

        private void SearchText()
        {
            DataTable dt = GetAdvertisementRecords();
            DataView dv = new DataView(dt);
            string SearchExpression = null;
            if (!String.IsNullOrEmpty(txtsearchterm.Text))
            {
                SearchExpression = string.Format("{0} '%{1}%'",
                AdvertisementGridView.SortExpression, txtsearchterm.Text);

            }

            dv.RowFilter = "Title like" + SearchExpression;
            AdvertisementGridView.DataSource = dv;
            AdvertisementGridView.DataBind();

        }


        public string ReplaceKeyWords(Match m)
        {

            return "<span class=highlight>" + m.Value + "</span>";

        }



        protected void txtsearchterm_TextChanged(object sender, EventArgs e)
        {

            SearchText();
        }

        protected void btnsearch_click(object sender, EventArgs e)
        {

            SearchText();
        }

    }
}



