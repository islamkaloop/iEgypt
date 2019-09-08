using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Searcher : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["SearchBy"] != null)
        {
            String SearchBy = Request.QueryString["SearchBy"];
            int SearchByInt = int.Parse(SearchBy);
            if (SearchByInt == 1)
            {

            }
            else
            {
                lable1S.Text = "Contributor Name :";
                searchbox2.Visible = false;
            }
        }
        
    }
    protected void searchby(object sender, EventArgs args)
    {
        if (Request.QueryString["SearchBy"] != null)
        {
            String word1 = TextBox1.Text;
            String word2 = TextBox2.Text;
            if (int.Parse(Request.QueryString["SearchBy"]) == 1)
            {
                if (word1 != null & word1 != null)
                {
                    SqlConnection cnn = null;
                    SqlDataReader dataReader=null;
                    
                    try {
                        cnn = DBcontroller.MakeConnection(this);
                        cnn.Open();


                        SqlCommand command;

                        String sql = " ";


                        sql = "exec Original_Content_Search '" + word2 + "','" + word1 + "'";

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
                            tb.Rows.Add(row);
                        }

                        labelcount.Text = "Number of Contents which Found : " + i + " Content";

                        Repeater2.DataSource = tb;
                        Repeater2.DataBind();

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
            if (int.Parse(Request.QueryString["SearchBy"]) == 2)
            {
                if (word1 != null)
                {
                    SqlConnection cnn = null;
                    SqlDataReader dataReader=null;
                    try {
                        cnn = DBcontroller.MakeConnection(this);
                        cnn.Open();


                        SqlCommand command;

                        String sql = " ";

                        sql = "exec Contributor_Search '" + word1 + "'";

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

                        labelcount.Text = "Number of Contributors which Found : " + i + " Contributor";

                        Repeater1.DataSource = tb;
                        Repeater1.DataBind();
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
        }
}