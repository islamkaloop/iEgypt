using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _5_Apply_New_Request : System.Web.UI.Page
{
    static int contrib_id = -1;
    protected void Page_Load(object sender, EventArgs e)
    {
       
        string sc = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        using (SqlConnection con = new SqlConnection(sc))

        {

            con.Open();
            string code = "select * from Contributor";
            SqlDataAdapter sqlda = new SqlDataAdapter(code, con);
            DataTable dtbl = new DataTable();
            sqlda.Fill(dtbl);
            GridView1.DataSource = dtbl;
            GridView1.DataBind();
        }


    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        
       if (TextBox1.Text == null || TextBox1.Text=="") {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please enter the information.')</script>");

        }
        else {
            string sc = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
            using (SqlConnection con = new SqlConnection(sc))

            {
                //  Apply_New_Request @information, @information, @viewer_id
                SqlCommand cmd = new SqlCommand("Apply_New_Request", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@information", TextBox1.Text);
                if (contrib_id == -1)
                {
                    cmd.Parameters.AddWithValue("@contributor_id", null);
                }
                else { cmd.Parameters.AddWithValue("@contributor_id", contrib_id); }
                cmd.Parameters.AddWithValue("@viewer_id", Session["id"]);
                con.Open();
                cmd.ExecuteNonQuery();
                contrib_id = -1;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('the application is done sucessfully.')</script>");

            }
        }
    }

    protected void link_Click(object sender, EventArgs e)
    {
        contrib_id = Convert.ToInt32((sender as LinkButton).CommandArgument);
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/the viewer page.aspx");
    }
}