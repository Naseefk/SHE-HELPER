<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="settings.aspx.cs" Inherits="SHe_Helper.settings" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title></title>
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

    <!-- Custom and plugin javascript -->
  <%--  <script src="js/inspinia.js"></script>--%>
    <%-- <script src="js/plugins/pace/pace.min.js"></script>--%>
    <!-- Steps -->
    <script src="js/plugins/steps/jquery.steps.min.js"></script>

    <!-- Jquery Validate -->
    <script src="js/plugins/validate/jquery.validate.min.js"></script>
</head>

<body class="">



    <div id="page-wrapper" class="gray-bg">
       
          <div class="wrapper wrapper-content" style="text-align:center !important">
           
                <div class="row" >
                    <div class="col-lg-12" >
                        <div  class="ibox">
                            <div class="ibox-title text-center">
                                <h2></h2>
                            </div>
                           
                            <div style="text-align:center !important" class="ibox-content">
                                
                                <form id="form1" runat="server">
                                   
                                    <div><br /></div>
                                    <div class="row">
                                        
                                        <div  class="col-lg-8">
                                            
                                            
                                            <div class="form-group">
                                                <label style="margin-left: 62px">% of Allowance</label>
                                                <br />
                                                <asp:TextBox runat="server" ID="txtAllowance" CssClass="form-control-sm text-left "  Enabled="false"/>
                                                
                                            </div>
                                            <div class="form-group">
                                                <label style="margin-left: 62px">% of Tax</label>
                                                <br />
                                                <asp:TextBox runat="server" ID="txtTax" TextMode="SingleLine" CssClass="form-control-sm text-left" Enabled="false" />
                                                
                                            </div>
                                            <div class="form-group">
                                                <label style="margin-left: 62px">% of Commission</label>
                                                <br />
                                                <asp:TextBox runat="server" ID="txtCommission" TextMode="SingleLine" CssClass="form-control-sm text-left" Enabled="false" />
                                                
                                            </div>
                                            <div class="form-group">
                                                <label style="margin-left: 62px">% of Interest</label>
                                                <br />
                                                <asp:TextBox runat="server" ID="txtInterest" TextMode="SingleLine" CssClass="form-control-sm text-left" Enabled="false" />
                                                
                                            </div>

                                            <div class="form-group">
                                                <label style="margin-left: 62px">Limit of the total amount</label>
                                                <br />
                                                <asp:TextBox runat="server" ID="txtLimitofTtlAmt" TextMode="SingleLine" CssClass="form-control-sm text-left" Enabled="false" />
                                                
                                            </div>
                                         

                                           
                                                
                                             <br/>
                                          <div>
                                              <asp:button  style="margin-left:355px" runat="server" ID="btnEdit" text="Edit" CssClass="btn btn-primary float-left m-t-n-xs" OnClick="btnEdit_Click"/>
                                          </div>
                                            <div>
                                              <asp:button style="margin-left:355px" runat="server" ID="btnSave" text="Save" CssClass="btn btn-primary float-left m-t-n-xs" Visible="false" OnClick="btnSave_Click" />
                                          </div>
                                          
                                            <div>
                                              <asp:button  style="margin-left:60px" runat="server" ID="btnCancel" text="Cancel" CssClass="btn btn-primary float-left m-t-n-xs" OnClick="btnCancel_Click"  />
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