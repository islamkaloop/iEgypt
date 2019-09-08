using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using Milestone_3;
using System.Data.SqlClient;
using System.Web.UI;

public partial class Account_Manage : System.Web.UI.Page
{
    String s = "";
    protected void Page_Load()
    {
        if (IsCallback)
        {
            changeinform.Visible = false;
            changepassword.Visible = false;
        }

        CurrentPass.Visible = false;
        NewPass.Visible = false;
        ConfirmNewPAss.Visible = false;
        SqlConnection cnn = null;
        SqlDataReader dataReader = null;
        try {
            cnn = DBcontroller.MakeConnection(this);
            cnn.Open();
            String sql = "select first_name,middle_name,last_name from [user] where id ='" + Session["ID"] + "'";
            s = DBcontroller.getusertype(Session["ID"] + "", this);

            SqlCommand command = new SqlCommand(sql, cnn);
            dataReader = command.ExecuteReader();
            if (dataReader.Read())
            {
                welcom.InnerHtml = "You're logged in as <strong>" + s + " " + dataReader.GetValue(0) + " " + dataReader.GetValue(1) + " " + dataReader.GetValue(2) + "</strong>. ";

            }
        }catch(SqlException e)
        {
            string script = "alert(\"" + e.Message + "\");";
            ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script, true);
        }
        finally
        {
            if (cnn != null & dataReader != null)
            {
                dataReader.Close();
                cnn.Close();
            }
        }
    }

    protected void ChangePassword_Click(object sender, EventArgs e)
    {
        CurrentPass.Visible = false;
        NewPass.Visible = false;
        ConfirmNewPAss.Visible = false;
        int i = 0;
        if (CurrentPassword.Text == "")
        {
            i++;
            CurrentPass.Visible = true;
        }
        if (NewPassword.Text == "")
        {
            i++;
            NewPass.Visible = true;
        }
        if (ConfirmNewPassword.Text == "")
        {
            i++;
            ConfirmNewPAss.Text = "The confirm new password field is required.";
            ConfirmNewPAss.Visible = true;
        }
        if(NewPassword.Text!="" &ConfirmNewPAss.Text!="" & !NewPassword.Text.Equals(ConfirmNewPassword.Text))
        {
            i++;
            ConfirmNewPAss.Text = "The confirm new password field does not match with new password field";
            ConfirmNewPAss.Visible = true;
        }
        if (i == 0)
        {
            SqlConnection cnn = null;
            SqlDataReader dataReader = null;
            try {
                cnn = DBcontroller.MakeConnection(this);
                cnn.Open();

                String sql = "select password from [user] where id ='" + Session["ID"] + "'";

                SqlCommand command = new SqlCommand(sql, cnn);
                dataReader = command.ExecuteReader();
                if (dataReader.Read())
                {
                    if (dataReader.GetValue(0).Equals(CurrentPassword.Text))
                    {
                        sql = "UPDATE [USER] set PASSWORD='" + NewPassword.Text + "' WHERE ID =" + Session["ID"];
                        command = new SqlCommand(sql, cnn);
                        if (command.ExecuteNonQuery() == 1)
                        {
                            alert("Your password has been changed successfully");
                        }
                    }
                    else
                    {
                        alert("Please enter correct current password");
                    }
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
                if (cnn != null & dataReader != null)
                {
                    dataReader.Close();
                    cnn.Close();
                }
            }
        }
    }
    protected void changeinfo(object sender, EventArgs e)
    {
        changeinform.Visible = true;
        changepassword.Visible = false;
        if (s.Equals("Viewer"))
        {
            viewer.Visible = true;
            contr.Visible = false;
            staff.Visible = false;
        }
        else if (s.Equals("Contributer"))
        {
            viewer.Visible = false;
            contr.Visible = true;
            staff.Visible = false;
        }
        else
        {
            viewer.Visible = false;
            contr.Visible = false;
            staff.Visible = true;
        }
        fillunfo();
    }
    protected void changePass(object sender, EventArgs e)
    {
        changeinform.Visible = false;
        changepassword.Visible = true;
        
    }
    protected void changedata(object sender, EventArgs e)
    {
        FirstName1.Visible = false;
        SecondName1.Visible = false;
        ThirdName1.Visible = false;
        mail1.Visible = false;
        birthdate1.Visible = false;
        working_place_name1.Visible = false;
        working_place_type1.Visible = false;
        wokring_place_description1.Visible = false;
        specilization1.Visible = false;
        years_experience1.Visible = false;
        portofolio_link1.Visible = false;
        hire_date1.Visible = false;
        working_hours1.Visible = false;
        payment_rate1.Visible = false;

        int i = 0;
        if (FirstName.Text == "")
        {
            i++;
            FirstName1.Visible = true;
        }
        if (SecondName.Text == "")
        {
            i++;
            SecondName1.Visible = true;
        }
        if (ThirdName.Text == "")
        {
            i++;
            ThirdName1.Visible = true;
        }
        if (mail.Text == "")
        {
            i++;
            mail1.Visible = true;
        }
        if (birthdate.Text == "")
        {
            i++;
            birthdate1.Visible = true;
        }
        if (s.Equals("Viewer"))
        {
            if (working_place_name.Text == "")
            {
                i++;
                working_place_name1.Visible = true;
            }
            if (working_place_type.Text == "" )
            {
                i++;
                working_place_type1.Visible = true;
            }
            if (wokring_place_description.Text == "")
            {
                i++;
                wokring_place_description1.Visible = true;
            }
        }
        else if (s.Equals("Contributer"))
        {
            if (specilization.Text == "")
            {
                i++;
                specilization1.Visible = true;
            }
            if (years_experience.Text == "" )
            {
                i++;
                years_experience1.Visible = true;
            }
            if (portofolio_link.Text == "" )
            {
                i++;
                portofolio_link1.Visible = true;
            }
        }
        else
        {
            if (hire_date.Text == "" )
            {
                i++;
                hire_date1.Visible = true;
            }
            if (working_hours.Text == "" )
            {
                i++;
                working_hours1.Visible = true;
            }
            if (payment_rate.Text == "" )
            {
                i++;
                payment_rate1.Visible = true;
            }
        }
        if (i == 0)
        {
            SqlConnection cnn = null;
            try
            {
                cnn = DBcontroller.MakeConnection(this);
                cnn.Open();

                SqlCommand cmd = new SqlCommand("Edit_Profile", cnn);

                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@user_id", Session["ID"]));
                cmd.Parameters.Add(new SqlParameter("@email", mail.Text));
                cmd.Parameters.Add(new SqlParameter("@password", getpass()));
                cmd.Parameters.Add(new SqlParameter("@firstname", FirstName.Text));
                cmd.Parameters.Add(new SqlParameter("@middlename", SecondName.Text));
                cmd.Parameters.Add(new SqlParameter("@lastname", ThirdName.Text));
                cmd.Parameters.Add(new SqlParameter("@birth_date", birthdate.Text));
                if (s.Equals("Viewer"))
                {
                    cmd.Parameters.Add(new SqlParameter("@working_place_name", working_place_name.Text));
                    cmd.Parameters.Add(new SqlParameter("@working_place_type", working_place_type.Text));
                    cmd.Parameters.Add(new SqlParameter("@wokring_place_description", wokring_place_description.Text));
                    cmd.Parameters.Add(new SqlParameter("@specilization", DBNull.Value));
                    cmd.Parameters.Add(new SqlParameter("@portofolio_link", DBNull.Value));
                    cmd.Parameters.Add(new SqlParameter("@years_experience", DBNull.Value));
                    cmd.Parameters.Add(new SqlParameter("@hire_date", DBNull.Value));
                    cmd.Parameters.Add(new SqlParameter("@working_hours", DBNull.Value));
                    cmd.Parameters.Add(new SqlParameter("@payment_rate", DBNull.Value));
                }
                else if (s.Equals("Contributer"))
                {
                    cmd.Parameters.Add(new SqlParameter("@working_place_name", DBNull.Value));
                    cmd.Parameters.Add(new SqlParameter("@working_place_type", DBNull.Value));
                    cmd.Parameters.Add(new SqlParameter("@wokring_place_description", DBNull.Value));
                    cmd.Parameters.Add(new SqlParameter("@specilization", specilization.Text));
                    cmd.Parameters.Add(new SqlParameter("@portofolio_link", portofolio_link.Text));
                    cmd.Parameters.Add(new SqlParameter("@years_experience", years_experience.Text));
                    cmd.Parameters.Add(new SqlParameter("@hire_date", DBNull.Value));
                    cmd.Parameters.Add(new SqlParameter("@working_hours", DBNull.Value));
                    cmd.Parameters.Add(new SqlParameter("@payment_rate", DBNull.Value));
                }
                else
                {
                    cmd.Parameters.Add(new SqlParameter("@working_place_name", DBNull.Value));
                    cmd.Parameters.Add(new SqlParameter("@working_place_type", DBNull.Value));
                    cmd.Parameters.Add(new SqlParameter("@wokring_place_description", DBNull.Value));
                    cmd.Parameters.Add(new SqlParameter("@specilization", DBNull.Value));
                    cmd.Parameters.Add(new SqlParameter("@portofolio_link", DBNull.Value));
                    cmd.Parameters.Add(new SqlParameter("@years_experience", DBNull.Value));
                    cmd.Parameters.Add(new SqlParameter("@hire_date", hire_date.Text));
                    cmd.Parameters.Add(new SqlParameter("@working_hours", working_hours.Text));
                    cmd.Parameters.Add(new SqlParameter("@payment_rate", payment_rate.Text));
                }
                int changedrow = cmd.ExecuteNonQuery();
                if (changedrow > 0)
                {
                    string script = "alert(\" Your data has been edited successfully \");";
                    ScriptManager.RegisterStartupScript(this, GetType(),
                                          "ServerControlScript", script, true);
                    fillunfo();
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
                if (cnn != null)
                {
                    cnn.Close();
                }
            }
        }
    }
    protected void alert(String s)
    {
        string script = "alert(\""+ s+"\");";
        ScriptManager.RegisterStartupScript(this, GetType(),
                              "ServerControlScript", script, true);
        CurrentPassword.Text = "";
        NewPassword.Text = "";
        ConfirmNewPassword.Text = "";
        CurrentPass.Visible = false;
        NewPass.Visible = false;
        ConfirmNewPAss.Visible = false;
    }
    protected string getpass()
    {
        SqlConnection cnn = null;
        SqlDataReader rdr = null;
        try {
            cnn = DBcontroller.MakeConnection(this);
            cnn.Open();
            SqlCommand command;

            String sql = " ";

            sql = "select password from [user] where id ='" + Session["ID"] + "'";
            command = new SqlCommand(sql, cnn);

            rdr = command.ExecuteReader();
            rdr.Read();
            return rdr.GetValue(0) + "";
        }
        catch (SqlException e1)
        {
            string script = "alert(\"" + e1.Message + "\");";
            ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script, true);
        }
        finally
        {
            if (cnn != null &rdr!=null)
            {
                rdr.Close();
                cnn.Close();
            }
        }
        return null;
    }
    protected void fillunfo()
    {
        SqlConnection cnn = null;
        try {
            cnn = DBcontroller.MakeConnection(this);
            cnn.Open();
            SqlCommand cmd = new SqlCommand("Show_Profile", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@user_id", Session["ID"] + ""));

            cmd.Parameters.Add("@email", System.Data.SqlDbType.VarChar, 400).Direction = System.Data.ParameterDirection.Output;
            cmd.Parameters.Add("@firstname", System.Data.SqlDbType.VarChar, 400).Direction = System.Data.ParameterDirection.Output;
            cmd.Parameters.Add("@middlename", System.Data.SqlDbType.VarChar, 400).Direction = System.Data.ParameterDirection.Output;
            cmd.Parameters.Add("@password", System.Data.SqlDbType.VarChar, 400).Direction = System.Data.ParameterDirection.Output;
            cmd.Parameters.Add("@lastname", System.Data.SqlDbType.VarChar, 400).Direction = System.Data.ParameterDirection.Output;
            cmd.Parameters.Add("@birth_date", System.Data.SqlDbType.Date).Direction = System.Data.ParameterDirection.Output;
            cmd.Parameters.Add("@working_place_name", System.Data.SqlDbType.VarChar, 400).Direction = System.Data.ParameterDirection.Output;
            cmd.Parameters.Add("@working_place_type", System.Data.SqlDbType.VarChar, 400).Direction = System.Data.ParameterDirection.Output;
            cmd.Parameters.Add("@wokring_place_description", System.Data.SqlDbType.VarChar, 400).Direction = System.Data.ParameterDirection.Output;
            cmd.Parameters.Add("@specilization", System.Data.SqlDbType.VarChar, 400).Direction = System.Data.ParameterDirection.Output;
            cmd.Parameters.Add("@portofolio_link", System.Data.SqlDbType.VarChar, 400).Direction = System.Data.ParameterDirection.Output;
            cmd.Parameters.Add("@years_experience", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;
            cmd.Parameters.Add("@hire_date", System.Data.SqlDbType.Date).Direction = System.Data.ParameterDirection.Output;
            cmd.Parameters.Add("@working_hours", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;
            cmd.Parameters.Add("@payment_rate", System.Data.SqlDbType.Decimal, 10).Direction = System.Data.ParameterDirection.Output;
            cmd.Parameters["@payment_rate"].Precision = 10;
            cmd.Parameters["@payment_rate"].Scale = 2;
            SqlDataReader rdr = cmd.ExecuteReader();
            FirstName.Text = cmd.Parameters["@firstname"].Value + "";
            SecondName.Text = cmd.Parameters["@middlename"].Value + "";
            ThirdName.Text = cmd.Parameters["@lastname"].Value + "";
            mail.Text = cmd.Parameters["@email"].Value + "";
            birthdate.Text = (Convert.ToDateTime(cmd.Parameters["@birth_date"].Value + "")).ToString("yyyy-MM-dd");
            if (s.Equals("Viewer"))
            {
                working_place_name.Text = (String)cmd.Parameters["@working_place_name"].Value;
                working_place_type.Text = cmd.Parameters["@working_place_type"].Value + "";
                wokring_place_description.Text = cmd.Parameters["@wokring_place_description"].Value + "";
            }
            else if (s.Equals("Contributer"))
            {
                years_experience.Text = cmd.Parameters["@years_experience"].Value + "";
                portofolio_link.Text = cmd.Parameters["@portofolio_link"].Value + "";
                specilization.Text = cmd.Parameters["@specilization"].Value + "";

            }
            else
            {
                hire_date.Text = (Convert.ToDateTime(cmd.Parameters["@hire_date"].Value + "")).ToString("yyyy-MM-dd");
                working_hours.Text = cmd.Parameters["@working_hours"].Value + "";
                payment_rate.Text = (((decimal)cmd.Parameters["@payment_rate"].Value)) + "";

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
            if (cnn != null)
            {
                cnn.Close();
            }
        }

    }
}