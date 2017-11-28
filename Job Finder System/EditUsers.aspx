<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditUsers.aspx.cs" Inherits="Job_Finder_System.Admin.EditUsers" %>

<html>
<head>
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td {
    padding: 8px;
}


</style>
</head>

<body>
    <form id="form1" runat="server">
    <div>
      
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <h3>Edit User Details</h3>
        <asp:Label ID="lblResult" runat="server" ForeColor="Green"></asp:Label>
        <asp:Panel ID="pnlEdit" runat="server">
         
    <table>
        <tr> <td> User ID:</td>
            <td><asp:TextBox ID="txtUserID" ReadOnly="true" runat="server"></asp:TextBox></td> </tr>

        <tr> <td>First Name:</td>
           <td> <asp:TextBox ID="txtFirstName"  runat="server"></asp:TextBox></td></tr>

       <tr> <td> Last Name: </td>
        <td> <asp:TextBox ID="txtLastName"  runat="server"></asp:TextBox></td> </tr>

   <tr> <td> User Name: </td>
      <td>  <asp:TextBox ID="txtUserName"  runat="server"></asp:TextBox></td> </tr>

    <tr> <td> Email</td> 
        <td><asp:TextBox ID="txtEmail"  runat="server"></asp:TextBox></td> </tr>

   <tr> <td> Role: </td>
       <td> <asp:TextBox ID="txtRole"  runat="server"></asp:TextBox></td> </tr>

   <tr> <td>  <asp:Button ID="btnSave" runat="server" Text="Save" onclick="btnSave_Click" /> </td> </tr>
        </table>
    
   
    </asp:Panel>
    </ContentTemplate>
    </asp:UpdatePanel>
    </div>
    </form>
</body>
    </html>
