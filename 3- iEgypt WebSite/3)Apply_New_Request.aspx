<%@ Page Language="C#" AutoEventWireup="true" CodeFile="3)Apply_New_Request.aspx.cs" Inherits="_5_Apply_New_Request" %>

<!DOCTYPE html>
<link href="Content/avada%20kadapra.css" rel="stylesheet" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           <h2>Apply_New_Request ....</h2> </div>
        <br />
        <br />
        <asp:GridView ID="GridView1" AutoGenerateColumns="false" runat="server" CellPadding="4" ForeColor="#333333" Height="185px" Width="1146px">
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
                    <asp:BoundField DataField="years_of_experience" HeaderText="years_of_experience" />
                    <asp:BoundField DataField="portfolio_link" HeaderText="portfolio_link" />
                    <asp:BoundField DataField="specialization" HeaderText="specialization" />
                    
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="link" Text="select contributer" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="link_Click"  />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

        </asp:GridView>
        <br />
        <asp:Label ID="Label1" runat="server" Text="INFORMATION"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server" CssClass="button1"></asp:TextBox>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="APPLY" OnClick="Button1_Click" CssClass="button1" />
    &nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <br />
        <br />
<asp:Button ID="Button2" runat="server" Text="back to home" OnClick="Button2_Click" CssClass="button1" />
    </form>
</body>
</html>
