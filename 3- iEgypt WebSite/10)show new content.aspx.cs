using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _10_show_new_content : System.Web.UI.Page
{
   
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
            string sc = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
            using (SqlConnection con = new SqlConnection(sc))

            {

                con.Open();
                string code = "select * from Content,New_Content,[User] where Content.id=New_Content.id and [User].id=contributer_id";
                SqlDataAdapter sqlda = new SqlDataAdapter(code, con);
                DataTable dtbl = new DataTable();
                sqlda.Fill(dtbl);
                GridView1.DataSource = dtbl;
                GridView1.DataBind();

        }

    }

    protected void link_Click(object sender, EventArgs e)
    {
        Session["contributer_id"] = Convert.ToInt32((sender as LinkButton).CommandArgument);
        Response.Redirect("~/contribuer_profile.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/the viewer page.aspx");
    }
}