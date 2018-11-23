<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoanDetails.aspx.cs" Inherits="SHe_Helper.LoanDetails" %>


<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Loan | Details</title>
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

<body>
    <div id="page-wrapper" class="gray-bg">

        <div class="wrapper wrapper-content">

            
                    <div class="ibox">

                        <form id="form1" runat="server">
                            <div class="ibox-content text-center">
                                <div class="row">
                                    <div class="col-lg-12">

                                         <div class="form-group">
                                         <label style="margin-left:-159px">Name</label>
                                         <br />
                                         <asp:TextBox runat="server" ID="txtName" TextMode="SingleLine" CssClass="form-control form-control-sm width" Enabled="false" />
                                         </div>

                                         <div class="form-group">
                                         <label style="margin-left: -119px">CIF</label>
                                         <label style="margin-left: 237px">Account No.</label>
                                         <br />
                                         <asp:TextBox runat="server" ID="txtCif" TextMode="SingleLine" CssClass="form-control form-control-sm width" Enabled="false" />
                                         <asp:TextBox style="margin-left: 40px" runat="server" ID="txtAccountNo" TextMode="SingleLine" CssClass="form-control form-control-sm text-left width" Enabled="false" />
                                         </div>
                                         
                                         <div class="form-group">
                                         <label style="margin-left: -115px">Loan Date</label>
                                         <label style="margin-left: 196px">Loan Amount</label>
                                         <br />
                                         <asp:TextBox runat="server" ID="txtLoanDate" TextMode="SingleLine" CssClass="form-control form-control-sm width" Enabled="false" />
                                         <asp:TextBox style="margin-left: 40px" runat="server" ID="txtLoanAmount" TextMode="SingleLine" CssClass="form-control form-control-sm text-left width" Enabled="false" />
                                         </div>
                                         
                                         <div class="form-group">
                                         <label style="margin-left: -115px">Loan Last Pay</label>
                                         <label style="margin-left: 207px">Last Pay Date</label>
                                         <br />
                                         <asp:TextBox runat="server" ID="txtLastPay" TextMode="SingleLine" CssClass="form-control form-control-sm width" Enabled="false" />
                                         <asp:TextBox style="margin-left: 40px" runat="server" ID="txtLastPayDate" TextMode="SingleLine" CssClass="form-control form-control-sm text-left width" Enabled="false" />
                                         </div>

                                         <div class="form-group">
                                         <label style="margin-left: -115px">Loan Return</label>
                                         <label style="margin-left: 183px">Loan Balance</label>
                                         <br />
                                         <asp:TextBox runat="server" ID="txtLoanReturn" TextMode="SingleLine" CssClass="form-control form-control-sm width" Enabled="false" />
                                         <asp:TextBox runat="server" ID="txtLoanBalance" TextMode="SingleLine" CssClass="form-control form-control-sm text-left width" Enabled="false" />
                                         </div>
                                         

                                    </div>
                                </div>
                                </div>
                             </form>
                    </div>
                </div>

               

            </div>
   
</body>

</html>
