using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _6_Delete_New_Request : System.Web.UI.Page
{
    static int rqst = -1;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        string sc = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        using (SqlConnection con = new SqlConnection(sc))

        {

            con.Open();
            string code = "select id,accept_status,specified,information from New_Request where accept_status = 0";
            SqlDataAdapter sqlda = new SqlDataAdapter(code, con);
            DataTable dtbl = new DataTable();
            sqlda.Fill(dtbl);
            GridView1.DataSource = dtbl;
            GridView1.DataBind();
        }


    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (rqst == -1)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please select request(s) to delete ')</script>");
        }
        else
        {
            string sc = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
            using (SqlConnection con = new SqlConnection(sc))

            {

                SqlCommand cmd = new SqlCommand("Delete_New_Request ", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@request_id", rqst);

                con.Open();
                cmd.ExecuteNonQuery();
                rqst = -1;
                Response.Redirect(Request.Url.AbsoluteUri);

                Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('deletion done sucessfully .')</script>");

            }
        }
    }

    protected void link_Click(object sender, EventArgs e)
    {
        rqst = Convert.ToInt32((sender as LinkButton).CommandArgument);
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/the viewer page.aspx");
    }
}