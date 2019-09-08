using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _1_create_event : System.Web.UI.Page
{
   static int event_id = -1;
    protected void Page_Load(object sender, EventArgs e)
    {
    

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string sc = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        using (SqlConnection con = new SqlConnection(sc))

        {
            if (TextBox3.Text == null || TextBox3.Text == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please enter city')</script>");

            }
            
            if (TextBox6.Text == null || TextBox6.Text == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please enter descriptoin ')</script>");

            }
            if (TextBox7.Text == null || TextBox7.Text == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please enter entertainer')</script>");

            }
            if (TextBox9.Text == null || TextBox9.Text == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please enter location ')</script>");

            }
            else
            {

                SqlCommand cmd = new SqlCommand("Viewer_Create_Event", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@city", TextBox3.Text);
                cmd.Parameters.AddWithValue("@event_date_time", DateTime.Now);
                cmd.Parameters.AddWithValue("@description", TextBox6.Text);
                cmd.Parameters.AddWithValue("@entartainer", TextBox7.Text);
                cmd.Parameters.AddWithValue("@viewer_id", Session["id"]);
                cmd.Parameters.AddWithValue("@location", TextBox9.Text);
                SqlParameter output = new SqlParameter();
                output.ParameterName = "@event_id";
                output.SqlDbType = System.Data.SqlDbType.Int;
                output.Direction = System.Data.ParameterDirection.Output;
                cmd.Parameters.Add(output);

                con.Open();
                cmd.ExecuteNonQuery();
                event_id = (int)output.Value;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('you have created the event sucessfully')</script>");
            }
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Write(event_id);
            if (event_id == -1)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please create the event first')</script>");
        }
        else if (TextBox10.Text == null || TextBox10.Text == "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please inter the link.')</script>");

        }
        else
        {
            string sc = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
            using (SqlConnection con = new SqlConnection(sc))

            {

                SqlCommand cmd = new SqlCommand("Viewer_Upload_Event_Photo", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@event_id", event_id);
                cmd.Parameters.AddWithValue("@link", TextBox10.Text);
                con.Open();
                cmd.ExecuteNonQuery();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('you have uploaded the link sucessfully.')</script>");

            }

        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        if (event_id == -1)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please create the event first')</script>");
        }
        else if (TextBox10.Text == null || TextBox11.Text == "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please inter the link.')</script>");

        }
        else
        {
            string sc = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
            using (SqlConnection con = new SqlConnection(sc))

            {

                SqlCommand cmd = new SqlCommand("Viewer_Upload_Event_Video ", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@event_id", event_id);
                cmd.Parameters.AddWithValue("@link", TextBox11.Text);
                con.Open();
                cmd.ExecuteNonQuery();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('you have uploaded the link sucessfully.')</script>");



            }
        }
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        if (event_id == -1)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('please create the event first')</script>");
        }
        
        else
        {
            string sc = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
            using (SqlConnection con = new SqlConnection(sc))

            {

                SqlCommand cmd = new SqlCommand("Viewer_Create_Ad_From_Event ", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@event_id", event_id);

                con.Open();
                cmd.ExecuteNonQuery();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "scripts", "<script>alert('the ad is done sucessfully.')</script>");

            }
        }
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/the viewer page.aspx");
    }
}