<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="delCom" runat="server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" SelectCommand="SELECT [date], [text] FROM [comment]"></asp:SqlDataSource>
        <asp:TextBox ID="typetxt" runat="server" OnTextChanged="typetxt_TextChanged" Height="46px"></asp:TextBox>
            <asp:Button ID="btn1" runat="server" OnClick="btn1_Click" Text="create type" Height="42px" style="margin-top: 0px" Width="110px" />
    <div>
    
    </div>
        <p id="contentgrid">
        <asp:TextBox ID="Contcrea" runat="server" Height="31px" OnTextChanged="TextBox1_TextChanged" Width="275px"></asp:TextBox>
        <asp:Button ID="btncat" runat="server" Height="34px" OnClick="Button1_Click" Text="create category" Width="129px" />
            <asp:GridView ID="contentgrid" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="id" DataSourceID="SqlDataSource3" Height="164px" OnSelectedIndexChanged="contentgrid_SelectedIndexChanged1" Width="714px">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="link" HeaderText="link" SortExpression="link" />
                    <asp:BoundField DataField="uploaded_at" HeaderText="uploaded_at" SortExpression="uploaded_at" />
                    <asp:BoundField DataField="contributer_id" HeaderText="contributer_id" SortExpression="contributer_id" />
                    <asp:BoundField DataField="category_type" HeaderText="category_type" SortExpression="category_type" />
                    <asp:BoundField DataField="subcategory_name" HeaderText="subcategory_name" SortExpression="subcategory_name" />
                    <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="Red" BorderStyle="Solid" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
            </asp:GridView>
        <asp:Button ID="btncontent" runat="server" OnClick="btncontent_Click" Text="delete content" Height="36px" Width="168px" />
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" SelectCommand="SELECT * FROM [Content]"></asp:SqlDataSource>
        </p>
        <asp:GridView ID="delCom1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="date,original_content_id,Viewer_id" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Height="190px" OnSelectedIndexChanged="delCom_SelectedIndexChanged" Width="730px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="original_content_id" HeaderText="original_content_id" ReadOnly="True" SortExpression="original_content_id" />
                <asp:BoundField DataField="Viewer_id" HeaderText="Viewer_id" ReadOnly="True" SortExpression="Viewer_id" />
                <asp:BoundField DataField="date" HeaderText="date" ReadOnly="True" SortExpression="date" />
                <asp:BoundField DataField="text" HeaderText="text" SortExpression="text" />
                <asp:CommandField ShowSelectButton="True" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#0033CC" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:Button ID="delcomm" runat="server" OnClick="delcomm_Click" Text="delete comment" Width="184px" Height="45px" />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" SelectCommand="SELECT [date], [text], [original_content_id], [Viewer_id] FROM [comment]"></asp:SqlDataSource>
        <asp:GridView ID="Assign" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="id" DataSourceID="SqlDataSource4" GridLines="Vertical" Width="539px">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="new_request_id" HeaderText="new_request_id" SortExpression="new_request_id" />
                <asp:BoundField DataField="upload" HeaderText="upload" SortExpression="upload" />
                <asp:CommandField ShowSelectButton="True" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#003300" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:GridView ID="Cont" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="id" DataSourceID="SqlDataSource5" ForeColor="Black" GridLines="Vertical" Width="450px">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="years_of_experience" HeaderText="years_of_experience" SortExpression="years_of_experience" />
                <asp:BoundField DataField="portfolio_link" HeaderText="portfolio_link" SortExpression="portfolio_link" />
                <asp:BoundField DataField="specialization" HeaderText="specialization" SortExpression="specialization" />
                <asp:BoundField DataField="notified_id" HeaderText="notified_id" SortExpression="notified_id" />
                <asp:CommandField ShowSelectButton="True" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:Button ID="btnA" runat="server" Height="42px" OnClick="Button1_Click1" Text="Assign request" Width="287px" />
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" SelectCommand="SELECT * FROM [Contributor]"></asp:SqlDataSource>
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="id" DataSourceID="SqlDataSource6" ForeColor="Black" GridLines="None" Width="215px">
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
                <Columns>
                    <asp:BoundField DataField="Count" HeaderText="Count" ReadOnly="True" SortExpression="Count" />
                </Columns>
                <FooterStyle BackColor="Tan" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <SortedAscendingCellStyle BackColor="#FAFAE7" />
                <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                <SortedDescendingCellStyle BackColor="#E1DB9C" />
                <SortedDescendingHeaderStyle BackColor="#C2A47B" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" SelectCommand="SELECT * FROM [New_Content]"></asp:SqlDataSource>
        </p>
        <p>
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" SelectCommand="Most_Requested_Content" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" SelectCommand="Workingplace_Category_Relation" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource7" ForeColor="Black" GridLines="Vertical" Height="160px" Width="600px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="working_place_type" HeaderText="working_place_type" SortExpression="working_place_type" />
                    <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                    <asp:BoundField DataField="Requested_Count" HeaderText="Requested_Count" ReadOnly="True" SortExpression="Requested_Count" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>
        </p>
        <p>
            <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" SelectCommand="Show_Possible_Contributors" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:GridView ID="GridView3" runat="server" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource8" OnSelectedIndexChanged="GridView3_SelectedIndexChanged" Width="605px">
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>
        </p>
        <p>
            &nbsp;</p>
        <p id="Stf">
            <asp:GridView ID="GridView7" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="id,id1,id2,id3,id4" DataSourceID="SqlDataSource9" ForeColor="Black" GridLines="None">
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
                <Columns>
                    <asp:BoundField DataField="seen_at" HeaderText="seen_at" SortExpression="seen_at" />
                    <asp:BoundField DataField="sent_at" HeaderText="sent_at" SortExpression="sent_at" />
                    <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                    <asp:BoundField DataField="location" HeaderText="location" SortExpression="location" />
                    <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                    <asp:BoundField DataField="time" HeaderText="time" SortExpression="time" />
                    <asp:BoundField DataField="entertainer" HeaderText="entertainer" SortExpression="entertainer" />
                    <asp:BoundField DataField="information" HeaderText="information" SortExpression="information" />
                </Columns>
                <FooterStyle BackColor="Tan" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <SortedAscendingCellStyle BackColor="#FAFAE7" />
                <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                <SortedDescendingCellStyle BackColor="#E1DB9C" />
                <SortedDescendingHeaderStyle BackColor="#C2A47B" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" SelectCommand="Show_Notification" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="user_id" SessionField="ID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource10" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="GridView5_SelectedIndexChanged" Width="616px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="content_manager_id" HeaderText="content_manager_id" SortExpression="content_manager_id" />
                    <asp:BoundField DataField="reviewer_id" HeaderText="reviewer_id" SortExpression="reviewer_id" />
                    <asp:CheckBoxField DataField="review_status" HeaderText="review_status" SortExpression="review_status" />
                    <asp:CheckBoxField DataField="filter_status" HeaderText="filter_status" SortExpression="filter_status" />
                    <asp:BoundField DataField="rating" HeaderText="rating" SortExpression="rating" />
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" SelectCommand="SELECT * FROM [Original_Content]"></asp:SqlDataSource>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click2" Text="accept" Width="148px" />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="reject" Width="141px" />
            <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="id" DataSourceID="SqlDataSource12" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="GridView6_SelectedIndexChanged" Width="624px">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="content_manager_id" HeaderText="content_manager_id" SortExpression="content_manager_id" />
                    <asp:BoundField DataField="reviewer_id" HeaderText="reviewer_id" SortExpression="reviewer_id" />
                    <asp:CheckBoxField DataField="review_status" HeaderText="review_status" SortExpression="review_status" />
                    <asp:CheckBoxField DataField="filter_status" HeaderText="filter_status" SortExpression="filter_status" />
                    <asp:BoundField DataField="rating" HeaderText="rating" SortExpression="rating" />
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" SelectCommand="filtered" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:Button ID="Button3" runat="server" Height="29px" OnClick="Button3_Click" Text="accept" Width="127px" />
            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="reject" Width="116px" />
            <asp:SqlDataSource ID="SqlDataSource11" runat="server"></asp:SqlDataSource>
        </p>
        <p>
             <br />
            <asp:Button ID="Button12" runat="server" Text="back to main" OnClick="Button12_Click"/>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
