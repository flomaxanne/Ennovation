<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddAdvertisements.aspx.cs" Inherits="Job_Finder_System.AddAdvertisements" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
     
    <style type="text/css">
        .auto-style2 {
            width: 162px;
        }
        .auto-style3 {
            width: 151px;
        }
    </style>
</head>
<body>
 
    <div class="container">
    <form id="form1" runat="server">
     <div class="form-group">
      <label class="control-label col-sm-2" for="ComapanyName">Company Name:</label>
      <div class="col-sm-10">
             <asp:TextBox ID="CompanyName" runat="server" class="form-control" placeholder="Enter Company name" Width="300px"></asp:TextBox><br />
           
           
           </div>
    </div>
        <div class="form-group">
      <label class="control-label col-sm-2" for="JobTitle">Title:</label>
      <div class="col-sm-10">
             <asp:TextBox ID="Title" runat="server" class="form-control" placeholder="Enter Job Title" Width="800px" height="400px"></asp:TextBox><br />
           
         
           </div>
    </div>
         <div class="form-group">
      <label class="control-label col-sm-2" for="Image">Insert Image:</label>
      <div class="col-sm-10">
          <asp:FileUpload ID="Image" runat="server" class="form-control" Width="600px"/>
           
           
           </div>
    </div>





        <br />
         <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <asp:Button ID="btnSubmit" runat="server" Text="Submit"  class="btn btn-default" OnClick="btnSubmit_Click"  />
        </div>
    </div> 
        
        <asp:Label ID="Label1" runat="server"  Visible="false" Forecolor="Green"></asp:Label> 
    </form>
        </div>
</body>
</html>
