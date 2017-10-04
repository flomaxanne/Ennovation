<%@ Page Title="Add Job Advertisements" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddAdvertisement.aspx.cs" Inherits="Job_Finder_System.JobPoster.AddAdvertisement" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>

     <div class="container">
        <div id="changedetails" style="margin-top: 50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <div class="panel-title">Job Advertisement</div>
                </div>
                <div style="padding-top: 30px;" class="panel-body">
                    <div style="display: none" id="changedetails-alert" class="alert alert-danger col-sm-12"></div>

                        
                        <div class="form-group">
                            <asp:Label class="col-sm-3 control-label" runat="server" Text="Image" />
                            <div class="col-sm-9">
                                <asp:FileUpload ID="fuAdImage" runat="server" />
                            </div>
                        </div>
                    <br />

                        <div class="form-group">
                            <asp:Label class="col-sm-3 control-label" runat="server" Text="Company Name" />
                            <div class="col-sm-9">
                                <asp:TextBox class="form-control" ID="txtCompanyName" runat="server" placeholder="Please enter company name"/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtCompanyName" ErrorMessage="Enter Company Name" ForeColor="Red" Width="250px"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        
                        <div class="form-group">
                            <asp:Label class="col-sm-3 control-label" runat="server" Text="Title" />
                            <div class="col-sm-9">
                                <asp:TextBox class="form-control" ID="txtAdTitle" runat="server" placeholder="Please enter title"/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAdTitle" ErrorMessage="Enter Advertisement Title" ForeColor="Red" Width="250px"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label class="col-sm-3 control-label" runat="server" Text="Location"  />
                            <div class="col-sm-9">
                                <asp:TextBox class="form-control" ID="txtAdLocation"  runat="server" placeholder="Please enter location" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAdLocation" ErrorMessage="Enter Location" ForeColor="Red" Width="250px"></asp:RequiredFieldValidator>
                            </div>
                        </div>


                    <div class="form-group">
                            <asp:Label class="col-sm-3 control-label" runat="server" Text="Pay Offered"  />
                            <div class="col-sm-9">
                                 <div class="input-group"> 
                                 <span class="input-group-addon">$</span>
                                   <input type="number" value="1000" min="0" step="0.01" data-number-to-fixed="2" data-number-stepfactor="100" class="form-control currency" id="txtPay" runat="server" />
                                </div>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" InitialValue="1000" ControlToValidate="txtPay" ErrorMessage="Enter Pay" ForeColor="Red" Width="250px"></asp:RequiredFieldValidator>
                            
                                 </div>
                        </div>



               <div class="form-group">
                            <asp:Label class="col-sm-3 control-label" runat="server" Text="Skills Required"  />
                            <div class="col-sm-9">
                                <asp:TextBox class="form-control" ID="txtSkillsRequired"  runat="server" placeholder="Please enter required skill" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSkillsRequired" ErrorMessage="Enter Required Skills" ForeColor="Red" Width="250px"></asp:RequiredFieldValidator>
                            </div>
                        </div>


                     <div class="form-group">
                            <asp:Label class="col-sm-3 control-label" runat="server" Text="Time(From)"  />
                            <div class="col-sm-9">
                                   <div class="form-group">
                                       <div class="input-group date" >
                                             <span class="input-group-addon">
                                          <span class="glyphicon glyphicon-time"></span> 
                                       </span>
                                          <input type="text" class="form-control" id="datetimepickerfrom" runat="server" ClientIdMode="static"  />                  
                          </div>
                        </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="datetimepickerfrom" ErrorMessage="Enter Date(From)" InitialValue="12:00 AM" ForeColor="Red" Width="250px"></asp:RequiredFieldValidator>

                            </div>

                        </div>

                    <div class="form-group">
                            <asp:Label class="col-sm-3 control-label" runat="server" Text="Time(To)"  />
                            <div class="col-sm-9">
                                   <div class="form-group">
                                       <div class="input-group date" >
                                             <span class="input-group-addon">
                                          <span class="glyphicon glyphicon-time"></span> 
                                       </span>
                                          <input type="text" class="form-control" id="datetimepickerto" runat="server" ClientIdMode="static"  />                  
                          </div>
                        </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="datetimepickerto" ErrorMessage="Enter Date(To)" InitialValue="12:00 AM" ForeColor="Red" Width="250px"></asp:RequiredFieldValidator>

                            </div>

                        </div>

                     <div class="form-group">
                            <asp:Label class="col-sm-3 control-label" runat="server" Text="Date"  />
                            <div class="col-sm-9">
                                   <div class="form-group">
                                       <div class="input-group date" >
                                             <span class="input-group-addon">
                                          <span class="glyphicon glyphicon-calendar"></span> 
                                       </span>
                                        
                                           <input type="text" class="form-control" id="datetimepickerdate" runat="server" ClientIdMode="static"  />                   
                          </div>
                        </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="datetimepickerdate" ErrorMessage="Enter Date(To)"  ForeColor="Red" Width="250px"></asp:RequiredFieldValidator>

                            </div>

                        </div>


                        <div class="form-group">
                            <asp:Label class="col-sm-3 control-label" runat="server" Text="Username"  />
                            <div class="col-sm-9">
                                <asp:TextBox class="form-control" ID="txtUserName"  runat="server" ReadOnly="true"  />
                            </div>
                        </div>
                    <br />
                    



                        <div class="form-group">
                            <div class="col-sm-9 col-sm-offset-3">
                                <asp:Button class="btn btn-success" ID="btnSubmit" runat="server" Text="Submit" Style="width: 100px;" OnClick="btnSubmit_Click"  />&nbsp;&nbsp;
                                <input class="btn btn-success" id="Reset1" type="reset" value="Reset" style="width: 150px;" />
                            </div>
                        </div>
                    <br />


                    <asp:Label ID="lblsuccess" runat="server" Visible="false"  Forecolor="Green"></asp:Label> 
                  
                </div>
            </div>
        </div>
    </div>
     <script type="text/javascript">
            $(function () {
                $("#<%=datetimepickerfrom.ClientID%>").datetimepicker({
                    format: 'LT'
                });
            });
        

            $(function () {
                $("#<%=datetimepickerto.ClientID%>").datetimepicker({
                    format: 'LT'
                });
            });


            $(function () {
                $("#<%=datetimepickerdate.ClientID%>").datetimepicker({
                    format: 'DD/MM/YYYY'
                });
            });
        
        </script>

</asp:Content>


