<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Calculator.aspx.cs" Inherits="SHe_Helper.Calculator" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Calculator</title>
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

        <div class="wrapper wrapper-content">

            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox">
                        <div class="ibox-title">
                            <h2 style="text-align:center">Calculator</h2>
                        </div>

                        <div class="ibox-content text-center">

                            <form id="form1" runat="server">

                                <div>
                                    <br />
                                </div>

                                <div class="form-group">
                                    <label>Monthly Payment</label>
                                    <br />
                                    <asp:TextBox runat="server" ID="txtMonthlyPmt" CssClass="form-control form-control-sm width" />

                                </div>
                                <div class="form-group">
                                    <asp:RadioButton ID="rbtnMonth" Text="No. of Months" runat="server" GroupName="radioPeriod" CssClass="m-t-none m-b" Checked="true" AutoPostBack="true" OnCheckedChanged="rbtnYear_CheckedChanged" />
                                    <br />
                                    <asp:TextBox runat="server" ID="txtMonth" CssClass="form-control form-control-sm width" />
                                </div>
                                <div class="form-group">
                                    <asp:RadioButton ID="rbtnDate" Text="From date" runat="server" GroupName="radioPeriod" CssClass="m-t-none m-b" AutoPostBack="true" OnCheckedChanged="rbtnDate_CheckedChanged" />
                                    <label>To date</label>
                                    <br />


                                    <asp:TextBox runat="server" ID="txtFromdate" TextMode="Date" CssClass="form-control form-control-sm width" />


                                    <asp:TextBox runat="server" ID="txtTodate" TextMode="Date" CssClass="form-control form-control-sm width" />
                                </div>
                                <br />
                                <div>
                                    <asp:Button runat="server" ID="btnCalculate" Text="Calculate" CssClass="btn btn-primary m-t-n-xs" OnClick="btnCalculate_Click" />
                                </div>
                                <div>
                                    <br />
                                </div>
                                <br />
                                <br />
                                <div class="form-group">
                                    <label>Total Amount</label>
                                    <br />
                                    <asp:TextBox runat="server" ID="txtTotalAmount" CssClass="form-control form-control-sm width" />
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
