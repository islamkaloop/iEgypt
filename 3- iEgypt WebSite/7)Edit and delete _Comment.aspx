<%@ Page Language="C#" AutoEventWireup="true" CodeFile="7)Edit and delete _Comment.aspx.cs" Inherits="_9_Edit_Comment" %>

<!DOCTYPE html>
<link href="Content/avada%20kadapra.css" rel="stylesheet" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
      <h2>Edit_Comment ...</h2>
    <p>&nbsp;</p> 
    <form id="form1" runat="server">
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CellPadding="4" ForeColor="#333333" Width="1311px">
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />

                 <Columns>
                      <asp:BoundField DataField="rating" HeaderText="rating" />
                      <asp:BoundField DataField="link" HeaderText="link" />
                      <asp:BoundField DataField="category_type" HeaderText="category_type" />
                      <asp:BoundField DataField="subcategory_name" HeaderText="subcategory_name" />
                      <asp:BoundField DataField="type" HeaderText="type" />
                      <asp:BoundField DataField="date" HeaderText="date" />
                      <asp:BoundField DataField="text" HeaderText="text" />
                   
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="link" Text="select comment" runat="server" CommandArgument='<%# Eval("original_content_id") %>' OnClick="link_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </p>
        <p>
            <asp:Label ID="Label1" runat="server" Text="last_time"></asp:Label>
        &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" CssClass="input"></asp:TextBox>
            &nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="DELETE" OnClick="Button2_Click" CssClass="button1" />
        </p>
        <br />
        <asp:Label ID="Label2" runat="server" Text="updated_text"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" CssClass="input"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="UPDATE" OnClick="Button1_Click" CssClass="button1" />
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:Button ID="Button3" runat="server" Text="back to home" OnClick="Button3_Click" CssClass="button1" />
    </form>
</body>
</html>
