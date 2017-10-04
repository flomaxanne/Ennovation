<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="Job_Finder_System.Admin.EditUser" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    
    <div>
    
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <h3>Edit User Details</h3>
        <asp:Label ID="lblResult" runat="server" ForeColor="Green"></asp:Label>
        <asp:Panel ID="pnlEdit" runat="server">
         
    
    <p> User ID:<asp:TextBox ID="txtUserID" ReadOnly="true" runat="server"></asp:TextBox></p>

    <p> First Name: <asp:TextBox ID="txtFirstName"  runat="server"></asp:TextBox></p>

    <p> Last Name: <asp:TextBox ID="txtLastName"  runat="server"></asp:TextBox></p>

    <p> User Name: <asp:TextBox ID="txtUserName"  runat="server"></asp:TextBox></p>

    <p> Email: <asp:TextBox ID="txtEmail"  runat="server"></asp:TextBox></p>

    <p> Role: <asp:TextBox ID="txtRole"  runat="server"></asp:TextBox></p>



    
<p> <asp:Button ID="btnSave" runat="server" Text="Save" onclick="btnSave_Click" />
     
        
   


    </p>
    </asp:Panel>
    </ContentTemplate>
    </asp:UpdatePanel>

    </div>
    
     







</asp:Content>
