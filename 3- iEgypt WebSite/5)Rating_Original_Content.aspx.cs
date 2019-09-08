using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _7_Rating_Original_Content : System.Web.UI.Page
{
    static int content_id = -1;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        string sc = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        using (SqlConnection con = new SqlConnection(sc))

        {

            con.Open();
            string code = "select * from Original_Content inner join Content on Original_Content.id = Content.id ";
            SqlDataAdapter sqlda = new SqlDataAdapter(code, con);
            DataTable dtbl = new DataTable();
            sqlda.Fill(dtbl);
            GridView1.DataSource = dtbl;
            GridView1.DataBind();
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (content_id == -1)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please select content(s)')</script>");
        }
        else if (TextBox2.Text==null||TextBox2.Text=="" ||Convert.ToInt32 (TextBox2.Text)<0|| Convert.ToInt32(TextBox2.Text)>5)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please insert rating value beteen 0 and 5')</script>");

        }
        else {
            string sc = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
            using (SqlConnection con = new SqlConnection(sc))

            {

                SqlCommand cmd = new SqlCommand("Rating_Original_Content ", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@orignal_content_id", content_id);
                cmd.Parameters.AddWithValue("@rating_value", TextBox2.Text);
                cmd.Parameters.AddWithValue("@viewer_id", Session["id"]);
                con.Open();
                cmd.ExecuteNonQuery();
                content_id = -1;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('rating is done sucessfully')</script>");

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