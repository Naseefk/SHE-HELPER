<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgentCollectionAdvance.aspx.cs" Inherits="SHe_Helper.AgentCollectionAdvance" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Agent | Collection</title>
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
                    <div class="ibox-content text-center">
                        <div class="row">
                            <div class="col-lg-12">

                                <div class="form-group">
                                    <label style="margin-left: 2px">Advance</label>
                                    <asp:TextBox runat="server" ID="txtAdvance" TextMode="SingleLine" style="margin-left: 94px" CssClass="form-control form-control-sm width" />
                                </div>
                                <div class="form-group">
                                    <label>Loan Repayment</label>
                                    <asp:TextBox runat="server" ID="txtLoanRepayment" TextMode="SingleLine" style="margin-left: 44px" CssClass="form-control form-control-sm width" />
                                </div>
                                <div class="form-group">
                                    <label style="margin-left: 1px">Defualt fine</label>
                                    <asp:TextBox runat="server" ID="txtDefualtFine" TextMode="SingleLine" style="margin-left: 77px" CssClass="form-control form-control-sm width" />
                                </div>
                                <br />
                                
                                <asp:Button runat="server" ID="btnOk" Text="Ok" CssClass="btn btn-primary m-t-n-xs" OnClick="btnOk_Click"/>
                                <asp:Button runat="server" ID="btnCancel" Text="Cancel" style="margin-left: 47px" CssClass="btn btn-primary m-t-n-xs"/>
                                
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>



    </div>
   
</body>

</html>
