using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class contribuer_profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        string sc = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        using (SqlConnection con = new SqlConnection(sc))

        {

            con.Open();
            string code = "select * from  [User] ,Contributor where Contributor.id="+Session["contributer_id"]+" and [User].id=Contributor.id";
            SqlDataAdapter sqlda = new SqlDataAdapter(code, con);
            DataTable dtbl = new DataTable();
            sqlda.Fill(dtbl);
            GridView1.DataSource = dtbl;
            GridView1.DataBind();
           

        }
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/10)show new content.aspx");
    }
}