<%@ Page Language="C#" AutoEventWireup="true" CodeFile="2)Apply_Existing_Request.aspx.cs" Inherits="_4_Apply_Existing_Request" %>

<!DOCTYPE html>
<link href="Content/avada%20kadapra.css" rel="stylesheet" />
<link href="Content/avada%20kadapra.css" rel="stylesheet" />
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
          <h2>Apply_Existing_Request....</h2>
            <br />
        </div>
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" style="margin-right: 81px; direction: ltr;" Width="1266px" BorderColor="Black" CellPadding="4" ForeColor="#333333">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="review_status" HeaderText="review_status" />
                    <asp:BoundField DataField="filter_status" HeaderText="filter_status" />
                    <asp:BoundField DataField="rating" HeaderText="rating" />
                    <asp:BoundField DataField="link" HeaderText="link" />
                    <asp:BoundField DataField="category_type" HeaderText="category_type" />
                    <asp:BoundField DataField="subcategory_name" HeaderText="subcategory_name" />                  
                     
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="link" Text="select content" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="link_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
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
            </asp:GridView>
        </p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="APPLY" OnClick="Button1_Click" Font-Italic="True" CssClass="button1" />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Text="back to home" OnClick="Button2_Click" CssClass="button1" />
    </form>
</body>
</html>
