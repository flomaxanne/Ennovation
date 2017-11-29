using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Xml.Linq;
using System.Data.SqlClient;

namespace Job_Finder_System
{
    public partial class Login : System.Web.UI.Page
    {
        string strConnString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string str, Username, Password, Role, posterdetailstr, seekerdetailstr;
        SqlCommand com,check_posterdetails,check_seekerdetails;
        SqlDataAdapter sqlda;
        DataTable dt;
        int RowCount;

        MasterPage p1 = new MasterPage();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            SqlConnection con = new SqlConnection(strConnString);
            con.Open();
            str = "select * from [User]";
            com = new SqlCommand(str);
            sqlda = new SqlDataAdapter(com.CommandText, con);
            dt = new DataTable();
            sqlda.Fill(dt);
            RowCount = dt.Rows.Count;
            for (int i = 0; i < RowCount; i++)
            {
              
                Username = dt.Rows[i]["Username"].ToString();
                Password = dt.Rows[i]["Password"].ToString();
                Role = dt.Rows[i]["Role"].ToString();
               
                if (Username == txtUserName.Text && Password == txtPwd.Text)
                {

                    Session["Username"] = Username;
                    Session["Role"] = Role;
                    if (dt.Rows[i]["Role"].ToString() == "Admin")
                    {
                        Response.Redirect("Users.aspx");
                    }

                    else if (dt.Rows[i]["Role"].ToString() == "Poster")
                    {

                        posterdetailstr = "SELECT COUNT(*) FROM JobPosterDetails WHERE Username='" + Session["Username"] + "'";
                        check_posterdetails = new SqlCommand(posterdetailstr, con);
                        int PosterDetailsExist = (int)check_posterdetails.ExecuteScalar();

                        if (PosterDetailsExist > 0)
                        {
                            Response.Redirect("AddAdvertisement.aspx");
                        }
                        else
                        {
                            Response.Redirect("AddJobPosterDetails.aspx");
                        }

                    }
                    else if (dt.Rows[i]["Role"].ToString() == "Seeker")

                    {
                        seekerdetailstr = "SELECT COUNT(*) FROM JobSeekerDetails WHERE Username='" + Session["Username"] + "'";
                        check_seekerdetails = new SqlCommand(seekerdetailstr, con);
                        int SeekerDetailsExist = (int)check_seekerdetails.ExecuteScalar();

                        if (SeekerDetailsExist > 0)
                        {
                            Response.Redirect("Home.aspx");
                        }
                        else
                        {
                            Response.Redirect("AddJobSeekerDetails.aspx");
                        }
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your credentials in incorrect!')", true);
                }

                
            }

        }
    }
}