using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["ID"] == null){
            mainnotlog.Visible = true;
            mainlog.Visible = false;
        }
        else
        {

            SqlConnection cnn = null;
            SqlDataReader dataReader = null;
            try
            {
                cnn = DBcontroller.MakeConnection(this);
                cnn.Open();

                String sql = "select first_name,middle_name,last_name from [user] where id ='" + Session["ID"] + "'";

                SqlCommand command = new SqlCommand(sql, cnn);

                string s = DBcontroller.getusertype(Session["ID"]+"", this);

                type.Text ="Log In As "+ s;

                dataReader = command.ExecuteReader();
                if (dataReader.Read())
                {
                    fname.Text = dataReader.GetValue(0) + "";
                    mname.Text = dataReader.GetValue(1) + "";
                    lname.Text = dataReader.GetValue(2) + "";

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
                if (cnn != null &dataReader!=null)
                {
                    dataReader.Close();
                    cnn.Close();
                }
            }
            mainlog.Visible = true;
            mainnotlog.Visible = false;
          
        }
       

    }
  
}