<%@ Page Title="" Language="C#" MasterPageFile="/MasterPage.Master" AutoEventWireup="true" CodeBehind="AdvertisementDetails.aspx.cs" Inherits="Job_Finder_System.Admin.AdvertisementDetails" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

        <div>
            <h1><font color="red">Admin Page</font></h1>
            <p style="margin-top: 14px;">Advertisements</p>
            <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server"  EnablePartialRendering="true" EnablePageMethods="true" >  </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always" emptydatatext="No records found" >
        <ContentTemplate> 
          <asp:GridView ID="GridView1" runat="server"
               unat="server" Cssclass="table table-hover table-striped" 
              GridLines="Horizontal"  DataKeyNames ="AdID" OnPageIndexChanging="OnPageIndexChanging" PageSize="10" AutoGenerateColumns = "false" 
              AllowPaging="true"  emptydatatext="No records found">
              <Columns>
                  <asp:BoundField DataField="AdID" HeaderText="Advertisement ID" ReadOnly="True" SortExpression="AdID" />
                  <asp:BoundField DataField="CompanyName" HeaderText="Company Name" SortExpression="CompanyName" />
                  <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                     <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
                  <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                     <asp:BoundField DataField="Pay" HeaderText="Pay" SortExpression="Pay" />
                     <asp:BoundField DataField="SkillsRequired" HeaderText="Skills Required" SortExpression="SkillsRequired" />
                     <asp:BoundField DataField="TimeFrom" HeaderText="Time From " SortExpression="TimeFrom" />
                     <asp:BoundField DataField="TimeTo" HeaderText="Time To" SortExpression="TimeTo" />
                     <asp:BoundField DataField="DateDetails" HeaderText="Date Details" SortExpression="DateDetails" />
                     <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />

     <asp:TemplateField HeaderText="Update">
             <ItemTemplate>
                 <a id="editadvertisementpopup" class="btn" href='EditAdvertisement.aspx?advid=<%# Eval("AdID") %>' >Update</a>
             </ItemTemplate>
            </asp:TemplateField>

                  
            <asp:TemplateField HeaderText="Delete">
                      <ItemTemplate>
        <asp:LinkButton ID="lnkRemove" runat="server" CssClass="btn btn-danger"
            CommandArgument = '<%# Eval("AdID")%>'
         OnClientClick = "return confirm('Are you sure you want to delete this record?')"
        Text = "Delete" OnClick = "DeleteAdvertisement"></asp:LinkButton>
    </ItemTemplate>
            </asp:TemplateField>
                  
                   </Columns>
        </asp:GridView>  
            </ContentTemplate>  
          
        </asp:UpdatePanel>  
            <asp:Button ID="btnRefresh" Text="refresh" runat="server" Visible="false" onclick="btnRefresh_Click" />
                
     
            <p style="margin-top: 14px;">
               Advertisements</p>
            <p style="margin-top: 14px;">
     
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always" emptydatatext="No records found" >
        <ContentTemplate> 
          <asp:GridView ID="AdvertisementGridView" runat="server"
               unat="server" Cssclass="table table-hover table-striped" 
              GridLines="Horizontal"  DataKeyNames ="AdID" OnPageIndexChanging="OnPageIndexChanging" PageSize="10" AutoGenerateColumns = "false" 
              AllowPaging="true"  emptydatatext="No records found">
              <Columns>
                  <asp:BoundField DataField="AdID" HeaderText="Advertisement ID" ReadOnly="True" SortExpression="AdID" />
                  <asp:BoundField DataField="CompanyName" HeaderText="Company Name" SortExpression="CompanyName" />
                  <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                     <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
                  <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                     <asp:BoundField DataField="Pay" HeaderText="Pay" SortExpression="Pay" />
                     <asp:BoundField DataField="SkillsRequired" HeaderText="Skills Required" SortExpression="SkillsRequired" />
                     <asp:BoundField DataField="TimeFrom" HeaderText="Time From " SortExpression="TimeFrom" />
                     <asp:BoundField DataField="TimeTo" HeaderText="Time To" SortExpression="TimeTo" />
                     <asp:BoundField DataField="DateDetails" HeaderText="Date Details" SortExpression="DateDetails" />
                     <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />

     <asp:TemplateField HeaderText="Update">
             <ItemTemplate>
                 <a id="editadvertisementpopup" class="btn" href='EditAdvertisement.aspx?advid=<%# Eval("AdID") %>' >Update</a>
             </ItemTemplate>
            </asp:TemplateField>

                  
            <asp:TemplateField HeaderText="Delete">
                      <ItemTemplate>
        <asp:LinkButton ID="lnkRemove" runat="server" CssClass="btn btn-danger"
            CommandArgument = '<%# Eval("AdID")%>'
         OnClientClick = "return confirm('Are you sure you want to delete this record?')"
        Text = "Delete" OnClick = "DeleteAdvertisement"></asp:LinkButton>
    </ItemTemplate>
            </asp:TemplateField>
                  
                   </Columns>
        </asp:GridView>  
            </ContentTemplate>  
          
        </asp:UpdatePanel> 
           
            </form>
        </div>
    

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery.ui/1.8.6/jquery-ui.min.js"></script>
    <link type="text/css" rel="Stylesheet" href="http://ajax.microsoft.com/ajax/jquery.ui/1.8.6/themes/smoothness/jquery-ui.css">
    <script type="text/javascript">
        $(document).ready(function () {
            $('a#edituserpopup').live('click', function (e) {
                 
                var page = $(this).attr("href")  //get url of link
               
                var $dialog = $('<div></div>')
                .html('<iframe style="border: 0px; " src="' + page + '" width="100%" height="100%"></iframe>')
                .dialog({
                    autoOpen: false,
                    modal: true,
                    height: 500,
                    width: '500',
                    title: "Edit PC Location",
                    buttons: {
                        "Close": function () { $dialog.dialog('close'); }
                                },
                    close: function (event, ui) {
                         __doPostBack('<%= btnRefresh.ClientID %>', '');  // To refresh gridview when user close dialog
                    }
                      
                    
                });
                $dialog.dialog('open');
                e.preventDefault();
            });
        });





          $(document).ready(function () {
            $('a#editadvertisementpopup').live('click', function (e) {
                 
                var page = $(this).attr("href")  //get url of link
               
                var $dialog = $('<div></div>')
                .html('<iframe style="border: 0px; " src="' + page + '" width="100%" height="100%"></iframe>')
                .dialog({
                    autoOpen: false,
                    modal: true,
                    height: 500,
                    width: '500',
                    title: "Edit Advertisement",
                    buttons: {
                        "Close": function () { $dialog.dialog('close'); }
                                },
                    close: function (event, ui) {
                         __doPostBack('<%= btnRefresh.ClientID %>', '');  // To refresh gridview when user close dialog
                    }
                      
                    
                });
                $dialog.dialog('open');
                e.preventDefault();
            });
        });
    </script>


     


     
</asp:Content>




