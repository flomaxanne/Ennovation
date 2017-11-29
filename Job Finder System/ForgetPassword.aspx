<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="Job_Finder_System.ForgetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div id="forgetpassword" style="margin-top: 50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <div class="panel-title">Password Recovery</div>
                    </div>
                    <div style="padding-top: 30px;" class="panel-body">
                        <div style="display: none" id="forgetpassword-alert" class="alert alert-danger col-sm-12"></div>
                        <div class="input-group" style="width: 508px;">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope">
                                <asp:Label class="control-label" runat="server"></asp:Label></i></span>
                            <asp:TextBox class="form-control" ID="txtEmail" placeholder="Email" runat="server" />
                        </div>
                        <div style="margin-bottom: 15px">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid email address!" ForeColor="Red" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group">
                            <div align="right">
                                <asp:Button class="btn btn-success" ID="Button1" runat="server" Text="Submit" Style="width: 150px;" OnClick="Button1_Click" />&nbsp;&nbsp;
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-14 control" style="margin-top: 10px;">
                                <div style="border-top: 1px solid#888; padding-top: 10px; font-size: 85%">
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Login.aspx">&nbsp;Back to Login Page</asp:HyperLink>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
