using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Web;
using System.Web.UI;
using Milestone_3;
using System.Data.SqlClient;

public partial class Account_Login : Page
{
    String mail1 = "";
    String pass1 = "";


    protected void LogIn(object sender, EventArgs e)
        {
        if (mail.Text == "" & Password.Text == "")
        {
            mailText.Text = "The email field is required.";
            mailText.Visible = true;
            PasswordText.Text = "The password field is required.";
            ValidInfo.Visible = false;
            PasswordText.Visible = true;
        }
        else if (mail.Text == "")
        {
            mailText.Text = "The user name field is required.";
            mailText.Visible = true;
            ValidInfo.Visible = false;
            PasswordText.Visible = false;
        }
        else if (Password.Text == "")
        {
            PasswordText.Text = "The password field is required.";
            PasswordText.Visible = true;
            ValidInfo.Visible = false;
            mailText.Visible = false;
        }
        else {
            SqlConnection cnn = null;
            SqlDataReader dataReader = null;
            int U_id = 0;
            Boolean c = true;
            try {
                cnn = DBcontroller.MakeConnection(this);
                cnn.Open();

                String sql = "select active from [user] where email ='" + mail.Text + "' and password ='" + Password.Text + "'";

                SqlCommand command = new SqlCommand(sql, cnn);

                dataReader = command.ExecuteReader();
                
                if (dataReader.Read())
                {
                    c = Boolean.Parse(dataReader.GetValue(0) + "");
                }
                mail1 = mail.Text;
                pass1 = Password.Text;

                SqlCommand cmd = new SqlCommand("User_login", cnn);

                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@email", mail.Text));
                cmd.Parameters.Add(new SqlParameter("@password", Password.Text));

                cmd.Parameters.Add("@user_id", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;





                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    U_id = Convert.ToInt32(cmd.Parameters["@user_id"].Value);
                }
            } 
            catch(SqlException e1)
            {
                string script = "alert(\"" + e1.Message + "\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
            }
            finally
            {
                if(cnn!=null & dataReader != null)
                {
                    dataReader.Close();
                    cnn.Close();
                }
            }


            if(U_id==-1 & !c)
            {
                PasswordText.Visible = false;
                mailText.Visible = false;
                ValidInfo.Visible = true;
                ValidInfo.Text = "Your acount was deactivted.";
                mail1 = "";
                pass1 = "";

            }
            else if (U_id == -1)
            {
                PasswordText.Visible = false;
                mailText.Visible = false;
                ValidInfo.Visible = true;
                ValidInfo.Text = "Please inter Valide Information .";
                mail1 = "";
                pass1 = "";
            }
            else
            {
                Session["ID"] = U_id;
                Response.Redirect("~/Default.aspx");
                mail1 = "";
                pass1 = "";
            }
        }
        }
 
}