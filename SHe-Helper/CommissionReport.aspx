<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommissionReport.aspx.cs" Inherits="SHe_Helper.CommissionReport" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Commision | Report</title>
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

        <div class="wrapper wrapper-content">


            <div class="ibox">

                <form id="form1" runat="server">
                    <div class="ibox-content">
                        <asp:Panel id="pnlContents" runat = "server">
                                <asp:Label style="margin-left: 421px" ID="lblYear" runat="server"></asp:Label>
                                &nbsp
                                <asp:Label style="margin-left: 2px" ID="lblMonth" runat="server"></asp:Label>
                                &nbsp
                                <label style="margin-left: 2px"> മാസത്തെ മഹിളാ പ്രധാൻ ഏജൻസി പ്രവർത്തന റിപ്പോർട്ട് </label>
                                <br />
                                <asp:Label ID="Label1" runat="server" Text="No of new account"></asp:Label>
                                <label style="margin-left: 500px">:</label>
                                <asp:Label ID="lblNoOfNewAcc" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label2" runat="server" Text="No of old account"></asp:Label>
                                <label style="margin-left: 506px">:</label>
                                <asp:Label ID="lblNoOfOldAcc" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label4" runat="server" Text="Total no of account"></asp:Label>
                                <label style="margin-left: 497px">:</label>
                                <asp:Label ID="lblTotalNoOfAcc" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label6" runat="server" Text="Amount in new account"></asp:Label>
                                <label style="margin-left: 470px">:</label>
                                <asp:Label ID="lblAmountInNewAcc" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label8" runat="server" Text="Amount in old account"></asp:Label>
                                <label style="margin-left: 477px">:</label>
                                <asp:Label ID="lblAmountInOldAcc" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label10" runat="server" Text="Advance deposit"></asp:Label>
                                <label style="margin-left: 514px">:</label>
                                <asp:Label ID="lblAdvanceDeposit" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label12" runat="server" Text="Total amount"></asp:Label>
                                <label style="margin-left: 533px">:</label>
                                <asp:Label ID="lblTotalAmt" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label14" runat="server" Text="Defualt amount"></asp:Label>
                                <label style="margin-left: 519px">:</label>
                                <asp:Label ID="lblDefualtAmount" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label16" runat="server" Text="Loan repayment"></asp:Label>
                                <label style="margin-left: 514px">:</label>
                                <asp:Label ID="lblLoanRepayment" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label18" runat="server" Text="No of schedule"></asp:Label>
                                <label style="margin-left: 523px">:</label>
                                <asp:Label ID="lblNoOfSchedule" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label20" runat="server" Text="Allowance"></asp:Label>
                                <label style="margin-left: 552px">:</label>
                                <asp:Label ID="lblAllowance" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label3" runat="server" Text="Commission"></asp:Label>
                                <label style="margin-left: 539px">:</label>
                                <asp:Label ID="lblCommission" runat="server"></asp:Label>
                                <br />
                                <div class="form-group float-left" dir="ltr">
                                    <asp:Label ID="lblName" runat="server"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblNo" runat="server"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblAddress" runat="server"></asp:Label>
                                </div>
                            <%--</div>--%>
                         </asp:Panel>
                        <br />
                        <asp:Button ID="btnPrint" runat="server" Text="Print" CssClass="btn btn-primary float-right m-t-n-xs" OnClientClick = "return PrintPanel()" />
                        
                    </div>
                </form>
            </div>
        </div>



    </div>
    <script type = "text/javascript">
        function PrintPanel() {
            var panel = document.getElementById("<%=pnlContents.ClientID %>");
            var printWindow = window.open('', '', 'height=400,width=800');
            printWindow.document.write('<html><head><title>DIV Contents</title>');
            printWindow.document.write('</head><body >');
            printWindow.document.write(panel.innerHTML);
            printWindow.document.write('</body></html>');
            printWindow.document.close();
            setTimeout(function () {
                printWindow.print();
            }, 500);
            return false;
        }
    </script>
</body>

</html>
