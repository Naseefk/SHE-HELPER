<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DepositorDetails.aspx.cs" Inherits="SHe_Helper.DepositorDetails" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Depositor | Details</title>
    <link href="css/default.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="css/plugins/steps/jquery.steps.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <!-- Mainly scripts -->
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

 
    <script src="js/plugins/steps/jquery.steps.min.js"></script>

    <!-- Jquery Validate -->
    <script src="js/plugins/validate/jquery.validate.min.js"></script>
</head>

<body class="">



    <div id="page-wrapper" class="gray-bg">
       
          <div class="wrapper wrapper-content">
           
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ibox">
                            <div class="ibox-title text-center">
                                <h5>Depositor Details</h5>
                            </div>
                            <div class="ibox-content">
                                
                                <form id="form1" runat="server">
                                   
                                    <div><br /></div>
                                    <div class="row">
                                        <div class="col-lg-8">
                                            <asp:Label ID="lblPersonalInfmn" runat="server" Text="Personal Information" Font-Bold="True" Font-Size="Larger"></asp:Label>
                                            <div class="form-group">
                                                <asp:Label ID="lblCIF" runat="server" Text="CIF"></asp:Label>
                                                <asp:Label ID="lblAccno" runat="server" Text="Account Number" style="margin-left:240px"></asp:Label>
                                                <br />
                                                <asp:TextBox runat="server" ID="txtCIF" TextMode="SingleLine" CssClass="form-control form-control-sm width" Enabled="false" />
                                                
                                                
                                                 <asp:TextBox runat="server" ID="txtAccNo" TextMode="SingleLine" CssClass="form-control form-control-sm text-left width" Visible="false" Enabled="false"/>
                                                
                                                <asp:DropDownList ID="ddlAccNo" runat="server" CssClass="form-control form-control-sm text-left width">
                                                </asp:DropDownList>
                                                <asp:button runat="server" ID="btnSelect" text="Select" CssClass="btn btn-primary m-t-n-xs" OnClick="btnSelect_Click" />
                                                
                                            </div> 
                                            <div class="form-group">
                                                <asp:Label ID="lblName" runat="server" Text="Depositor Name"></asp:Label>
                                                <asp:Label ID="lblPassword" runat="server" Text="Depositor Password" Visible="false" style="margin-left:157px"></asp:Label>
                                                <br />
                                                <asp:TextBox runat="server" ID="txtName" TextMode="SingleLine" CssClass="form-control form-control-sm width " Enabled="false" />
                                                <asp:TextBox runat="server" ID="txtPassword" TextMode="SingleLine" CssClass="form-control form-control-sm text-left width" Visible="false" Enabled="false"/>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                                                <asp:TextBox runat="server" ID="txtAddress" TextMode="MultiLine" CssClass="form-control" Enabled="false" />
                                                
                                            </div>

                                            <div class="form-group">
                                                <asp:Label ID="lblContact" runat="server" Text="Contact"></asp:Label>
                                                <asp:Label ID="lblDob" runat="server" Text="Date Of Birth" style="margin-left:210px"></asp:Label>
                                                <br/>
                                                <asp:TextBox runat="server" ID="txtPhone" TextMode="SingleLine" CssClass="form-control form-control-sm width" Enabled="false" />
                                                <asp:TextBox runat="server" ID="txtDb" TextMode="SingleLine" CssClass="form-control form-control-sm text-left width" Enabled="false"/>
                                                
                                            </div>
                                           
                                            <div class="form-group">
                                                <asp:Label ID="lblAadhar" runat="server" Text="Aadhar"></asp:Label>
                                                <asp:Label ID="lblPan" runat="server" Text="Pan" style="margin-left:213px"></asp:Label>
                                                <br />
                                                <asp:TextBox runat="server" ID="txtAadhar" TextMode="SingleLine" CssClass="form-control form-control-sm width" Enabled="false"/>
                                                
                                                 <asp:TextBox runat="server" ID="txtPan" TextMode="SingleLine" CssClass="form-control form-control-sm text-left width" Enabled="false"/>
                                            </div>
                                            
                                            <asp:Label ID="lblAccInfmn" runat="server" Text="Account Information" Font-Bold="True" Font-Size="Larger"></asp:Label>
                                           <div class="form-group">
                                                 <asp:Label ID="lblAgentId" runat="server" Text="Agent ID"></asp:Label>
                                               <asp:Label ID="lblDenomination" runat="server" Text="Denomination" style="margin-left:205px"></asp:Label>
                                               <br />
                                                 <asp:TextBox runat="server" ID="txtAgentId" TextMode="SingleLine" CssClass="form-control form-control-sm width" Enabled="false"/>
                                                 <asp:TextBox runat="server" ID="txtDenomination" TextMode="SingleLine" CssClass="form-control form-control-sm text-left width" Enabled="false"/>
                                           </div>
                                              
                                            <div class="form-group">
                                                <asp:Label ID="lblNominee" runat="server" Text="Nominee"></asp:Label>
                                                <asp:Label ID="lblRelation" runat="server" Text="Relation" style="margin-left:200px"></asp:Label>
                                               <br />
                                                 <asp:TextBox runat="server" ID="txtNominee" TextMode="Email" CssClass="form-control form-control-sm width" Enabled="false"/>
                                                 
                                                 <asp:TextBox runat="server" ID="txtRelation" TextMode="SingleLine" CssClass=" form-control form-control-sm text-left width" Enabled="false"/>
                                           </div>

                                           <div class="form-group">
                                               <asp:Label ID="lblLastPay" runat="server" Text="Last Pay"></asp:Label>
                                               <asp:Label ID="lblLastPayDate" runat="server" Text="Last Pay Date" style="margin-left:206px"></asp:Label>
                                               <br />
                                                 <asp:TextBox runat="server" ID="txtLastpay" TextMode="SingleLine" CssClass="form-control form-control-sm width" Enabled="false"/>
                                                 
                                                 <asp:TextBox runat="server" ID="txtLastPayDate" TextMode="SingleLine" CssClass="form-control form-control-sm text-left width" Enabled="false"/>
                                           </div>        
                                          
                                            <div class="form-group">
                                                <asp:Label ID="lblDateOfOpen" runat="server" Text="Date Of Open"></asp:Label>
                                                <asp:Label ID="lblMaturityDate" runat="server" Text="Maturity Date" style="margin-left:177px"></asp:Label>
                                                <br />
                                                 <asp:TextBox runat="server" ID="txtDopen" TextMode="SingleLine" CssClass="form-control form-control-sm width" Enabled="false"/> 
                                                 
                                                 <asp:TextBox runat="server" ID="txtMaDate" TextMode="SingleLine" CssClass="form-control form-control-sm text-left width" Enabled="false"/> </div>
                                           <div class="form-group">
                                               <asp:Label ID="lblTotalAmount" runat="server" Text="Total Amount"></asp:Label>
                                               <asp:Label ID="lblNoOfPay" runat="server" Text="Number of Pay" style="margin-left:174px"></asp:Label>
                                               <br />
                                                 <asp:TextBox runat="server" ID="txtTotAmount" TextMode="SingleLine" CssClass="form-control form-control-sm width" Enabled="false"/>
                                               
                                                 <asp:TextBox runat="server" ID="txtNumberofpay" TextMode="SingleLine" CssClass="form-control form-control-sm text-left width" Enabled="false"/>
                                           </div>
                                            <div class="form-group">
                                                <asp:Label ID="lblDuePay" runat="server" Text="Due Pay"></asp:Label>
                                                <asp:Label ID="lblDueDate" runat="server" Text="Due Date" style="margin-left:205px"></asp:Label>
                                                <br />
                                                 <asp:TextBox runat="server" ID="txtDuePay" TextMode="SingleLine" CssClass="form-control form-control-sm width" Enabled="false"/>
                                                
                                                 <asp:TextBox runat="server" ID="txtDueDate" TextMode="SingleLine" CssClass="form-control form-control-sm text-left width" Enabled="false"/>
                                           </div>
                                            <br/>
                                          <div>
                                              <asp:button  style=" margin-right:50px;" runat="server" ID="btnApprove" text="Approve" CssClass="btn btn-primary float-left m-t-n-xs" OnClick="btnApprove_Click" />
                                          </div>
                                          <div>
                                              <asp:button  style="margin-right:50px" runat="server" ID="btnReject" text="Reject" CssClass="btn btn-primary float-left m-t-n-xs" OnClick="btnReject_Click" />
                                          </div>
                                            
                                        </div>
                                        </div>
                                       

                                  
                                </form>
                              
                            </div>
                        </div>
                    </div>

                </div>
           </div> 
        </div>

 </body>  


</html>
