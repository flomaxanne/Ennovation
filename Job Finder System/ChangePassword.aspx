<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="Job_Finder_System.ChangePassword" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .VeryPoorStrength {
            background: Red;
            color: White;
            font-weight: bold;
        }

        .WeakStrength {
            background: Gray;
            color: White;
            font-weight: bold;
        }

        .AverageStrength {
            background: orange;
            color: black;
            font-weight: bold;
        }

        .GoodStrength {
            background: blue;
            color: White;
            font-weight: bold;
        }

        .ExcellentStrength {
            background: Green;
            color: White;
            font-weight: bold;
        }

        .BarBorder {
            border-style: solid;
            border-width: 1px;
            width: 100px;
            padding: 0px;
        }
    </style>
    <form id="form" runat="server">
    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
    <div class="container">
        <div id="changepassword" style="margin-top: 30px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <div class="panel-title">Change Password</div>
                </div>
                <div style="padding-top: 30px;" class="panel-body">
                    <div style="display: none" id="changepassword-alert" class="alert alert-danger col-sm-12"></div>
                
                        <div class="form-group">
                            <asp:Label class="col-sm-4 control-label" runat="server" Text="Current Password" />
                            <div class="col-sm-8">
                                <asp:TextBox class="form-control" ID="txtCurrentPwd" TextMode="Password" runat="server" style="width:300px;" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCurrentPwd" ErrorMessage="Enter Current Password" ForeColor="Red" Width="250px"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label class="col-sm-4 control-label" runat="server" Text="New Password" />
                            <div class="col-sm-8">
                                <asp:TextBox class="form-control" ID="txtNewPwd" TextMode="Password" runat="server" style="width:300px;" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewPwd" ErrorMessage="Enter New Password" ForeColor="Red" Width="250px"></asp:RequiredFieldValidator>
                            </div>
                            <asp:Label ID="lblhelp1" runat="server" />

                                <ajaxToolkit:PasswordStrength ID="txtPassword_PasswordStrength" TargetControlID="txtNewPwd" StrengthIndicatorType="BarIndicator" PrefixText="Strength:"
                                    HelpStatusLabelID="lblhelp1" PreferredPasswordLength="8" MinimumNumericCharacters="1" MinimumSymbolCharacters="1" BarBorderCssClass="BarBorder"
                                    TextStrengthDescriptionStyles="VeryPoorStrength;WeakStrength;
                                AverageStrength;GoodStrength;ExcellentStrength"
                                    runat="server" />
                        </div>
                        <div class="form-group">
                            <asp:Label class="col-sm-4 control-label" runat="server" Text="Confirm New Password" />
                            <div class="col-sm-8">
                                <asp:TextBox class="form-control" ID="txtConPwd" TextMode="Password" runat="server" style="width:300px;" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtConPwd" ErrorMessage="Enter Confirm Password" ForeColor="Red" Width="250px"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password does not match" ControlToCompare="txtNewPwd" ControlToValidate="txtConPwd" ForeColor="Red" Width="200px"></asp:CompareValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-9 col-sm-offset-2">
                                <asp:Button class="btn btn-success" ID="btnSubmit" runat="server" Text="Submit" Style="width: 100px;" OnClick="btnSubmit_Click" />&nbsp;&nbsp;
                                <input class="btn btn-success" id="Reset1" type="reset" value="Reset" style="width: 150px;" />
                            </div>
                        </div>
                   
                </div>
            </div>
        </div>
    </div>
        </form>
</asp:Content>
