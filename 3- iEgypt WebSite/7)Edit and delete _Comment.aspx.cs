using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _9_Edit_Comment : System.Web.UI.Page
{
    static int oc_id = -1;
    protected void Page_Load(object sender, EventArgs e)
    {
       
        string sc = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        using (SqlConnection con = new SqlConnection(sc))

        {

            con.Open();
            string code = "select * from comment inner join Original_Content on comment.original_content_id=Original_Content.id inner join Content on Original_Content.id=Content.id";
            SqlDataAdapter sqlda = new SqlDataAdapter(code, con);
            DataTable dtbl = new DataTable();
            sqlda.Fill(dtbl);
            GridView1.DataSource = dtbl;
            GridView1.DataBind();
        }
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        if (oc_id == -1)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please select the content.')</script>");

        }
        else if (TextBox2.Text==null||TextBox2.Text=="") {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please enter the last written time')</script>");

        }
        else if (TextBox1.Text == null || TextBox1.Text == "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please enter the updated comment')</script>");

        }
        else {
            string sc = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
            using (SqlConnection con = new SqlConnection(sc))

            {
                //Edit_Comment @comment_text, @viewer_id, @original_content_id, @last_written_time, @updated_written_time’
                SqlCommand cmd = new SqlCommand("Edit_Comment", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@comment_text", TextBox1.Text);
                cmd.Parameters.AddWithValue("@viewer_id", Session["id"]);
                cmd.Parameters.AddWithValue("@original_content_id", oc_id);
                cmd.Parameters.AddWithValue("@last_written_time", Convert.ToDateTime(TextBox2.Text) );
                cmd.Parameters.AddWithValue("@updated_written_time", DateTime.Now);
                con.Open();
                cmd.ExecuteNonQuery();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('the update is done sucessfully')</script>");
                oc_id = -1;
                Response.Redirect(Request.Url.AbsoluteUri);

            }
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (oc_id == -1)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please select the content.')</script>");

        }
        else if (TextBox2.Text == null || TextBox2.Text == "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please enter the last written time')</script>");

        }
        else
        {
            string sc = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
            using (SqlConnection con = new SqlConnection(sc))

            {
                // Delete_Comment @viewer_id, @original_content_id,@written_time

                SqlCommand cmd = new SqlCommand("Delete_Comment", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@viewer_id", Session["id"]);
                cmd.Parameters.AddWithValue("@original_content_id", oc_id);
                cmd.Parameters.AddWithValue("@written_time", Convert.ToDateTime(TextBox2.Text));
                con.Open();
                cmd.ExecuteNonQuery();
                Response.Redirect(Request.Url.AbsoluteUri);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('the comment is deleted successfully')</script>");
                oc_id = -1;
                Response.Redirect(Request.Url.AbsoluteUri);


            }
        }
    }
    protected void link_Click(object sender, EventArgs e)
    {
       oc_id= Convert.ToInt32((sender as LinkButton).CommandArgument);
    }


    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/the viewer page.aspx");
    }
}