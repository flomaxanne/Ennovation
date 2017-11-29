<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="JobApplication.aspx.cs" Inherits="Job_Finder_System.JobApplication" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  
    <style type="text/css">
        .navbar-default .navbar-nav > li.dropdown:hover > a,
        .navbar-default .navbar-nav > li.dropdown:hover > a:hover,
        .navbar-default .navbar-nav > li.dropdown:hover > a:focus {
            background-color: rgb(231, 231, 231);
            color: rgb(85, 85, 85);
        }

        li.dropdown:hover > .dropdown-menu {
            display: block;
        }
        .style1 {
            margin-left:30px;
        }

    </style>

    <div>

        <table class="style1">
            <tr>
                <td class="style2">
                    <asp:Image ID="Image1" runat="server" Height="200px" Width="300px" />
                </td>
                <td>
                    <table class="style1">
                        <form id="form1" runat="server">
                       
                         <asp:LinkButton ID="LinkButton1" runat="server" Text="edit item" 
                        PostBackUrl='JobApplication.aspx?Adid=<%#Eval("AdID")%>&PosterId=<%#Eval("PosterID")%>' />


                        <tr>
                            <td>
                                <span style="color: Black; font-weight: bold;">Company Name</span><br />
                                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br /><span style="color: Black; font-weight: bold;">Title</span><br />
                                <asp:Literal ID="Literal2" runat="server"></asp:Literal>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br /><span style="color: Black; font-weight: bold;">Location</span><br />
                                <asp:Literal ID="Literal3" runat="server"></asp:Literal>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br /><span style="color: Black; font-weight: bold;">Pay</span><br />
                                <asp:Literal ID="Literal4" runat="server"></asp:Literal>
                            </td>
                        </tr>

                          <tr>
                            <td>
                                <br /><span style="color: Black; font-weight: bold;">Skills Required</span><br />
                                <asp:Literal ID="Literal5" runat="server"></asp:Literal>
                            </td>
                        </tr>

                          <tr>
                            <td>
                                <br /><span style="color: Black; font-weight: bold;">Time From</span><br />
                                <asp:Literal ID="Literal6" runat="server"></asp:Literal>
                            </td>
                        </tr>

                          <tr>
                            <td>
                                <br /><span style="color: Black; font-weight: bold;">Time To</span><br />
                                <asp:Literal ID="Literal7" runat="server"></asp:Literal>
                            </td>
                        </tr>

                          <tr>
                            <td>
                                <br /><span style="color: Black; font-weight: bold;">Date</span><br />
                                <asp:Literal ID="Literal8" runat="server"></asp:Literal>
                            </td>
                        </tr>

                          <tr>
                            <td>
                                <br /><span style="color: Black; font-weight: bold;">Posted by:</span><br />
                                <asp:Literal ID="Literal9" runat="server"></asp:Literal>
                            </td>
                        </tr>
                        </form>
                    </table>
                </td>
            </tr>
        </table>
    </div>

</asp:Content>

