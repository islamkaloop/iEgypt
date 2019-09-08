<%@ Page Language="C#" AutoEventWireup="true" CodeFile="the viewer page.aspx.cs" Inherits="the_viewer_page" %>

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
        <div class="auto-style1">
        <div>
           <h2>viewer can do these fucnctions...</h2> </div>
            <asp:Button ID="Button1" runat="server" Text="create event" OnClick="Button1_Click" CssClass="button1" />
            <br />
            <asp:Button ID="Button2" runat="server" Text="apply existing request" OnClick="Button2_Click" CssClass="button1" />
            <br />
            <asp:Button ID="Button3" runat="server" Text="apply new request" OnClick="Button3_Click" CssClass="button1" />
            <br />
            <asp:Button ID="Button4" runat="server" Text="delete new request" OnClick="Button4_Click" CssClass="button1" />
            <br />
            <asp:Button ID="Button5" runat="server" Text="rating original content" OnClick="Button5_Click" CssClass="button1" />
            <br />
            <asp:Button ID="Button6" runat="server" Text="write comment" OnClick="Button6_Click" CssClass="button1" />
            <br />
            <asp:Button ID="Button7" runat="server" Text="edit_delete comment" OnClick="Button7_Click" CssClass="button1" />
            <br />
            <asp:Button ID="Button8" runat="server" Text="create_ad" OnClick="Button8_Click" CssClass="button1" />
            <br />
            <asp:Button ID="Button9" runat="server" Text="edit_delete_ad" OnClick="Button9_Click" CssClass="button1" />
            <br />
            <asp:Button ID="Button10" runat="server" Text="show new content" OnClick="Button10_Click" CssClass="button1" />
             <br />
            <asp:Button ID="Button12" runat="server" Text="back to main" OnClick="Button12_Click" CssClass="button1" />
            <br />
            <br />
        </div>
        <asp:Label ID="Label1" runat="server" Text="@ beltagy"></asp:Label>
    </form>
</body>
</html>
