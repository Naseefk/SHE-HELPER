<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoanApprove.aspx.cs" Inherits="SHe_Helper.LoanApprove" %>



<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Loan</title>
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
    <%--  <script src="js/inspinia.js"></script>--%>    <%-- <script src="js/plugins/pace/pace.min.js"></script>--%>
    <!-- Steps -->
    <script src="js/plugins/steps/jquery.steps.min.js"></script>

    <!-- Jquery Validate -->
    <script src="js/plugins/validate/jquery.validate.min.js"></script>
</head>

<body>
    
            <div id="page-wrapper" class="gray-bg">
               

                    <%--<div id="page-wrapper" class="gray-bg">--%>

                    <div class="wrapper wrapper-content">

                        <div class="ibox">
                            <form id="form1" runat="server">
                            <div class="ibox-content text-center">
                                <div class="col-lg-12">



                                    <div class="form-group">
                                        <label style="margin-left: -113px">Loan date</label>
                                        <label style="margin-left: 210px">Account No.</label>
                                        <br />
                                        <asp:TextBox Style="margin-left: 7px  !important" runat="server" ID="txtLoanDate" TextMode="Date" CssClass="form-control form-control-sm width" Enabled="false" />
                                        <asp:TextBox Style="margin-left: 93px  !important" runat="server" ID="txtAccountNo" TextMode="SingleLine" CssClass="form-control form-control-sm width" Enabled="false" />
                                        <br />

                                    </div>

                                    <div class="form-group">
                                        <label style="margin-left: -177px">Name</label>
                                        <label style="margin-left: 234px">CIF</label>
                                        <br />
                                        <asp:TextBox runat="server" ID="txtName" TextMode="SingleLine" CssClass="form-control form-control-sm width" Enabled="false" />
                                        <asp:TextBox Style="margin-left: 74px" runat="server" ID="txtCif" TextMode="SingleLine" CssClass="form-control form-control-sm width" Enabled="false" />
                                    </div>

                                    <div class="form-group">
                                        <label style="margin-left: -99px;">Open Date</label>
                                        <label style="margin-left: 206px">Last Transaction</label>
                                        <br />
                                        <asp:TextBox runat="server" ID="txtOpenDate" TextMode="SingleLine" CssClass="form-control form-control-sm width" Enabled="false" />
                                        <asp:TextBox Style="margin-left: 74px" runat="server" ID="txtLastTransaction" TextMode="SingleLine" CssClass="form-control form-control-sm width" Enabled="false" />
                                    </div>

                                    <div class="form-group">
                                        <label style="margin-left: -147px">Denomination</label>
                                        <label style="margin-left: 188px">Balance</label>
                                        <br />
                                        <asp:TextBox runat="server" ID="txtDenomination" TextMode="SingleLine" CssClass="form-control form-control-sm width" Enabled="false" />
                                        <asp:TextBox Style="margin-left: 74px" runat="server" ID="txtBalance" TextMode="SingleLine" CssClass="form-control form-control-sm width" Enabled="false" />
                                    </div>

                                    <div class="form-group">
                                        <label>Loan Amount</label>
                                        <br />
                                        <asp:TextBox runat="server" ID="txtLoanAmount" TextMode="SingleLine" CssClass="form-control form-control-sm width" Enabled="false"/>
                                    </div>
                                    <br />
                                    <div>
                                        <asp:Button Style="margin-left: 605px" runat="server" ID="btnApprove" Text="Approve" CssClass="btn btn-primary float-left m-t-n-xs" OnClick="btnApprove_Click" />
                                        <asp:Button Style="margin-left: 40px" runat="server" ID="btnReject" Text="Reject" CssClass="btn btn-primary float-left m-t-n-xs" OnClick="btnReject_Click" />
                                    </div>
                                <br />
                            </div>
                            </form>
                        </div>
                    </div>
            </div>
      
</body>

</html>
