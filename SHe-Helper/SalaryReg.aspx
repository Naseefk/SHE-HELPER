<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SalaryReg.aspx.cs" Inherits="SHe_Helper.SalaryReg" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Admin | Variable</title>
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
                                    <label style="margin-left: -28px">% of allowance</label>
                                    <asp:TextBox runat="server" ID="txtAllowance" TextMode="SingleLine" style="margin-left: 93px" CssClass="form-control form-control-sm width" Enabled="false" />
                                </div>
                                <div class="form-group">
                                    <label style="margin-left: -28px">% of tax</label>
                                    <asp:TextBox runat="server" ID="txtTax" TextMode="SingleLine" style="margin-left: 134px" CssClass="form-control form-control-sm width" Enabled="false"/>
                                </div>
                                <div class="form-group">
                                    <label style="margin-left: -27px">% of commission</label>
                                    <asp:TextBox runat="server" ID="txtCommission" TextMode="SingleLine" style="margin-left: 78px" CssClass="form-control form-control-sm width" Enabled="false"/>
                                </div>
                                <div class="form-group">
                                    <label style="margin-left: -29px">Limit of total amount</label>
                                    <asp:TextBox runat="server" ID="txtLimitOftotalamt" TextMode="SingleLine" style="margin-left: 53px" CssClass="form-control form-control-sm width" Enabled="false" />
                                </div>
                                <div class="form-group">
                                    <label style="margin-left: -27px">% of interest</label>
                                    <asp:TextBox runat="server" ID="txtInterest" TextMode="SingleLine" style="margin-left: 105px" CssClass="form-control form-control-sm width" Enabled="false" />
                                </div>
                                <div class="form-group">
                                    <label style="margin-left: -27px">% of tax  in maturity value</label>
                                    <asp:TextBox runat="server" ID="txtInterestax" TextMode="SingleLine" style="margin-left: 27px" CssClass="form-control form-control-sm width" Enabled="false" />
                                </div>
                                <br />
                                <br />
                                
                                <asp:Button runat="server" ID="btnSave" Text="Save" CssClass="btn btn-primary m-t-n-xs" OnClick="btnSave_Click"/>
                                <asp:Button runat="server" ID="btnEdit" Text="Edit" style="margin-left: 47px" CssClass="btn btn-primary m-t-n-xs" OnClick="btnEdit_Click"/>
                                <asp:Button runat="server" ID="btnCancel" Text="Cancel" style="margin-left: 47px" CssClass="btn btn-primary m-t-n-xs" OnClick="btnCancel_Click"/>
                                
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>



    </div>
   
</body>
</html>
