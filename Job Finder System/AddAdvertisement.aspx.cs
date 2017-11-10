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
    public partial class AddAdvertisement : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

            //Label1.Text = Session["AdminID"].ToString();

            try
            {
                txtTitle.Focus();
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
                cmd.CommandText = "Select * from Advertisement";
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

        void ClearControls()
        {
            try
            {
                txtTitle.Text = "";
                txtCompany.Text = "";
                txtSkills.Text = "";
                txtLocation.Text = "";
                txtPay.Value = "";
                datetimepickerfrom.Value = "";
                datetimepickerto.Value = "";
                datetimepickerdate.Value = "";
                txtUserName.Text = "";
                hidAdID.Value = "";
                btnSave.Visible = true;
                btnUpdate.Visible = false;
            }
            catch
            {

                throw;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string filePath = string.Empty;
            string ImgPath = string.Empty;
            string DbImgPath = string.Empty;

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "insert into Advertisement (Title,CompanyName,SkillsRequired,Location,Pay,TimeFrom,TimeTo,DateDetails,Username,Image) values (@Title,@CompanyName,@SkillsRequired,@Location,@Pay,@TimeFrom,@TimeTo,@DateDetails,@Username,@Image)";
                cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
                cmd.Parameters.AddWithValue("@CompanyName", txtCompany.Text);
                cmd.Parameters.AddWithValue("@SkillsRequired", txtSkills.Text);
                cmd.Parameters.AddWithValue("@Location", txtLocation.Text);
                cmd.Parameters.AddWithValue("@Pay", txtPay.Value);
                cmd.Parameters.AddWithValue("@TimeFrom", datetimepickerfrom.Value);
                cmd.Parameters.AddWithValue("@TimeTo", datetimepickerto.Value);
                cmd.Parameters.AddWithValue("@DateDetails", datetimepickerdate.Value);
                cmd.Parameters.AddWithValue("@Username", txtUserName.Text);

                if (FileUpload.HasFile)
                {
                    ImgPath = (Server.MapPath("~/Images/") + Guid.NewGuid() + FileUpload.FileName);
                    FileUpload.SaveAs(ImgPath);

                    DbImgPath = ImgPath.Substring(ImgPath.LastIndexOf("\\"));
                    DbImgPath = DbImgPath.Insert(0, "Images");
                    cmd.Parameters.AddWithValue("@Image", DbImgPath);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Image", string.Empty);
                }
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                FillGrid();
                ClearControls();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Advertisement has been saved successfully');", true);
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

        protected void btnClear_Click(object sender, EventArgs e)
        {
            try
            {
                ClearControls();
            }
            catch
            {

            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            try
            {
                ClearControls();
                Button btn = sender as Button;
                GridViewRow grow = btn.NamingContainer as GridViewRow;
                hidAdID.Value = (grow.FindControl("lblAdID") as Label).Text;
                txtTitle.Text = (grow.FindControl("lblTitle") as Label).Text;
                txtCompany.Text = (grow.FindControl("lblCompany") as Label).Text;
                txtSkills.Text = (grow.FindControl("lblSkills") as Label).Text;
                txtLocation.Text = (grow.FindControl("lblLocation") as Label).Text;
                txtPay.Value = (grow.FindControl("lblPay") as Label).Text;
                datetimepickerfrom.Value = (grow.FindControl("lblTimefrom") as Label).Text;
                datetimepickerto.Value = (grow.FindControl("lblTimeto") as Label).Text;
                datetimepickerdate.Value = (grow.FindControl("lblDatedetails") as Label).Text;
                txtUserName.Text = (grow.FindControl("lblUsername") as Label).Text;
                btnSave.Visible = false;
                btnUpdate.Visible = true;
            }
            catch
            {

            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string filePath = string.Empty;
            string ImgPath = string.Empty;
            string DbImgPath = string.Empty;

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "update Advertisement set Title=@Title,CompanyName=@CompanyName,SkillsRequired=@SkillsRequired,Location=@Location,Pay=@Pay,TimeFrom=@TimeFrom,TimeTo=@TimeTo,DateDetails=@DateDetails,Username=@Username,Image=@Image where AdID=@AdID";
                cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
                cmd.Parameters.AddWithValue("@CompanyName", txtCompany.Text);
                cmd.Parameters.AddWithValue("@SkillsRequired", txtSkills.Text);
                cmd.Parameters.AddWithValue("@Location", txtLocation.Text);
                cmd.Parameters.AddWithValue("@Pay", txtPay.Value);
                cmd.Parameters.AddWithValue("@TimeFrom", datetimepickerfrom.Value);
                cmd.Parameters.AddWithValue("@TimeTo", datetimepickerto.Value);
                cmd.Parameters.AddWithValue("@DateDetails", datetimepickerdate.Value);
                cmd.Parameters.AddWithValue("@Username", txtUserName.Text);
                cmd.Parameters.AddWithValue("@AdID", hidAdID.Value);
                if (FileUpload.HasFile)
                {
                    ImgPath = (Server.MapPath("~/Images/") + Guid.NewGuid() + FileUpload.FileName);
                    FileUpload.SaveAs(ImgPath);

                    DbImgPath = ImgPath.Substring(ImgPath.LastIndexOf("\\"));
                    DbImgPath = DbImgPath.Insert(0, "Images");
                    cmd.Parameters.AddWithValue("@Image", DbImgPath);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Image", string.Empty);
                }
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                FillGrid();
                ClearControls();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Advertisement has been updated successfully');", true);
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

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                ClearControls();
                Button btn = sender as Button;
                GridViewRow grow = btn.NamingContainer as GridViewRow;
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "DELETE Advertisement where AdID=@AdID";
                cmd.Parameters.AddWithValue("@AdID", (grow.FindControl("lblAdID") as Label).Text);
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
