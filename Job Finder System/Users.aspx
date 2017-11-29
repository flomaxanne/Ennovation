<%@ Page Language="C#" MasterPageFile="/MasterPage.Master"  AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="Job_Finder_System.Admin.Users" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server"> 
    <div>
        <h2 style="margin-left: 30px; margin-top: 55px;"><b>User Details</b></h2>
        <hr style="margin-left: 30px; margin-right: 30px;" />
        <form id="form1" runat="server" style="margin-left: 30px; margin-right: 30px;margin-top: 20px;">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true" EnablePageMethods="true"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always" emptydatatext="No records found">
                <ContentTemplate>
                    <asp:GridView ID="UserGridView" runat="server"
                        unat="server" CssClass="table table-bordered table-hover table-striped table-responsive"
                        GridLines="Horizontal" DataKeyNames="UserID" OnPageIndexChanging="OnPageIndexChanging" PageSize="10" AutoGenerateColumns="false"
                        AllowPaging="true" EmptyDataText="No records found">
                        <Columns>
                            <asp:BoundField DataField="UserID" HeaderText="UserID" ReadOnly="True" SortExpression="UserID" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" />
                            <asp:BoundField DataField="Firstname" HeaderText="First Name" SortExpression="Firstname" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" />
                            <asp:BoundField DataField="Lastname" HeaderText="Last Name" SortExpression="Lastname" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" />
                            <asp:BoundField DataField="Username" HeaderText="User Name" SortExpression="Username" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" />
                            <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" />
                            <asp:BoundField DataField="FirstAdded" HeaderText="Date Added" SortExpression="FirstAdded" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" />

                            <asp:TemplateField HeaderText="Action" ItemStyle-Width="18%">
                                <ItemTemplate>
                                    <a id="edituserpopup" class="btn" href='EditUsers.aspx?userid=<%# Eval("UserID") %>'>Update</a>
                                    <asp:LinkButton ID="lnkRemove" runat="server" CssClass="btn btn-danger" CommandArgument='<%# Eval("UserID")%>'
                                        OnClientClick="return confirm('Are you sure you want to delete this record?')"
                                        Text="Delete" OnClick="DeleteUser"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
                </ContentTemplate>

            </asp:UpdatePanel>
            <asp:Button ID="btnRefresh" Text="refresh" runat="server" Visible="false" OnClick="btnRefresh_Click" />

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
                    title: "Edit User Details",
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




