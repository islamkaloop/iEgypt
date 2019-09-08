<%@ Page Language="C#" AutoEventWireup="true" CodeFile="10)show new content.aspx.cs" Inherits="_10_show_new_content" %>

<!DOCTYPE html>
<link href="Content/avada%20kadapra.css" rel="stylesheet" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            direction: ltr;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
          <h2> SHOW NEW CONTENT ALONG WITH THE CONTRIBUTER ...</h2> </div>
        <div class="auto-style1">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CellPadding="4" ForeColor="#333333">
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
                    <asp:BoundField DataField="link" HeaderText="link" />
                    <asp:BoundField DataField="uploaded_at" HeaderText="uploaded_at" />
                    <asp:BoundField DataField="category_type" HeaderText="category_type" />
                    <asp:BoundField DataField="link" HeaderText="link" />
                    <asp:BoundField DataField="category_type" HeaderText="category_type" />
                    <asp:BoundField DataField="subcategory_name" HeaderText="subcategory_name" />
                    <asp:BoundField DataField="type" HeaderText="type" />
                    <asp:BoundField DataField="first_name" HeaderText="first_name" />
                    <asp:BoundField DataField="middle_name" HeaderText="middle_name" />
                    <asp:BoundField DataField="last_name" HeaderText="last_name" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="link" Text="to contributer" runat="server" CommandArgument='<%# Eval("contributer_id") %>' OnClick="link_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
        </asp:GridView>
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="back_to_home" OnClick="Button1_Click" CssClass="button1" />
    </form>
</body>
</html>
