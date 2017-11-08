<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddJobPosterDetails.aspx.cs" Inherits="Job_Finder_System.JobPoster.AddJobPosterDetails" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container">
        <div id="changedetails" style="margin-top: 50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <div class="panel-title">Details</div>
                </div>
                <div style="padding-top: 30px;" class="panel-body">
                    <div style="display: none" id="changedetails-alert" class="alert alert-danger col-sm-12"></div>
          
                        <div class="form-group">
                            <asp:Label class="col-sm-3 control-label" runat="server" Text="Image" />
                            <div class="col-sm-9">
                                <asp:FileUpload ID="fuPosterImage" runat="server" />
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label class="col-sm-3 control-label" runat="server" Text="Username"  />
                            <div class="col-sm-9">
                                <asp:TextBox class="form-control" ID="txtUserName"  runat="server" ReadOnly="true" />
                            </div>
                        </div>

                        
                        <div class="form-group">
                            <asp:Label class="col-sm-3 control-label" runat="server" Text="Contact Number" />
                            <div class="col-sm-9">
                                <asp:TextBox class="form-control" ID="txtContactNumber" runat="server" placeholder="Please enter contact number"/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtContactNumber" ErrorMessage="Enter Current Contact Number" ForeColor="Red" Width="250px"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label class="col-sm-3 control-label" runat="server" Text="Address"  />
                            <div class="col-sm-9">
                                <asp:TextBox class="form-control" ID="txtAddress"  runat="server" placeholder="Please enter address" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAddress" ErrorMessage="Enter Address" ForeColor="Red" Width="250px"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label class="col-sm-3 control-label" runat="server" Text="Enter State" />
                            <div class="col-sm-9">
                            <asp:DropDownList ID="ddlState" runat="server" class="form-control" >
                            <asp:ListItem>--Select a state--</asp:ListItem>
                            <asp:ListItem>Johor</asp:ListItem>
                            <asp:ListItem>Kedah</asp:ListItem>
                            <asp:ListItem>Kelantan</asp:ListItem>
                            <asp:ListItem>Melaka</asp:ListItem>
                            <asp:ListItem>Negeri Sembilan</asp:ListItem>
                            <asp:ListItem>Pahang</asp:ListItem>
                            <asp:ListItem>Perak</asp:ListItem>
                            <asp:ListItem>Perlis</asp:ListItem>
                            <asp:ListItem>Pulau Pinang</asp:ListItem>
                            <asp:ListItem>Sabah</asp:ListItem>
                            <asp:ListItem>Sarawak</asp:ListItem>
                            <asp:ListItem>Selangor</asp:ListItem>
                            <asp:ListItem>Terengganu</asp:ListItem>
                           </asp:DropDownList><br />    

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlState" InitialValue="--Select a state--" ErrorMessage="Please choose one" ForeColor="Red" Width="250px"></asp:RequiredFieldValidator>
                                
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-9 col-sm-offset-3">
                                <asp:Button class="btn btn-success" ID="btnSubmit" runat="server" Text="Submit" Style="width: 100px;" OnClick="btnSubmit_Click" />&nbsp;&nbsp;
                                <input class="btn btn-success" id="Reset1" type="reset" value="Reset" style="width: 150px;" />
                            </div>
                        </div>
                  
                </div>
            </div>
        </div>
    </div>


</asp:Content>
