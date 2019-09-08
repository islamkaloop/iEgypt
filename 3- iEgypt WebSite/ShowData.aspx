<%@ Page Title="ShowData"  Language="C#" MasterPageFile="~/Site.Master"
     AutoEventWireup="true" CodeFile="ShowData.aspx.cs" Inherits="ShowData"   
    %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .search-box{
            position:relative;
            margin-top:5px;
            background:#0094ff;
          
            height:40px;
            border-radius:40px;
            
        }
        td{
            padding-right:25px;
        }
        .search-btn{
            align-items:center;
            justify-content:center;
            float:right;
            display:flex;
            border-radius:50%;
            background:none;
            width:40px;
            height:40px;
        }
        .search-txt{
            border:none;
            background:none;
            outline:none;
            float:left;
            color:white;
            font-size:16px;
            line-height:40px;
            text-align:center;
            padding:0 6px;
        }
        .search{
            margin:20px;
            padding:20px;
            height:250px;
            background:#808080;
            
        }

        .searchlabel{
            margin:0 auto;padding-left:200px;padding-bottom:100px;
        }
    </style>

    <div class="search" runat="server" id="Searchpart" visible="false" style="text-align:center">
        <h3 style="color:#0094ff;left:0%; position:relative;align-self:center;transform:translateX(-5%); top: 0px; width: 619px;">Search </h3>
        <div style="margin:auto auto;width:600px">
            <div runat="server" id="Div1" style="margin:auto auto;float:none">            
            <asp:Label runat="server" Font-Size="Large" Height="40px" ID="lable1S" style="float:left ;padding-right:10px;padding-top:5px;color:white" >Search By Specifc Contributor :</asp:Label>
            <div class="search-box" style="width:500px;float:left" >
                <asp:TextBox  style=" width:400px;text-align:center"  CssClass="search-txt" runat="server" id="TextBox1" placeholder="Type to rsearch" />
                <asp:LinkButton Cssclass="search-btn" runat="server" OnClick="searchby" >   
                    <img style="width:30px; height:30px" src="search.ico" /> 
                </asp:LinkButton>
            </div>
            </div>
          </div>
    </div>
    

    <asp:Label CssClass="searchlabel" Font-Bold="true" Font-Size="Small" runat="server" ID="labelcount1"></asp:Label>

    <div style="padding:5px; width:1px"></div>
    
    <asp:Repeater ID="Repeater3" runat="server" >  
            <ItemTemplate >  
                <div style="margin:0 auto; border:solid;border-width:1px ;padding:10px;margin:5px">  
                    <table style="margin:0 100px;">   
                        <tr>  
                            <th>Contributor <%#Eval("num")%></th>  
                        </tr>  
                        <tr>  
                            <td>First Name</td>  
                            <td><%#Eval("first_name")%></td>  
                        </tr>  
                        <tr>  
                            <td>Middle Name</td>  
                            <td><%#Eval("middle_name")%></td>  
                        </tr>  
                        <tr>  
                            <td>Last Name</td>  
                            <td><%#Eval("last_name")%></td>  
                        </tr>  
                        <tr>  
                            <td>Email</td>  
                            <td><%#Eval("email")%></td>  
                        </tr>  
                        <tr>  
                            <td>Specialization</td>  
                            <td><%#Eval("specialization")%></td>  
                        </tr>  
                        <tr>  
                            <td>Years Of Experience</td>  
                            <td><%#Eval("years_of_experience")%></td>  
                        </tr>  
                        <tr>  
                            <td>Portfolio Link</td>  
                            <td><%#Eval("portfolio_link")%></td>  
                        </tr>  
                        <tr>  
                            <td>Age</td>  
                            <td><%#Eval("age")%></td>  
                        </tr>  
                        <tr>  
                            <td>Birthdate</td>  
                            <td><%#Eval("birthdate")%></td>  
                        </tr>  
                    </table>  
                </div>  
            </ItemTemplate>  
        </asp:Repeater>   
    <asp:Repeater ID="Repeater4" runat="server">  
            <ItemTemplate>  
                <div style="margin:0 auto; border:solid; border-width:1px;padding:10px;margin:5px">  
                    <table style="margin:0 100px;">  
                        <tr>  
                            <th>Original Content <%#Eval("num")%></th>  
                        </tr>  
                        <tr>  
                            <td>Content Link</td>  
                            <td><%#Eval("link")%></td>  
                        </tr>    
                        <tr>  
                            <td>Rating</td>  
                            <td><%#Eval("rating")%></td>  
                        </tr>   
                        <tr>  
                            <td>Uploaded at</td>  
                            <td><%#Eval("uploaded_at")%></td>  
                        </tr>  
                        <tr>  
                            <td>Category</td>  
                            <td><%#Eval("category")%></td>  
                        </tr>  
                        <tr>  
                            <td>Subcategory Name</td>  
                            <td><%#Eval("subcategory_name")%></td>  
                        </tr>  
                        <tr>  
                            <td>Type</td>  
                            <td><%#Eval("type")%></td>  
                        </tr>
                        <tr>  
                            <td>Contributor Name</td>  
                            <td><%#Eval("first_name")+" "+Eval("middle_name")+" "+Eval("last_name")%></td>  
                        </tr>   
                        <tr>  
                            <td>Contributor Email</td>  
                            <td><%#Eval("email")%></td>  
                        </tr>  
                        <tr>  
                            <td>Contributor Specialization</td>  
                            <td><%#Eval("specialization")%></td>  
                        </tr>  
                        <tr>  
                            <td>Contributor Years Of Experience</td>  
                            <td><%#Eval("years_of_experience")%></td>  
                        </tr>  
                        <tr>  
                            <td>Contributor Portfolio Link</td>  
                            <td><%#Eval("portfolio_link")%></td>  
                        </tr>  
                        <tr>  
                            <td>Contributor Age</td>  
                            <td><%#Eval("age")%></td>  
                        </tr>  
                        <tr>  
                            <td>Contributor Birthdate</td>  
                            <td><%#Eval("birthdate")%></td>  
                        </tr>  
                    </table>  
                </div>  
            </ItemTemplate>  
        </asp:Repeater>   
</asp:Content>
