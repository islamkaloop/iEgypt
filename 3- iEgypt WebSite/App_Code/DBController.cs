using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;

/// <summary>
/// Summary description for Class1
/// </summary>
public static class DBcontroller
{
    public static SqlConnection MakeConnection(System.Web.UI.Page P )
    {
        try {
            string connetionString = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
            return new SqlConnection(connetionString);
        }catch(SqlException e)
        {
            string script = "alert(\"" + e.Message + "\");";
            ScriptManager.RegisterStartupScript(P,P. GetType(),
                                  "ServerControlScript", script, true);
        }
        return null;
    }
    public static SqlConnection MakeConnection(MasterPage P)
    {
        try
        {
            string connetionString =ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
            return new SqlConnection(connetionString);
        }
        catch (SqlException e)
        {
            string script = "alert(\"" + e.Message + "\");";
            ScriptManager.RegisterStartupScript(P, P.GetType(),
                                  "ServerControlScript", script, true);
        }
        return null;
    }
    public static String getusertype(String ID, System.Web.UI.Page P)
    {
        SqlConnection cnn=null;
        SqlDataReader dataReader=null;
        try
        {
            cnn = DBcontroller.MakeConnection(P);
            cnn.Open();
            String sql1 = "select * from Viewer where id ='" + ID + "'";
            String sql2 = "select * from Contributor where id ='" + ID + "'";
            String sql3 = "select * from Content_Manager where id ='" + ID + "'";
            String sql4 = "select * from Reviewer where id ='" + ID + "'";

            SqlCommand command1 = new SqlCommand(sql1, cnn);
            SqlCommand command2 = new SqlCommand(sql2, cnn);
            SqlCommand command3 = new SqlCommand(sql3, cnn);
            SqlCommand command4 = new SqlCommand(sql4, cnn);
            String s = "";
            dataReader = command1.ExecuteReader();
            if (dataReader.Read())
            {
                s = "Viewer";
            }
            dataReader = command2.ExecuteReader();
            if (dataReader.Read())
            {
                s = "Contributer";
            }
            dataReader = command3.ExecuteReader();
            if (dataReader.Read())
            {
                s = "Content Manager";
            }
            dataReader = command4.ExecuteReader();
            if (dataReader.Read())
            {
                s = "Reviewer";
            }


            return s;
        }
        catch (SqlException e)
        {
            string script = "alert(\"" + e.Message + "\");";
            ScriptManager.RegisterStartupScript(P, P.GetType(),
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
        return null;
    }
    public static String getusertype(String ID, MasterPage P)
    {
        SqlConnection cnn = null;
        SqlDataReader dataReader = null;
        try
        {
            cnn = DBcontroller.MakeConnection(P);
            cnn.Open();
            String sql1 = "select * from Viewer where id ='" + ID + "'";
            String sql2 = "select * from Contributor where id ='" + ID + "'";
            String sql3 = "select * from Content_Manager where id ='" + ID + "'";
            String sql4 = "select * from Reviewer where id ='" + ID + "'";

            SqlCommand command1 = new SqlCommand(sql1, cnn);
            SqlCommand command2 = new SqlCommand(sql2, cnn);
            SqlCommand command3 = new SqlCommand(sql3, cnn);
            SqlCommand command4 = new SqlCommand(sql4, cnn);
            String s = "";
            dataReader = command1.ExecuteReader();
            if (dataReader.Read())
            {
                s = "Viewer";
            }
            dataReader = command2.ExecuteReader();
            if (dataReader.Read())
            {
                s = "Contributer";
            }
            dataReader = command3.ExecuteReader();
            if (dataReader.Read())
            {
                s = "Content Manager";
            }
            dataReader = command4.ExecuteReader();
            if (dataReader.Read())
            {
                s = "Reviewer";
            }


            return s;
        }
        catch (SqlException e)
        {
            string script = "alert(\"" + e.Message + "\");";
            ScriptManager.RegisterStartupScript(P, P.GetType(),
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
        return null;
    }
}