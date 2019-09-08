<%@ Page Language="C#" AutoEventWireup="true" CodeFile="contribuer_profile.aspx.cs" Inherits="contribuer_profile" %>

<!DOCTYPE html>
<link href="Content/avada%20kadapra.css" rel="stylesheet" />

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           <h2>CONTRIBUTER PROFILE...</h2> </div>
        <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CellPadding="4" ForeColor="#333333" Width="1120px">
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
                    <asp:BoundField DataField="email" HeaderText="email" />
                    <asp:BoundField DataField="first_name" HeaderText="first_name" />
                    <asp:BoundField DataField="middle_name" HeaderText="middle_name" />
                    <asp:BoundField DataField="last_name" HeaderText="last_name" />
                    <asp:BoundField DataField="birth_date" HeaderText="birth_date" />
                    <asp:BoundField DataField="age" HeaderText="age" />
                    <asp:BoundField DataField="login_date" HeaderText="login_date" />
                    <asp:BoundField DataField="years_of_experience" HeaderText="years_of_experience" />
                    <asp:BoundField DataField="portfolio_link" HeaderText="portfolio_link" />
                    <asp:BoundField DataField="specialization" HeaderText="specialization" />
                    
                </Columns>
        </asp:GridView>
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="back to contents" OnClick="Button1_Click" CssClass="button1" />
    </form>
</body>
</html>
