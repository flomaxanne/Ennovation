using System;
using System.Collections.Generic;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

namespace Job_Finder_System
{
    public partial class JobPosterUserDetails : System.Web.UI.Page
    {
        string strConnString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string str;
        SqlCommand com;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
                SqlConnection con = new SqlConnection(strConnString);
                con.Open();
                str = "Select * from JobPosterDetails where Username='" + Session["Username"] + "'";
                com = new SqlCommand(str, con);
                SqlDataAdapter da = new SqlDataAdapter(com);
                DataSet ds = new DataSet();
                da.Fill(ds);
                txtContactNumber.Text = ds.Tables[0].Rows[0]["ContactNo"].ToString();
                txtAddress.Text = ds.Tables[0].Rows[0]["Address"].ToString();
                ddlState.Text = ds.Tables[0].Rows[0]["State"].ToString();
                txtUsername.Text = ds.Tables[0].Rows[0]["Username"].ToString();

            }
        }





        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

            using (SqlConnection cn = new SqlConnection(strConnString))
            {
                string query = "Update JobPosterDetails  Set ContactNo='" + txtContactNumber.Text + "', Address='" + txtAddress.Text + "', Image='" + fuPosterImage.ToString() +
                     "', State='" + ddlState.SelectedValue.ToString() +
                     "' where Username='" + Session["Username"] + "'";

                using (SqlCommand cmd = new SqlCommand(query, cn))
                {
                    cn.Open();
                    cmd.ExecuteNonQuery();

                    cn.Close();
                    cn.Dispose();

                }
            }

        }
    }
}
    