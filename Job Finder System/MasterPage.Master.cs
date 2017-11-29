using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Job_Finder_System
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {

        protected void Page_Init(object sender, EventArgs e)
        {
            Page.EnableEventValidation = false;
        }

        protected void Page_Load(object sender, EventArgs e)
        {

                if (Session["Username"] != null)
                {
                    loginmenu.Visible = false;
                    registrationmenu.Visible = false;
                    jobsapplied.Visible = false;


            }


            if (Session["Role"] == null)
            {
                addadvertisement.Visible = false;
                jobsapplied.Visible = false;
                editusers.Visible = false;
            }

            else if (Session["Role"].ToString()=="Poster")
            {
                jobposter_userdetails.Visible = true;
                jobseeker_userdetails.Visible = false;
                addadvertisement.Visible = true;
                jobsapplied.Visible = false;
                editusers.Visible = false;
            }
             else if (Session["Role"].ToString()=="Seeker")
                {
                    jobseeker_userdetails.Visible = true;
                    jobposter_userdetails.Visible = false;
                   addadvertisement.Visible = false;
                jobsapplied.Visible = true;
                editusers.Visible = false;
            }

            if (Session["Username"] != null)
            {
                lblUsername.Text = Session["Username"].ToString();
                userlogindetail.Visible = true;
                userlogout.Visible = true;
            }
            else
            {
                userlogout.Visible = false;
                userlogindetail.Visible = false;
                userdetailmenu.Visible = false;
            }
        }
        

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("Home.aspx");
        }
    }
    }

