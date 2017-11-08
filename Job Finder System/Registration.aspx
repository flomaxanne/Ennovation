<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Job_Finder_System.Registration" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <style type="text/css">
      
.VeryPoorStrength
{
background: Red;
color:White;
font-weight:bold;
}
.WeakStrength
{
background: Gray;
color:White;
font-weight:bold;
}
.AverageStrength
{
background: orange;
color:black;
font-weight:bold;
}
.GoodStrength
{
background: blue;
color:White;
font-weight:bold;
}
.ExcellentStrength

{
background: Green;
color:White;
font-weight:bold;
}
        .BarBorder
{
border-style: solid;
border-width: 1px;
width: 100px;
padding:1px;
}

        .waitingdiv {
            background-color: #F5F8FA;
            border: 1px solid #5A768E;
            color: #333333;
            font-size: 93%;
            margin-bottom: 1em;
            margin-top: 0.2em;
            padding: 8px 12px;
            width: 8.4em;
        }

    </style>

    <div class="container">
        <div id="loginbox" style="margin-top:50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <div class="panel-title">Register </div>
                </div>
                <asp:Label ID="lb1" runat="server" Font-Bold="True" ForeColor="#FF3300" style="margin-left:100px;"></asp:Label>

                <div style="padding-top:20px;" class="panel-body">
                    <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>

                   <form id="form1" runat="server">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="PnlUsrDetails" runat="server">
                        <ContentTemplate>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <asp:TextBox class="form-control" ID="txtFirstName" runat="server" placeholder="First Name" ></asp:TextBox>
                        </div>
                        <div style="margin-bottom:25px">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Please Enter Your First Name" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>


                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <asp:TextBox class="form-control" ID="txtLastName" runat="server" placeholder="Last Name" ></asp:TextBox>
                        </div>
                        <div style="margin-bottom:25px">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName" ErrorMessage="Please Enter Your Last Name" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>



                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <asp:TextBox class="form-control" ID="txtUserName"  runat="server" placeholder="Username" AutoPostBack="true" OnTextChanged="txtUserName_TextChanged" ></asp:TextBox>   
                              <asp:Label ID="lblMessage" runat="server" BackColor="#FF3300" ForeColor="Red"></asp:Label>                       
                        </div>
                        <div id="checkusername" runat="server"  Visible="false">
                        <asp:Image ID="imgstatus" runat="server" Width="17px" Height="17px"/>
                        <asp:Label ID="lblStatus" runat="server"></asp:Label>
                        </div>
                        <div class="waitingdiv" id="loadingdiv" style="display:none; margin-left:5.3em">
                       <img src="Images/LoadingImage.gif" alt="Loading" />Please wait...
                        </div>
    

                        <div style="margin-bottom:25px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtUserName" ErrorMessage="Please Enter Your Username" ForeColor="Red"></asp:RequiredFieldValidator>  
                        </div>

                           <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <asp:TextBox class="form-control" ID="txtPassword" TextMode="Password" runat="server" placeholder="Password" ></asp:TextBox>                          
                           
                                 <asp:Label ID="lblhelp1" runat="server"/>
                               
                                <ajaxToolkit:PasswordStrength ID="txtPassword_PasswordStrength" TargetControlID="txtPassword" StrengthIndicatorType="BarIndicator" PrefixText="Strength:" 
                                HelpStatusLabelID="lblhelp1" PreferredPasswordLength="8" MinimumNumericCharacters="1" MinimumSymbolCharacters="1" BarBorderCssClass="BarBorder" 
                                TextStrengthDescriptionStyles="VeryPoorStrength;WeakStrength;
                                AverageStrength;GoodStrength;ExcellentStrength" runat="server" />
                                </div>

                        <div style="margin-bottom:25px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please Enter Your Password" ForeColor="Red"></asp:RequiredFieldValidator>  
                        </div>


                         <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <asp:TextBox class="form-control" ID="txtConfirmPassword" TextMode="Password" runat="server" placeholder="Confirm Password" ></asp:TextBox>                          
                          </div>
                        <div style="margin-bottom:25px;">
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="Password does not match!" ForeColor="Red"> </asp:CompareValidator>
                               </div>



                           <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                            <asp:TextBox class="form-control" ID="txtEmail"  runat="server" placeholder="E-mail" ></asp:TextBox>                          
                        </div>
                        <div style="margin-bottom:25px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please Enter Your Email" ForeColor="Red"></asp:RequiredFieldValidator>  
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid email address!" ForeColor="Red" Width="200px" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </div>

                           <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-tasks"></i></span>
                            <asp:DropDownList ID="ddlUserRole" runat="server" class="form-control"  >
                            <asp:ListItem>--Select a role--</asp:ListItem>
                            <asp:ListItem>Poster</asp:ListItem>
                            <asp:ListItem>Seeker</asp:ListItem>
                           </asp:DropDownList><br />                        
                        </div>
                        <div style="margin-bottom:25px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlUserRole" InitialValue="--Select a role--" ErrorMessage="Please choose one" ForeColor="Red"></asp:RequiredFieldValidator>  
                        </div>

                         

                        <div style="margin-top:10px" align="right" class="form-group">
                            <div class="col-sm-12 controls">
                                <asp:Button class="btn btn-success" ID="btnRegister" runat="server" Text="Register" style="width:100px;margin-bottom:10px;"  OnClick="btnRegister_Click" />&nbsp;&nbsp; 
                            </div>
                        </div>



                        <div class="form-group">
                            <div class="col-md-12 control">
                                <div style="border-top:1px solid#888; padding-top:15px; font-size:85%">
                                    Already have an account!
                                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Login.aspx">&nbsp;Login Here</asp:HyperLink>
                                </div>
                            </div>
                        </div>
                            </ContentTemplate>
</asp:UpdatePanel>
                </form>
                </div>
            </div>
        </div>
    </div>
    

     <script type="text/javascript">
Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
function BeginRequestHandler(sender, args) {
var state = document.getElementById('loadingdiv').style.display;
			if (state == 'block') {
				document.getElementById('loadingdiv').style.display = 'none';
			} else {
				document.getElementById('loadingdiv').style.display = 'block';
			}
args.get_postBackElement().disabled = true;
}
</script>


</asp:Content>
