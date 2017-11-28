<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="JobsApplied.aspx.cs" Inherits="Job_Finder_System.JobsApplied" %>


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
    
    <title></title>
     <form id="form1" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 162px;
        }
        .auto-style3 {
            width: 151px;
        }
    </style>

    <asp:ScriptManager ID="ScriptManager" runat="server" EnablePageMethods="true"></asp:ScriptManager>

        <asp:GridView ID="gvAd" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True"
            EmptyDataText="No Records Found" GridLines="both" CssClass="table table-bordered table-hover table-striped table-responsive" EmptyDataRowStyle-ForeColor="Red"
            AllowPaging="true" PageSize="10" OnPageIndexChanging="gvAd_PageIndexChanging">
            <Columns>
                <asp:TemplateField HeaderText="ID" ItemStyle-Width="6%">
                    <ItemTemplate>
                        <asp:Label ID="lblID" runat="server" Text='<%#Eval("ID") %>' Visible="true"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>              
                <asp:TemplateField HeaderText="Company Name" ItemStyle-Width="15%">
                    <ItemTemplate>
                        <asp:Label ID="lblCompany" runat="server" Text='<%#Eval("CompanyName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Title" ItemStyle-Width="15%">
                    <ItemTemplate>
                        <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("Title") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>  
                
             
                
                 <asp:TemplateField HeaderText="Image" ItemStyle-Width="8%">
                    <ItemTemplate>
                        <asp:Label ID="lblUsername" runat="server" Text='<%#Eval("Image") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Location" ItemStyle-Width="8%">
                    <ItemTemplate>
                        <asp:Label ID="lblUsername" runat="server" Text='<%#Eval("Location") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Pay" ItemStyle-Width="8%">
                    <ItemTemplate>
                        <asp:Label ID="lblUsername" runat="server" Text='<%#Eval("Pay") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                
                            
                <asp:TemplateField HeaderText="Time From " ItemStyle-Width="8%">
                    <ItemTemplate>
                        <asp:Label ID="lblUsername" runat="server" Text='<%#Eval("TimeFrom") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Time To" ItemStyle-Width="8%">
                    <ItemTemplate>
                        <asp:Label ID="lblUsername" runat="server" Text='<%#Eval("TimeTo") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Date" ItemStyle-Width="8%">
                    <ItemTemplate>
                        <asp:Label ID="lblUsername" runat="server" Text='<%#Eval("DateDetails") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

             

             
                <asp:TemplateField HeaderText="Action" ItemStyle-Width="20%">
                    <ItemTemplate>
                        <asp:Button class="btn btn-danger" ID="btnDelete" runat="server" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this query?');"
                            OnClick="btnDelete_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

        </asp:GridView>

            <input type="hidden" runat="server" id="hidAdID" />
        
         </form>
</asp:Content>
