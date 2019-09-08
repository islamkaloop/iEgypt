<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Manage.aspx.cs" Inherits="Account_Manage" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>

    <div class="row">
        <div class="col-md-12">
            <section id="passwordForm">
                <p runat="server" id="welcom"></p>
                <div runat="server" ID="main" >   
                    <div>
       	            <ul style="
                        width:400px;
                        margin: 0 auto;
		 	            padding-top: 40px;
                        padding-bottom: 40px;
		 	            list-style: none;
		 	            top:20%;
		 	            " >
	                    <li class="control_li"><a class="control_a" runat="server" onserverclick="changeinfo" >Change Your Information</a></li>
	                    <li class="control_li"><a class="control_a" runat="server" onserverclick="changePass">Change Your Password</a></li>
                    </ul>
                </div> 
                </div>
       <Div runat="server" ID="changeinform" Visible="false">  
           <div class="form-horizontal">
                        <h4>Change Information Form</h4>
            <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="FirstName" CssClass="col-md-2 control-label">First name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="FirstName" CssClass="form-control" />
                <asp:label runat="server" id="FirstName1" Visible="false"
                    CssClass="text-danger" Text="The first name field is required."/>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="SecondName" CssClass="col-md-2 control-label">Middle name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="SecondName" CssClass="form-control" />
                <asp:label runat="server" id="SecondName1"  Visible="false"
                    CssClass="text-danger" Text="The middle name field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ThirdName" CssClass="col-md-2 control-label">Last name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ThirdName" CssClass="form-control" />
                <asp:label runat="server" id="ThirdName1"  Visible="false"
                    CssClass="text-danger" Text="The last name field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="mail" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="mail" TextMode="Email" CssClass="form-control" />
                <asp:label runat="server" id="mail1" Visible="false"
                    CssClass="text-danger" Text="The Email field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="birthdate" CssClass="col-md-2 control-label">Birthdate</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="birthdate" TextMode="Date" CssClass="form-control" />
                <asp:label runat="server" id="birthdate1"  Visible="false"
                    CssClass="text-danger" Text="The Birthdate field is required." />
            </div>
        </div>
        <div runat="server" id="viewer" visible="false">
            <div class="form-group" >
                <asp:Label runat="server" AssociatedControlID="working_place_name" CssClass="col-md-2 control-label">Working place name</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="working_place_name"  CssClass="form-control" />
                    <asp:label runat="server" id="working_place_name1"  Visible="false"
                        CssClass="text-danger" Text="The working place name field is required." />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="working_place_type" CssClass="col-md-2 control-label">Working place type</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="working_place_type" CssClass="form-control" />
                    <asp:label runat="server" id="working_place_type1"  Visible="false"
                        CssClass="text-danger" Text="The working place type field is required." />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="wokring_place_description" CssClass="col-md-2 control-label">Wokring place description</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="wokring_place_description" TextMode="MultiLine" CssClass="form-control" />
                    <asp:label runat="server" id="wokring_place_description1"  Visible="false"
                        CssClass="text-danger" Text="The wokring place description field is required." />
                </div>
            </div>
        </div>
        <div  runat="server" ID="contr" visible="false">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="specilization" CssClass="col-md-2 control-label">Specilization</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="specilization"  CssClass="form-control" />
                    <asp:label runat="server" id="specilization1"  Visible="false"
                        CssClass="text-danger" Text="The specilization field is required." />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="portofolio_link" CssClass="col-md-2 control-label">Portofolio link</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="portofolio_link" TextMode="Url" CssClass="form-control" />
                    <asp:label runat="server" id="portofolio_link1"  Visible="false"
                        CssClass="text-danger" Text="The portofolio link field is required." />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="years_experience" CssClass="col-md-2 control-label">Years experience</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="years_experience" TextMode="Number" CssClass="form-control" />
                    <asp:label runat="server" id="years_experience1"  Visible="false"
                        CssClass="text-danger" Text="The years experience field is required." />
                </div>
            </div>
        </div>
        <div runat="server" id="staff" visible="false">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="hire_date" CssClass="col-md-2 control-label">Hire date</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="hire_date" TextMode="Date" CssClass="form-control" />
                    <asp:label runat="server" id="hire_date1"  Visible="false"
                        CssClass="text-danger" Text="The hire date field is required." />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="working_hours" CssClass="col-md-2 control-label">Working hours</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="working_hours" TextMode="Number" CssClass="form-control" />
                    <asp:label runat="server" id="working_hours1"  Visible="false"
                        CssClass="text-danger" Text="The working hours field is required." />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="payment_rate" CssClass="col-md-2 control-label">Payment rate</asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="payment_rate" CssClass="form-control" />
                    <asp:label runat="server" id="payment_rate1"  Visible="false"
                        CssClass="text-danger" Text="The payment rate field is required." />
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="changedata" Text="Edit" CssClass="btn btn-default" />
            </div>
        </div>
   </Div>
                </Div>
                <Div runat="server" ID="changepassword" Visible="false">    
                    <div class="form-horizontal">
                        <h4>Change Password Form</h4>
                        <div class="form-group">
                            <asp:Label runat="server" ID="CurrentPasswordLabel" AssociatedControlID="CurrentPassword" CssClass="col-md-2 control-label">Current password</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="CurrentPassword" TextMode="Password" CssClass="form-control" />
                            <asp:label runat="server" id="CurrentPass" Visible="false"
                    CssClass="text-danger" Text="The current password field is required." /> 
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" ID="NewPasswordLabel" AssociatedControlID="NewPassword" CssClass="col-md-2 control-label">New password</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="NewPassword" TextMode="Password" CssClass="form-control" />
                            <asp:label runat="server" id="NewPass" Visible="false"
                    CssClass="text-danger" Text="The new password field is required." />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" ID="ConfirmNewPasswordLabel" AssociatedControlID="ConfirmNewPassword" CssClass="col-md-2 control-label">Confirm new password</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="ConfirmNewPassword" TextMode="Password" CssClass="form-control" />
                            <asp:label runat="server" id="ConfirmNewPAss" Visible="false"
                    CssClass="text-danger" Text="The confirm new password field is required." />
                            </div>
                            <div class="form-group">
                            <div class="col-md-offset-2 col-md-10">
                        <asp:Button runat="server" Text="Change password" OnClick="ChangePassword_Click" CssClass="btn btn-default" style="margin-top:15px"/>
                            </div>
                          </div>
                        </div>
                    </div>
                </Div>
            </section>

            
        </div>
    </div>

</asp:Content>
