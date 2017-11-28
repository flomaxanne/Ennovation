<%@ Page Language="C#" MasterPageFile="/MasterPage.Master"  AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="Job_Finder_System.Admin.Users" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server"> 
        <div>
            <h1><font color="red">Admin Page</font></h1>
            <p style="margin-top: 14px;">Users</p>
            <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server"  EnablePartialRendering="true" EnablePageMethods="true" >  </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always" emptydatatext="No records found" >
        <ContentTemplate> 
          <asp:GridView ID="UserGridView" runat="server"
               unat="server" Cssclass="table table-hover table-striped" 
              GridLines="Horizontal"  DataKeyNames ="UserID" OnPageIndexChanging="OnPageIndexChanging" PageSize="10" AutoGenerateColumns = "false" 
              AllowPaging="true"  emptydatatext="No records found">
              <Columns>
                  <asp:BoundField DataField="UserID" HeaderText="UserID" ReadOnly="True" SortExpression="UserID" />
                  <asp:BoundField DataField="Firstname" HeaderText="First Name" SortExpression="Firstname" />
                  <asp:BoundField DataField="Lastname" HeaderText="Last Name" SortExpression="Lastname" />
                     <asp:BoundField DataField="Username" HeaderText="User Name" SortExpression="Username" />
                  <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                     <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />
                  <asp:BoundField DataField="LastLogin" HeaderText="Last Login" SortExpression="LastLogin" />
                 
                  <asp:TemplateField HeaderText="Update">
             <ItemTemplate>
                 <a id="edituserpopup" class="btn" href='EditUsers.aspx?userid=<%# Eval("UserID") %>' >Update</a>
             </ItemTemplate>
            </asp:TemplateField>

                  
            <asp:TemplateField HeaderText="Delete">
                      <ItemTemplate>
        <asp:LinkButton ID="lnkRemove" runat="server" CssClass="btn btn-danger"
            CommandArgument = '<%# Eval("UserID")%>'
         OnClientClick = "return confirm('Are you sure you want to delete this record?')"
        Text = "Delete" OnClick = "DeleteUser"></asp:LinkButton>
    </ItemTemplate>
            </asp:TemplateField>
                  
                   </Columns>
        </asp:GridView>  
            </ContentTemplate>  
          
        </asp:UpdatePanel>  
            <asp:Button ID="btnRefresh" Text="refresh" runat="server" Visible="false" onclick="btnRefresh_Click" />

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




