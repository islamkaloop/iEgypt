using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Web.UI;
using Milestone_3;
using System.Data.SqlClient;

public partial class Account_Register : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsCallback)
        {
            viewer.Visible = false;
            staff.Visible = false;
            contr.Visible = false;
        }
        usertype1.Visible = false;
        FirstName1.Visible = false;
        SecondName1.Visible = false;
        ThirdName1.Visible = false;
        mail1.Visible = false;
        birthdate1.Visible = false;
        Password1.Visible = false;
        ConfirmPassword1.Visible = false;
        working_place_name1.Visible = false;
        working_place_type1.Visible = false;
        wokring_place_description1.Visible = false;
        specilization1.Visible = false;
        years_experience1.Visible = false;
        portofolio_link1.Visible = false;
        hire_date1.Visible = false;
        working_hours1.Visible = false;
        payment_rate1.Visible = false;
    }
    protected void CreateUser_Click(object sender, EventArgs e)
    {
        usertype1.Visible = false;
        FirstName1.Visible = false;
        SecondName1.Visible = false;
        ThirdName1.Visible = false;
        mail1.Visible = false;
        birthdate1.Visible = false;
        Password1.Visible = false;
        ConfirmPassword1.Visible = false;
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
        if (usertype.SelectedIndex == -1)
        {
            i++;
            usertype1.Visible = true;
        }
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
        if (Password.Text == "")
        {
            i++;
            Password1.Visible = true;
        }
        if (ConfirmPassword.Text == "")
        {
            i++;
            ConfirmPassword1.Text = "The confirm password field is required";
            ConfirmPassword1.Visible = true;
        }
        if (working_place_name.Text == "" & usertype.SelectedIndex == 0)
        {
            i++;
            working_place_name1.Visible = true;
        }
        if (working_place_type.Text == "" & usertype.SelectedIndex == 0)
        {
            i++;
            working_place_type1.Visible = true;
        }
        if (wokring_place_description.Text == "" & usertype.SelectedIndex == 0)
        {
            i++;
            wokring_place_description1.Visible = true;
        }
        if (specilization.Text == "" & usertype.SelectedIndex == 1)
        {
            i++;
            specilization1.Visible = true;
        }
        if (years_experience.Text == "" & usertype.SelectedIndex == 1)
        {
            i++;
            years_experience1.Visible = true;
        }
        if (portofolio_link.Text == "" & usertype.SelectedIndex == 1)
        {
            i++;
            portofolio_link1.Visible = true;
        }
        if (hire_date.Text == ""&(usertype.SelectedIndex == 2 | usertype.SelectedIndex == 3))
        {
            i++;
            hire_date1.Visible = true;
        }
        if (working_hours.Text == ""&(usertype.SelectedIndex == 2 | usertype.SelectedIndex == 3))
        {
            i++;
            working_hours1.Visible = true;
        }
        if (payment_rate.Text == ""&(usertype.SelectedIndex==2 | usertype.SelectedIndex == 3))
        {
            i++;
            payment_rate1.Visible = true;
        }
        if (Password.Text != "" & ConfirmPassword.Text != null & Password.Text != ConfirmPassword.Text)
        {
            i++;
            ConfirmPassword1.Text = "The confirm password field does not match with password field";
            ConfirmPassword1.Visible = true;
        }
        if (i == 0)
        {
            SqlConnection cnn = null;
            SqlDataReader dataReader = null;
            int U_id = 0;

            try
            {
                cnn = DBcontroller.MakeConnection(this);
                cnn.Open();

                String sql = "select email from [user] where email ='" + mail.Text + "'";

                SqlCommand command = new SqlCommand(sql, cnn);
                dataReader = command.ExecuteReader();
                if (!dataReader.Read())
                {
                    SqlCommand cmd = new SqlCommand("Register_User", cnn);

                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@usertype", usertype.SelectedValue));
                    cmd.Parameters.Add(new SqlParameter("@email", mail.Text));
                    cmd.Parameters.Add(new SqlParameter("@password", Password.Text));
                    cmd.Parameters.Add(new SqlParameter("@firstname", FirstName.Text));
                    cmd.Parameters.Add(new SqlParameter("@middlename", SecondName.Text));
                    cmd.Parameters.Add(new SqlParameter("@lastname", ThirdName.Text));
                    cmd.Parameters.Add(new SqlParameter("@birth_date", birthdate.Text));
                    if (usertype.SelectedIndex == 0)
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
                    else if (usertype.SelectedIndex == 1)
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

                    cmd.Parameters.Add("@user_id", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;

                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        U_id = Convert.ToInt32(cmd.Parameters["@user_id"].Value);
                    }
                    Session["ID"] = U_id;
                    Response.Redirect("~/Default.aspx");
                }
                else
                {
                    string script = "alert(\"This E-mail used for other profile\");";
                    ScriptManager.RegisterStartupScript(this, GetType(),
                                          "ServerControlScript", script, true);
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

    protected void userchange(object sender, EventArgs e)
    {
        if (usertype.SelectedIndex == 0)
        {
            viewer.Visible = true;
            contr.Visible = false;
            staff.Visible = false;
        }
        else if (usertype.SelectedIndex == 1)
        {
            contr.Visible = true;
            viewer.Visible = false;
            staff.Visible = false;
        }
        else
        {
            staff.Visible = true;
            contr.Visible = false;
            viewer.Visible = false;
        }



    }
}