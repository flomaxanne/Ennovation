<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Job_Finder_System.Home" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .thumbnail {
              border: 1px solid #dfdede;
              box-shadow: 2px 5px 10px #dfdede;
              padding: 5px;
              position: relative;
              width:280px;
              height:auto;
        }
        .page_enabled, .page_disabled
        {
            display: inline-block;
            height: 40px;
            min-width: 40px;
            line-height: 40px;
            text-align: center;
            text-decoration: none;
            border: 1px solid #ccc;
        }
        .page_enabled
        {
            background-color: #eee;
            color: #000;
        }
        .page_disabled
        {
            background-color: #6C6C6C;
            color: #fff !important;
        }
    </style>

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>

        <div class="input-group add-on" style="width: 300px; margin-left: 966px;">
            <asp:TextBox ID="txtSearch" class="form-control" placeholder="Search Skills" name="srch-term" runat="server"></asp:TextBox>
            <div class="input-group-btn">
                <asp:Button class="btn btn-success" Text="Search" runat="server" OnClick="Search" />
            </div>
        </div>

        <cc1:AutoCompleteExtender ServiceMethod="SearchAd"
            MinimumPrefixLength="1"
            CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
            TargetControlID="txtSearch"
            ID="AutoCompleteExtender1" runat="server" FirstRowSelected="false">
        </cc1:AutoCompleteExtender>

        <hr style="margin-left: 30px; margin-right: 30px;" />

        <asp:DataList ID="dtlAd" runat="server" RepeatColumns="4" DataKeyField="AdID" HorizontalAlign="center" onitemcommand="DataList1_ItemCommand"
            RepeatDirection="Horizontal">
            <FooterTemplate>
                <asp:label visible="<%#bool.Parse((dtlAd.Items.Count==0).ToString())%>" xmlns:asp="#unknown" runat="server" id="lblNoRecord" style="color: red; font-size: 20px;" text="No Record Found!"></asp:label>
            </FooterTemplate>
            <ItemTemplate>
                <div class="thumbnail" style="margin: 10px;">
                    <table>
                        <tr style="margin-right: 50px;">
                            <td align="center">
                                <img src='<%#Eval("Image") %>' style="width: 100%; height: 125px; margin-bottom: 10px;" alt="Image" />
                            </td>
                            <td>
                                <tr>
                                    <td style="color: black; text-align: center;">
                                        <b><p><%#Eval("Title") %></p></b>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="color: black; text-align: center;">
                                        <p><%#Eval("CompanyName") %></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="color: black; text-align: center;">
                                        <p><%#Eval("SkillsRequired") %></p>
                                    </td>
                                </tr>

                            </td>
                        </tr>
                    </table>
                  <asp:LinkButton ID="LinkButton1" class="btn btn-primary" runat="server" Font-Underline="False" style="margin-left: 170px; margin-top: 20px; margin-bottom: 5px;" 
                        CommandName="ViewDetails" CommandArgument='<%#Eval("AdID") %>'>View More</asp:LinkButton>

                </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
        <div align="center" style="margin-top: 20px; margin-bottom: 70px;">
            <asp:Repeater ID="rptPager" runat="server">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkPage" runat="server" Text='<%#Eval("Text") %>' CommandArgument='<%# Eval("Value") %>'
                        CssClass='<%# Convert.ToBoolean(Eval("Enabled")) ? "page_enabled" : "page_disabled" %>'
                        OnClick="Page_Changed" OnClientClick='<%# !Convert.ToBoolean(Eval("Enabled")) ? "return false;" : "" %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        </form>
</asp:Content>
