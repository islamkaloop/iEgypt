using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _12_Edit_Ad : System.Web.UI.Page
{
    static int ad_id = -1;
    protected void Page_Load(object sender, EventArgs e)
    {
        string sc = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        using (SqlConnection con = new SqlConnection(sc))

        {

            con.Open();
            string code = "select * from advertisement";
            SqlDataAdapter sqlda = new SqlDataAdapter(code, con);
            DataTable dtbl = new DataTable();
            sqlda.Fill(dtbl);
            GridView1.DataSource = dtbl;
            GridView1.DataBind();
        }


    }

    protected void Button1_Click(object sender, EventArgs e)
    {
            if (ad_id == -1)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please select the add first')</script>");

            }
        string sc = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        using (SqlConnection con = new SqlConnection(sc))

        {
            if (ad_id == -1) {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please select the ad first .')</script>");
            }
            else if (TextBox2.Text == "" || TextBox2.Text == null) {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('pleasee enter the description ')</script>");

            }
            else if (TextBox3.Text == "" || TextBox3.Text == null) {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please entere the location')</script>");

            }
            else
            {
                //Edit_Ad @ad_id,@description, @location
                SqlCommand cmd = new SqlCommand("Edit_Ad", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ad_id", ad_id);
                cmd.Parameters.AddWithValue("@description", TextBox2.Text);
                cmd.Parameters.AddWithValue("@location", TextBox3.Text);
                con.Open();
                cmd.ExecuteNonQuery();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('the ad was updated sucessfully.')</script>");
                ad_id = -1;

                Response.Redirect(Request.Url.AbsoluteUri);


            }
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {

        if (ad_id == -1)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please select the ad first')</script>");

        }
        else { 
        string sc = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        using (SqlConnection con = new SqlConnection(sc))

        {
            //Delete_Ads @ad_id’.
            SqlCommand cmd = new SqlCommand("Delete_Ads ", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ad_id", ad_id);

            con.Open();
            cmd.ExecuteNonQuery();
            ad_id = -1;

            Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('the ad was deleted sucessfully.')</script>");
            Response.Redirect(Request.Url.AbsoluteUri);

        }
    }
    }
    protected void link_Click(object sender, EventArgs e)
    {
        ad_id = Convert.ToInt32((sender as LinkButton).CommandArgument);

    }


    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/the viewer page.aspx");
    }
}