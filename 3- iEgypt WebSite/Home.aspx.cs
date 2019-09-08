using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;



public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn1_Click(object sender, EventArgs e)
    {
        ///////////////////////////////////////////////////////////////////////////
        string connetionString = WebConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        SqlConnection connection = new SqlConnection(connetionString);
        connection.Open();
        SqlCommand cmd = new SqlCommand("Staff_Create_Type", connection);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        ////////////////////////////////////////////////////////////////////////
        cmd.Parameters.AddWithValue("@type_name", typetxt.Text);

        using (SqlDataReader rdr = cmd.ExecuteReader()) { }


        connection.Close();


    }

    protected void btncontent_Click(object sender, EventArgs e)
    {
        if (contentgrid.SelectedRow != null) {
        string connetionString = WebConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        SqlConnection connection = new SqlConnection(connetionString);




        int r = contentgrid.SelectedRow.RowIndex;

        connection.Open();
        SqlCommand cmd = new SqlCommand("Delete_Original_Content", connection);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@content_id", Convert.ToInt32(contentgrid.Rows[r].Cells[0].Text));

        cmd.ExecuteNonQuery();

        contentgrid.DataBind();//refresh
        connection.Close();

        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please select content.')</script>");
        }


    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string connetionString = WebConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        SqlConnection connection = new SqlConnection(connetionString);
        connection.Open();
        SqlCommand cmd = new SqlCommand("Staff_Create_Category", connection);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@category_name", Contcrea.Text);

        using (SqlDataReader rdr = cmd.ExecuteReader()) { }


        connection.Close();
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }

    protected void typetxt_TextChanged(object sender, EventArgs e)
    {

    }

    protected void contentgrid_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void delcomm_Click(object sender, EventArgs e)
    {
        if (delCom1.SelectedRow != null)
        {
            string connetionString = WebConfigurationManager.ConnectionStrings["cs"].ConnectionString;
            SqlConnection connection = new SqlConnection(connetionString);


            int r = delCom1.SelectedRow.RowIndex;

            connection.Open();
            SqlCommand cmd = new SqlCommand("Delete_Comment", connection);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@original_content_id", Convert.ToInt32(delCom1.Rows[r].Cells[0].Text));
            cmd.Parameters.AddWithValue("@viewer_id", Convert.ToInt32(delCom1.Rows[r].Cells[1].Text));
            cmd.Parameters.AddWithValue("@comment_time", Convert.ToDateTime(delCom1.Rows[r].Cells[2].Text));

            cmd.ExecuteNonQuery();

            delCom1.DataBind();//refresh
            connection.Close();
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please select comment.')</script>");
        }
        }

    protected void delCo_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void delCom_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void contentgrid_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }

    protected void TextBox1_TextChanged1(object sender, EventArgs e)
    {

    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        if (Assign.SelectedRow != null & Cont.SelectedRow != null)
        {
            string connetionString = WebConfigurationManager.ConnectionStrings["cs"].ConnectionString;
            SqlConnection connection = new SqlConnection(connetionString);
            int r = Assign.SelectedRow.RowIndex;
            int s = Cont.SelectedRow.RowIndex;
            connection.Open();
            SqlCommand cmd = new SqlCommand("Assign_Contributor_Request", connection);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@new_request_id", Convert.ToInt32(Cont.Rows[r].Cells[1].Text));

            cmd.Parameters.AddWithValue("@contributor_id", Convert.ToInt32(Assign.Rows[s].Cells[0].Text));


            using (SqlDataReader rdr = cmd.ExecuteReader()) { }

            cmd.ExecuteNonQuery();

            delCom1.DataBind();//refresh
            connection.Close();
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please select from the two tables.')</script>");
        }
    }







    protected void ShowN_Click(object sender, EventArgs e)
    {
                 
       
    }

    protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView7.Visible = true;
    }

    protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click2(object sender, EventArgs e)
    {
        if (GridView5.SelectedRow != null)
        {
            string connetionString = WebConfigurationManager.ConnectionStrings["cs"].ConnectionString;
            SqlConnection connection = new SqlConnection(connetionString);


            int r = GridView5.SelectedRow.RowIndex;

            connection.Open();
            SqlCommand cmd = new SqlCommand("Reviewer_Filter_Content", connection);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@reviewer_id", Session["ID"]);
            cmd.Parameters.AddWithValue("@original_content", Convert.ToInt32(GridView5.Rows[r].Cells[0].Text));
            cmd.Parameters.AddWithValue("@status", true);

            cmd.ExecuteNonQuery();

            delCom1.DataBind();//refresh
            connection.Close();
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please select content.')</script>");
        }
    }

    protected void GridView5_SelectedIndexChanged(object sender, EventArgs e)
    {
       
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (GridView5.SelectedRow != null)
        {
            string connetionString = WebConfigurationManager.ConnectionStrings["cs"].ConnectionString;
            SqlConnection connection = new SqlConnection(connetionString);


            int r = GridView5.SelectedRow.RowIndex;

            connection.Open();
            SqlCommand cmd = new SqlCommand("Reviewer_Filter_Content", connection);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@reviewer_id", Session["ID"]);
            cmd.Parameters.AddWithValue("@original_content", Convert.ToInt32(delCom1.Rows[r].Cells[0].Text));
            cmd.Parameters.AddWithValue("@status", false);

            cmd.ExecuteNonQuery();

            delCom1.DataBind();//refresh
            connection.Close();
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please select content.')</script>");
        }
    }

    protected void GridView6_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        if (GridView6.SelectedRow != null)
        {
            string connetionString = WebConfigurationManager.ConnectionStrings["cs"].ConnectionString;
            SqlConnection connection = new SqlConnection(connetionString);


            int r = GridView6.SelectedRow.RowIndex;

            connection.Open();
            SqlCommand cmd = new SqlCommand("content_manager_filter_content", connection);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@content_manager_id", Session["ID"]);
            cmd.Parameters.AddWithValue("@original_content", Convert.ToInt32(GridView6.Rows[r].Cells[0].Text));
            cmd.Parameters.AddWithValue("@status", true);

            cmd.ExecuteNonQuery();

            delCom1.DataBind();//refresh
            connection.Close();
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please select content.')</script>");
        }
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        if (GridView6.SelectedRow != null)
        {
            string connetionString = WebConfigurationManager.ConnectionStrings["cs"].ConnectionString;
            SqlConnection connection = new SqlConnection(connetionString);


            int r = GridView6.SelectedRow.RowIndex;

            connection.Open();
            SqlCommand cmd = new SqlCommand("content_manager_filter_content", connection);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@content_manager_id", Session["ID"]);
            cmd.Parameters.AddWithValue("@original_content", Convert.ToInt32(GridView6.Rows[r].Cells[0].Text));
            cmd.Parameters.AddWithValue("@status", false);

            cmd.ExecuteNonQuery();

            delCom1.DataBind();//refresh
            connection.Close();
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please select content.')</script>");
        }
    }

    protected void Button12_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default");
    }
}

