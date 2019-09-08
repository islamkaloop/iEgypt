using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class _8_Write_Comment : System.Web.UI.Page
{
    static int content_id = -1;
    protected void Page_Load(object sender, EventArgs e)
    {
      
       
        string sc = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        using (SqlConnection con = new SqlConnection(sc))

        {

            con.Open();
            string code = "select * from Original_Content inner join Content on Original_Content.id=Content.id";
            SqlDataAdapter sqlda = new SqlDataAdapter(code, con);
            DataTable dtbl = new DataTable();
            sqlda.Fill(dtbl);
            GridView1.DataSource = dtbl;
            GridView1.DataBind();
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        string sc = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        using (SqlConnection con = new SqlConnection(sc))

        {
            if (content_id == -1)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please select content.')</script>");

            }
            else if (TextBox1.Text==null||TextBox1.Text=="")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please enter the comment.')</script>");

            }
            
            else {
                SqlCommand cmd = new SqlCommand("Write_Comment", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@comment_text", TextBox1.Text);
                cmd.Parameters.AddWithValue("@viewer_id", Session["id"]);
                cmd.Parameters.AddWithValue("@original_content_id", content_id);
                cmd.Parameters.AddWithValue("@written_time",Convert.ToString( DateTime.Now));
                con.Open();
                cmd.ExecuteNonQuery();
                content_id = -1;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('the comment is uploaded sucessfully.')</script>");

            }
        }
    }

    protected void link_Click(object sender, EventArgs e)
    {
        content_id = Convert.ToInt32((sender as LinkButton).CommandArgument);
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/the viewer page.aspx");
    }
}