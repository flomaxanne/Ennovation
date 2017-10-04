<%@ Page Language="C#"  AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Job_Finder_System.Login" %>
     

    <script type="text/javascript">
        function Validate() {
            var Username = document.getElementById('txtUserName');
            var Password = document.getElementById('txtPwd');
            if ((Username.value == '') || (Password.value == '')) {
                alert('UserName or Password should not be blank');
                return false;
            }
            else {
                return true;
            }
        }
    </script>

     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <div class="container">
        <div id="loginbox" style="margin-top:50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <div class="panel-title">Log In</div>
                </div>
                <asp:Label ID="lb1" runat="server" Font-Bold="True" ForeColor="#FF3300" style="margin-left:100px;"></asp:Label>

                <div style="padding-top:20px;" class="panel-body">
                    <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>

                    <form id="form1" class="form-horizontal" role="form" runat="server">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <asp:TextBox class="form-control" ID="txtUserName" runat="server" placeholder="Username" ></asp:TextBox>
                        </div>
                        <div style="margin-bottom:25px">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUserName" ErrorMessage="Please Enter Your Username" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>

                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <asp:TextBox class="form-control" ID="txtPwd" TextMode="Password" runat="server" placeholder="Password"></asp:TextBox>                          
                        </div>
                        <div style="margin-bottom:25px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPwd" ErrorMessage="Please Enter Your Password" ForeColor="Red"></asp:RequiredFieldValidator>  
                        </div>

                        <div style="margin-top:10px" align="right" class="form-group">
                            <div class="col-sm-12 controls">
                                <asp:Button class="btn btn-success" ID="btnLogin" runat="server" Text="Login" style="width:100px;" OnClientClick="Validate()" OnClick="btnLogin_Click" />&nbsp;&nbsp; 
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12 control">
                                <div style="border-top:1px solid#888; padding-top:15px; font-size:85%">
                                    Don't have an account!
                                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Registration.aspx">&nbsp;Register Here</asp:HyperLink>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
      

