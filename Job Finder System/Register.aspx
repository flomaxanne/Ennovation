<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Job_Finder_System.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title></title>
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
padding:0px;
}

    </style>
</head>
<body>
        <div class="container">
            <div id="loginbox" style="margin-top: 50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <div class="panel-title">Register </div>
                    </div>
                    <asp:Label ID="lb1" runat="server" Font-Bold="True" ForeColor="#FF3300" Style="margin-left: 100px;"></asp:Label>

                    <div style="padding-top: 20px;" class="panel-body">
                        <div style="display: none" id="login-alert" class="alert alert-danger col-sm-12"></div>

                        <form id="form2" runat="server">
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="PnlUsrDetails" runat="server">
                                <ContentTemplate>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <asp:TextBox class="form-control" ID="txtFirstName" runat="server" placeholder="First Name"></asp:TextBox>
                                    </div>
                                    <div style="margin-bottom: 25px">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Please Enter Your First Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>


                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <asp:TextBox class="form-control" ID="txtLastName" runat="server" placeholder="Last Name"></asp:TextBox>
                                    </div>
                                    <div style="margin-bottom: 25px">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName" ErrorMessage="Please Enter Your Last Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <asp:TextBox class="form-control" ID="txtUserName" runat="server" placeholder="Username"></asp:TextBox>
                                    </div>
                                    <div style="margin-bottom: 25px;">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtUserName" ErrorMessage="Please Enter Your Username" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <asp:TextBox class="form-control" ID="txtPassword" TextMode="Password" runat="server" placeholder="Password"></asp:TextBox>
                                    </div>
                                    <div>
                                        <asp:Label ID="lblhelp1" runat="server" />

                                        <ajaxToolkit:PasswordStrength ID="txtPassword_PasswordStrength" TargetControlID="txtPassword" StrengthIndicatorType="BarIndicator" PrefixText="Strength:"
                                            HelpStatusLabelID="lblhelp1" PreferredPasswordLength="8" MinimumNumericCharacters="1" MinimumSymbolCharacters="1" BarBorderCssClass="BarBorder"
                                            TextStrengthDescriptionStyles="VeryPoorStrength;WeakStrength;
                                AverageStrength;GoodStrength;ExcellentStrength"
                                            runat="server" />
                                    </div>

                                    <div style="margin-bottom: 25px;">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please Enter Your Password" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>


                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <asp:TextBox class="form-control" ID="txtConfirmPassword" TextMode="Password" runat="server" placeholder="Confirm Password"></asp:TextBox>
                                    </div>
                                    <div style="margin-bottom: 25px;">
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="Password does not match!" ForeColor="Red"> </asp:CompareValidator>
                                    </div>

                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                        <asp:TextBox class="form-control" ID="txtEmail" runat="server" placeholder="E-mail"></asp:TextBox>
                                    </div>
                                    <div style="margin-bottom: 25px;">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please Enter Your Email" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid email address!" ForeColor="Red" Width="200px" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    </div>

                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-tasks"></i></span>
                                        <asp:DropDownList ID="ddlUserRole" runat="server" class="form-control">
                                            <asp:ListItem>--Select a role--</asp:ListItem>
                                            <asp:ListItem>Poster</asp:ListItem>
                                            <asp:ListItem>Seeker</asp:ListItem>
                                        </asp:DropDownList><br />
                                    </div>
                                    <div style="margin-bottom: 25px;">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlUserRole" InitialValue="--Select a role--" ErrorMessage="Please choose one" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>



                                    <div style="margin-top: 10px" align="right" class="form-group">
                                        <div class="col-sm-12 controls">
                                            <asp:Button class="btn btn-success" ID="btnRegister" runat="server" Text="Register" Style="width: 100px; margin-bottom: 10px;" OnClick="btnRegister_Click" />&nbsp;&nbsp; 
                                        </div>
                                    </div>



                                    <div class="form-group">
                                        <div class="col-md-12 control">
                                            <div style="border-top: 1px solid#888; padding-top: 15px; font-size: 85%">
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

</body>
</html>
