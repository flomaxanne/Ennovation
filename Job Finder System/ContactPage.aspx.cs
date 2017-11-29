using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Job_Finder_System
{
    public partial class ContactPage : System.Web.UI.Page
    {
        string strConnString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strConnString);
            con.Open();


            using (SqlCommand cmd = new SqlCommand("INSERT INTO Contact values (@PosterID, @SeekerID,@Firstname,@Lastname,@Email, @Topic, @Message)", con))
            {
                cmd.Parameters.AddWithValue("PosterID", txtposterID.Value);
                cmd.Parameters.AddWithValue("SeekerID", txtseekerID.Value);
                cmd.Parameters.AddWithValue("Firstname", txtfirstname.Value);
                cmd.Parameters.AddWithValue("Lastname", txtlastname.Value);
                cmd.Parameters.AddWithValue("Email", txtemail.Value);
                cmd.Parameters.AddWithValue("Topic", ddltopic.SelectedIndex);
                cmd.Parameters.AddWithValue("Message", txtmessage.Value);

                cmd.ExecuteNonQuery();
            }
            con.Close();
        }



        public void GetData()
        {
            string Id = Request["Id"].ToString();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select * from Advertisement where AdID = " + Id, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            
            txtposterID.Value = ds.Tables[0].Rows[0]["PosterID"].ToString();
            txtseekerID.Value = ds.Tables[0].Rows[0]["location_id"].ToString();
            txtfirstname.Value = ds.Tables[0].Rows[0][""].ToString();
            txtlastname.Value = ds.Tables[0].Rows[0][5].ToString();
            txtemail.Value = ds.Tables[0].Rows[0][6].ToString();
            
            
        }
    }
}
