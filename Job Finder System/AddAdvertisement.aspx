<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddAdvertisement.aspx.cs" Inherits="Job_Finder_System.AddAdvertisement" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="js/jquery-1.8.3.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/jquery-ui-1.9.2.custom.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
    
    
    <style type="text/css">
        .auto-style2 {
            width: 162px;
        }
        .auto-style3 {
            width: 151px;
        }
    </style>

    <script type="text/javascript">
        $(function () {
            $("#<%=datetimepickerfrom.ClientID%>").datetimepicker({
                    format: 'LT'
                });
            });


            $(function () {
                $("#<%=datetimepickerto.ClientID%>").datetimepicker({
                    format: 'LT'
                });
            });
    </script>
    <form id="form1" runat="server">

    <asp:ScriptManager ID="ScriptManager" runat="server" EnablePageMethods="true"></asp:ScriptManager>

    <div class="container mainbox" style="margin-top: 50px; margin-bottom: 30px;">
        <div class="col-md-6 form-group">
            <label for="title">Title</label>
            <asp:TextBox class="form-control" ID="txtTitle" runat="server" Width="500px"></asp:TextBox>
        </div>
        <div class="col-md-6 form-group">
            <label for="companyname">Company Name</label>
            <asp:TextBox class="form-control" ID="txtCompany" runat="server" Width="500px"></asp:TextBox>
        </div>
        <div class="col-md-6 form-group">
            <label for="skillsrequired">Skills Required</label>
            <asp:TextBox class="form-control" ID="txtSkills" runat="server" Width="500px"></asp:TextBox>
        </div>
        <div class="col-md-6 form-group">
            <label for="location">Location</label>
            <asp:TextBox class="form-control" ID="txtLocation" runat="server" Width="500px"></asp:TextBox>
        </div>
        <div class="col-md-6 form-group">
            <label for="pay">Pay</label>
            <div class="input-group">
                <span class="input-group-addon">$</span>
                <input type="number" value="1000" min="0" step="0.01" data-number-to-fixed="2" data-number-stepfactor="100" class="form-control currency" id="txtPay" runat="server" style="width: 465px;" />
            </div>

        </div>
        <div class="col-md-6 form-group">
            <label for="timefrom">Time From</label>
            <div class="input-group date">
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-time"></span>
                </span>
                <input type="text" class="form-control" id="datetimepickerfrom" runat="server" clientidmode="static" style="width: 460px;" />
            </div>

        </div>

        <div class="col-md-6 form-group">
            <label for="timeto">Time To</label>
            <div class="input-group date">
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-time"></span>
                </span>
                <input type="text" class="form-control" id="datetimepickerto" runat="server" clientidmode="static" style="width: 460px;" />
            </div>

        </div>

        <div class="col-md-6 form-group">
            <label for="datedetails">Date Details</label>
            <div class="input-group date">
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>

                <input type="text" class="form-control" id="datetimepickerdate" runat="server" clientidmode="static" style="width: 460px;" />
            </div>
        </div>

        <div class="col-md-6 form-group">
            <asp:Label runat="server" Text="Username" />
            <asp:TextBox class="form-control" ID="txtUserName" runat="server" ReadOnly="true" style="width:500px;" />
        </div>

        <div class="col-md-6 form-group">
            <label for="image">Image</label>
            <asp:FileUpload ID="FileUpload" runat="server" Width="500px" />
            <asp:RegularExpressionValidator ID="revFileUpload" runat="server" Text="Invalid Image Format!" ForeColor="Red" ControlToValidate="FileUpload" ValidationExpression="[a-zA-Z0_9].*\b(.jpeg|.JPEG|.jpg|.JPG|.jpe|.JPE|.png|.PNG|.mpp|.MPP|.gif|.GIF)\b"></asp:RegularExpressionValidator>
        </div>

        <div class="col-md-6 form-group" style="margin-bottom: 35px; margin-left: 400px; margin-top: 35px;">
            <asp:Button class="btn btn-success" ID="btnSave" runat="server" Text="Save" Style="width: 120px;" OnClick="btnSave_Click" />
            &nbsp;&nbsp;
                    <asp:Button class="btn btn-primary" ID="btnUpdate" runat="server" Text="Update" Style="width: 120px;" OnClick="btnUpdate_Click" Visible="false" />
            &nbsp;&nbsp;
                    <asp:Button class="btn btn-success" ID="btnClear" runat="server" Text="Cancel" Style="width: 120px;" OnClick="btnClear_Click" />
        </div>

        <asp:GridView ID="gvAd" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True"
            EmptyDataText="No Records Found" GridLines="both" CssClass="table table-bordered table-hover table-striped table-responsive" EmptyDataRowStyle-ForeColor="Red"
            AllowPaging="true" PageSize="10" OnPageIndexChanging="gvAd_PageIndexChanging">
            <Columns>
                <asp:TemplateField HeaderText="Ad ID" ItemStyle-Width="6%">
                    <ItemTemplate>
                        <asp:Label ID="lblAdID" runat="server" Text='<%#Eval("AdID") %>' Visible="true"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Title" ItemStyle-Width="10%">
                    <ItemTemplate>
                        <asp:Label ID="lblTitle" runat="server" Text='<%#Eval("Title") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Company Name" ItemStyle-Width="15%">
                    <ItemTemplate>
                        <asp:Label ID="lblCompany" runat="server" Text='<%#Eval("CompanyName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Location" ItemStyle-Width="15%">
                    <ItemTemplate>
                        <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("Location") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Pay" ItemStyle-Width="8%">
                    <ItemTemplate>
                        <asp:Label ID="lblPay" runat="server" Text='<%#Eval("Pay") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Skills Required" ItemStyle-Width="8%">
                    <ItemTemplate>
                        <asp:Label ID="lblSkills" runat="server" Text='<%#Eval("SkillsRequired") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Time From" ItemStyle-Width="8%">
                    <ItemTemplate>
                        <asp:Label ID="lblTimefrom" runat="server" Text='<%#Eval("TimeFrom") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Time To" ItemStyle-Width="8%">
                    <ItemTemplate>
                        <asp:Label ID="lblTimeto" runat="server" Text='<%#Eval("TimeTo") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date Details" ItemStyle-Width="8%">
                    <ItemTemplate>
                        <asp:Label ID="lblDatedetails" runat="server" Text='<%#Eval("DateDetails") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
              

                <asp:TemplateField HeaderText="Username" ItemStyle-Width="8%">
                    <ItemTemplate>
                        <asp:Label ID="lblUsername" runat="server" Text='<%#Eval("Username") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Image" ItemStyle-Width="10%">
                    <ItemTemplate>
                        <img src='<%#Eval("Image") %>' style="width: 120px; height: 120px;" alt="Image" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Action" ItemStyle-Width="20%">
                    <ItemTemplate>
                        <asp:Button class="btn btn-primary" ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" />
                        <asp:Button class="btn btn-danger" ID="btnDelete" runat="server" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this query?');"
                            OnClick="btnDelete_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

        </asp:GridView>

            <input type="hidden" runat="server" id="hidAdID" />
        </div>
        </form>

</asp:Content>
