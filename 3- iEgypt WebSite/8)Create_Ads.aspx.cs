using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _11_Create_Ads : System.Web.UI.Page
{
    static int ad_idd = -1;
    protected void Page_Load(object sender, EventArgs e)
    {
       

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox2.Text==""||TextBox2.Text==null)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please enter the description')</script>");

        }
        else if (TextBox3.Text == ""|| TextBox3.Text == null)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please enter the location')</script>");

        }
        else {
            string sc = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
            using (SqlConnection con = new SqlConnection(sc))

            {
                //Create_Ads....@viewer_id,@description, @location
                SqlCommand cmd = new SqlCommand("Create_Ads", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@viewer_id", Session["id"]);
                cmd.Parameters.AddWithValue("@description", TextBox2.Text);
                cmd.Parameters.AddWithValue("@location", TextBox3.Text);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                cmd = new SqlCommand("ad_id", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                SqlParameter output = new SqlParameter();
                output.ParameterName = "@id";
                output.SqlDbType = System.Data.SqlDbType.Int;
                output.Direction = System.Data.ParameterDirection.Output;
                cmd.Parameters.Add(output);

                con.Open();
                cmd.ExecuteNonQuery();
                ad_idd = (int)output.Value;

                Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('the add is done sucessfully.')</script>");




            }
        }
    }



    protected void Button2_Click(object sender, EventArgs e)
    {
        string sc = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        using (SqlConnection con = new SqlConnection(sc))
            if (ad_idd == -1)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please create the ad first.')</script>");

            }
            else
            if (TextBox4.Text == null || TextBox4.Text == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please fill in the link.')</script>");

            }
            else
            {

                {
                    //Create_Ads....@viewer_id,@description, @location
                    SqlCommand cmd = new SqlCommand("Viewer_Upload_ad_Photo", con);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ad_id", ad_idd);
                    cmd.Parameters.AddWithValue("@link", TextBox4.Text);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('the photo was uploaded sucessfully.')</script>");


                }
            }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        string sc = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        using (SqlConnection con = new SqlConnection(sc))
            if (ad_idd == -1)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please create the ad first.')</script>");

            }
            else
            if (TextBox5.Text == null || TextBox5.Text == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please fill in the link.')</script>");

            }
            else
            {

                {
                    //Create_Ads....@viewer_id,@description, @location
                    SqlCommand cmd = new SqlCommand("Viewer_Upload_ad_vedio", con);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ad_id", ad_idd);
                    cmd.Parameters.AddWithValue("@link", TextBox5.Text);

                    con.Open();
                    cmd.ExecuteNonQuery();

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('the video was uploaded sucessfully.')</script>");

                }
            }
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/the viewer page.aspx");
    }
}