<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   
    <div class="jumbotron" id="mainnotlog" runat="server">
        <h1>iEgypt</h1>
        <p class="lead">iEgypt is an online platform that acts as a digital society to represent Egypt in all of its’ beautiful colors. Egypt has many talented citizens that would share their great work. Through this platform, content providers like photographers, writers, designers ...etc. can share their pieces of art that reflects Egypt.</p>
    </div>
    <div  class="jumbotron" id="mainlog" runat="server">

        <div style="float:left; width: 660px;">

        <Img ID="Image1" runat="server" style="Height:250px;Width:150px;float:left;margin-right:20px" src="defaultpic.jpg"/>
            <div style="height:55px">
         <asp:label runat="server" ID="type" Font-Size="Larger" Style="float:right" Height="29px" />
            </div>
        <asp:label runat="server" style="float:left;padding-right:10px" Font-Size="Larger" Text="Welcome."/>
        <asp:label runat="server" ID="fname" Font-Size="Larger"/>
        <asp:label runat="server" ID="mname" Font-Size="Larger"/>
        <asp:label runat="server" ID="lname" Font-Size="Larger"/>
        
        </div>
    </div>
    
</asp:Content>
