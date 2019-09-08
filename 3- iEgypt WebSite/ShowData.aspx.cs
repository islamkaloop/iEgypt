using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShowData : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

        if(Request.QueryString["Show"] != null)
        {
            if (int.Parse(Request.QueryString["Show"]) == 1)
            {
                SqlConnection cnn = null;
                SqlDataReader dataReader=null;
                try {
                    cnn = DBcontroller.MakeConnection(this);
                    cnn.Open();


                    SqlCommand command;

                    String sql = " ";


                    sql = "EXEC Order_Contributor";

                    command = new SqlCommand(sql, cnn);

                    dataReader = command.ExecuteReader();

                    DataTable tb = new DataTable();
                    tb.Columns.Add(new DataColumn("num"));
                    tb.Columns.Add(new DataColumn("ID"));
                    tb.Columns.Add(new DataColumn("first_name"));
                    tb.Columns.Add(new DataColumn("middle_name"));
                    tb.Columns.Add(new DataColumn("last_name"));
                    tb.Columns.Add(new DataColumn("email"));
                    tb.Columns.Add(new DataColumn("specialization"));
                    tb.Columns.Add(new DataColumn("years_of_experience"));
                    tb.Columns.Add(new DataColumn("portfolio_link"));
                    tb.Columns.Add(new DataColumn("age"));
                    tb.Columns.Add(new DataColumn("birthdate"));
                    DataColumn[] PrimaryKeyColumns = new DataColumn[1];
                    PrimaryKeyColumns[0] = tb.Columns["ID"];
                    tb.PrimaryKey = PrimaryKeyColumns;
                    int i = 0;
                    while (dataReader.Read())
                    {
                        i++;
                        DataRow row = tb.NewRow();
                        row["num"] = i;
                        row["ID"] = dataReader.GetValue(0);
                        row["first_name"] = dataReader.GetValue(7);
                        row["middle_name"] = dataReader.GetValue(8);
                        row["last_name"] = dataReader.GetValue(9);
                        row["email"] = dataReader.GetValue(6);
                        row["specialization"] = dataReader.GetValue(3);
                        row["years_of_experience"] = dataReader.GetValue(1);
                        row["portfolio_link"] = dataReader.GetValue(2);
                        row["age"] = dataReader.GetValue(11);
                        row["birthdate"] = dataReader.GetValue(10);
                        tb.Rows.Add(row);
                    }


                    labelcount1.Text = "Number of Contributors which Found : " + i + " Contributor";

                    Repeater3.DataSource = tb;
                    Repeater3.DataBind();
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
            if (int.Parse(Request.QueryString["Show"]) == 2)
            {
                Searchpart.Visible = true;
                SqlConnection cnn = null;
                SqlDataReader dataReader=null;
                try {
                    cnn = DBcontroller.MakeConnection(this);
                    cnn.Open();


                    SqlCommand command;

                    String sql = " ";


                    sql = "exec Show_Original_Content NULL";

                    command = new SqlCommand(sql, cnn);

                    dataReader = command.ExecuteReader();

                    DataTable tb = new DataTable();
                    tb.Columns.Add(new DataColumn("num"));
                    tb.Columns.Add(new DataColumn("ID"));
                    tb.Columns.Add(new DataColumn("content_manager_id"));
                    tb.Columns.Add(new DataColumn("reviewer_id"));
                    tb.Columns.Add(new DataColumn("review_status"));
                    tb.Columns.Add(new DataColumn("filter_status"));
                    tb.Columns.Add(new DataColumn("rating"));
                    tb.Columns.Add(new DataColumn("link"));
                    tb.Columns.Add(new DataColumn("uploaded_at"));
                    tb.Columns.Add(new DataColumn("category"));
                    tb.Columns.Add(new DataColumn("subcategory_name"));
                    tb.Columns.Add(new DataColumn("type"));
                    tb.Columns.Add(new DataColumn("IDCon"));
                    tb.Columns.Add(new DataColumn("first_name"));
                    tb.Columns.Add(new DataColumn("middle_name"));
                    tb.Columns.Add(new DataColumn("last_name"));
                    tb.Columns.Add(new DataColumn("email"));
                    tb.Columns.Add(new DataColumn("specialization"));
                    tb.Columns.Add(new DataColumn("years_of_experience"));
                    tb.Columns.Add(new DataColumn("portfolio_link"));
                    tb.Columns.Add(new DataColumn("age"));
                    tb.Columns.Add(new DataColumn("birthdate"));
                    DataColumn[] PrimaryKeyColumns = new DataColumn[1];
                    PrimaryKeyColumns[0] = tb.Columns["ID"];
                    tb.PrimaryKey = PrimaryKeyColumns;
                    int i = 0;
                    while (dataReader.Read())
                    {
                        i++;
                        DataRow row = tb.NewRow();
                        row["num"] = i;
                        row["ID"] = dataReader.GetValue(0);
                        row["content_manager_id"] = dataReader.GetValue(1);
                        row["reviewer_id"] = dataReader.GetValue(2);
                        row["review_status"] = dataReader.GetValue(3);
                        row["filter_status"] = dataReader.GetValue(4);
                        row["rating"] = dataReader.GetValue(5);
                        row["link"] = dataReader.GetValue(7);
                        row["uploaded_at"] = dataReader.GetValue(8);
                        row["category"] = dataReader.GetValue(10);
                        row["subcategory_name"] = dataReader.GetValue(11);
                        row["type"] = dataReader.GetValue(12);
                        row["IDCon"] = dataReader.GetValue(13);
                        row["first_name"] = dataReader.GetValue(20);
                        row["middle_name"] = dataReader.GetValue(21);
                        row["last_name"] = dataReader.GetValue(22);
                        row["email"] = dataReader.GetValue(19);
                        row["specialization"] = dataReader.GetValue(16);
                        row["years_of_experience"] = dataReader.GetValue(14);
                        row["portfolio_link"] = dataReader.GetValue(15);
                        row["age"] = dataReader.GetValue(24);
                        row["birthdate"] = dataReader.GetValue(23);
                        tb.Rows.Add(row);
                    }

                    labelcount1.Text = "Number of Contents which Found : " + i + " Content";

                    Repeater4.DataSource = tb;
                    Repeater4.DataBind();
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
    }
    protected void searchby(object sender, EventArgs e)
    {
        String s = TextBox1.Text;
        if (s != null)
        {
            Searchpart.Visible = true;
            SqlConnection cnn = null;
            SqlDataReader dataReader=null;
            try {
                cnn = DBcontroller.MakeConnection(this);
                cnn.Open();


                SqlCommand command;

                String sql = " ";

                sql = "exec Contributor_Search '" + s + "'";


                command = new SqlCommand(sql, cnn);

                dataReader = command.ExecuteReader();
                dataReader.Read();
                int c = int.Parse(dataReader.GetValue(0) + "");

                sql = "exec Show_Original_Content '" + c + "'";

                command = new SqlCommand(sql, cnn);

                dataReader = command.ExecuteReader();

                DataTable tb = new DataTable();
                tb.Columns.Add(new DataColumn("num"));
                tb.Columns.Add(new DataColumn("ID"));
                tb.Columns.Add(new DataColumn("content_manager_id"));
                tb.Columns.Add(new DataColumn("reviewer_id"));
                tb.Columns.Add(new DataColumn("review_status"));
                tb.Columns.Add(new DataColumn("filter_status"));
                tb.Columns.Add(new DataColumn("rating"));
                tb.Columns.Add(new DataColumn("link"));
                tb.Columns.Add(new DataColumn("uploaded_at"));
                tb.Columns.Add(new DataColumn("category"));
                tb.Columns.Add(new DataColumn("subcategory_name"));
                tb.Columns.Add(new DataColumn("type"));
                tb.Columns.Add(new DataColumn("IDCon"));
                tb.Columns.Add(new DataColumn("first_name"));
                tb.Columns.Add(new DataColumn("middle_name"));
                tb.Columns.Add(new DataColumn("last_name"));
                tb.Columns.Add(new DataColumn("email"));
                tb.Columns.Add(new DataColumn("specialization"));
                tb.Columns.Add(new DataColumn("years_of_experience"));
                tb.Columns.Add(new DataColumn("portfolio_link"));
                tb.Columns.Add(new DataColumn("age"));
                tb.Columns.Add(new DataColumn("birthdate"));
                DataColumn[] PrimaryKeyColumns = new DataColumn[1];
                PrimaryKeyColumns[0] = tb.Columns["ID"];
                tb.PrimaryKey = PrimaryKeyColumns;
                int i = 0;
                while (dataReader.Read())
                {
                    i++;
                    DataRow row = tb.NewRow();
                    row["num"] = i;
                    row["ID"] = dataReader.GetValue(0);
                    row["content_manager_id"] = dataReader.GetValue(1);
                    row["reviewer_id"] = dataReader.GetValue(2);
                    row["review_status"] = dataReader.GetValue(3);
                    row["filter_status"] = dataReader.GetValue(4);
                    row["rating"] = dataReader.GetValue(5);
                    row["link"] = dataReader.GetValue(7);
                    row["uploaded_at"] = dataReader.GetValue(8);
                    row["category"] = dataReader.GetValue(10);
                    row["subcategory_name"] = dataReader.GetValue(11);
                    row["type"] = dataReader.GetValue(12);
                    row["IDCon"] = dataReader.GetValue(13);
                    row["first_name"] = dataReader.GetValue(20);
                    row["middle_name"] = dataReader.GetValue(21);
                    row["last_name"] = dataReader.GetValue(22);
                    row["email"] = dataReader.GetValue(19);
                    row["specialization"] = dataReader.GetValue(16);
                    row["years_of_experience"] = dataReader.GetValue(14);
                    row["portfolio_link"] = dataReader.GetValue(15);
                    row["age"] = dataReader.GetValue(24);
                    row["birthdate"] = dataReader.GetValue(23);
                    tb.Rows.Add(row);
                }

                labelcount1.Text = "Number of Contents which Found : " + i + " Content";

                Repeater4.DataSource = tb;
                Repeater4.DataBind();
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
    
}
