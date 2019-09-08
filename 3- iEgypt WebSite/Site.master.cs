using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class SiteMaster : MasterPage
{
   
    protected void Page_Init(object sender, EventArgs e)
    {
        
        if (Message.Messagekey== true)
        {
            string script = "alert(\"Your profile has been deactivated successfully\");";
            ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script, true);
            Message.Messagekey = false;
        }
        SContr.HRef = "ShowData.aspx?Show=1";
        SCont.HRef = "ShowData.aspx?Show=2";

        if (Session["ID"] == null)
        {
            n1.HRef = "~/Account/Register";
            n1.InnerHtml = "Register";
            n2.InnerHtml = "Log In";
            n2.HRef = "~/Account/Login";
            Deactive.Visible = false;
            n2.ServerClick += null;
            view.Visible = false;
            staff.Visible = false;
        }
        else
        {
            n1.HRef = "~/Account/Manage";
            n1.InnerHtml = "Edit My Profile";
            n2.InnerHtml = "Log Out";
            n2.ServerClick += new EventHandler(logout);
            Deactive.Visible = true;
            String s = DBcontroller.getusertype(Session["ID"]+"", this);
            if (s.Equals("Viewer"))
            {
                view.Visible = true;
            }
            if(s.Equals("Content Manager") | s.Equals("Reviewer"))
            {
                staff1.Visible = true;
            }
        }

    }

    private void logout(object sender, EventArgs e)
    {
        Session["ID"] = null;
        Response.Redirect("~/Default");
    }

    protected void master_Page_PreLoad(object sender, EventArgs e)
    {
        if (Request.QueryString["U_id"] != null)
        {
            String s = Request.QueryString["U_id"];
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        droplist.Items[0].Attributes["Disabled"] = "Disabled";
    }

    public void Button1click(object sender, EventArgs args)
    {
        if (int.Parse(droplist.SelectedValue) != 0)
        {
            Response.Redirect("~/Searcher.aspx?SearchBy=" + droplist.SelectedValue);
        }
    }
    protected void deact(object sender, EventArgs e)
    {
        SqlConnection cnn = null;
        try
        {
            cnn = DBcontroller.MakeConnection(this);
            cnn.Open();

            SqlCommand command;

            String sql = " ";

            sql = "exec Deactivate_Profile " + Session["ID"];
            command = new SqlCommand(sql, cnn);

            if (command.ExecuteNonQuery() == 1)
            {
                Message.Messagekey = true;
                Session["ID"] = null;
                Response.Redirect("~/Default");

            }
        }
        catch (SqlException e1)
        {
            string script = "alert(\"" + e1.Message + "\");";
            ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script, true);
        }
        finally
        {
            if (cnn != null )
            {
                cnn.Close();
            }
        }
    }

}