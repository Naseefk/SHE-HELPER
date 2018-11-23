<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Password.aspx.cs" Inherits="SHe_Helper.Password" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Agent | Dashboard</title>
    <link href="css/default.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="css/plugins/dataTables/datatables.min.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">


    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Flot -->
    <script src="js/plugins/flot/jquery.flot.js"></script>
    <script src="js/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script src="js/plugins/flot/jquery.flot.spline.js"></script>
    <script src="js/plugins/flot/jquery.flot.resize.js"></script>
    <script src="js/plugins/flot/jquery.flot.pie.js"></script>
    <script src="js/plugins/flot/jquery.flot.symbol.js"></script>
    <script src="js/plugins/flot/jquery.flot.time.js"></script>

    <!-- Peity -->
    <script src="js/plugins/peity/jquery.peity.min.js"></script>
    <script src="js/demo/peity-demo.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="js/inspinia.js"></script>
    <%--<script src="js/plugins/pace/pace.min.js"></script>--%>

    <!-- jQuery UI -->
    <script src="js/plugins/jquery-ui/jquery-ui.min.js"></script>

    <!-- Jvectormap -->
    <script src="js/plugins/jvectormap/jquery-jvectormap-2.0.2.min.js"></script>
    <script src="js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>

    <!-- EayPIE -->
    <script src="js/plugins/easypiechart/jquery.easypiechart.js"></script>

    <!-- Sparkline -->
    <script src="js/plugins/sparkline/jquery.sparkline.min.js"></script>

    <!-- Sparkline demo data  -->
    <script src="js/demo/sparkline-demo.js"></script>
    <script src="js/plugins/dataTables/datatables.min.js"></script>
    <script src="js/plugins/dataTables/dataTables.bootstrap4.min.js"></script>

</head>
<body>
    <div id="page-wrapper" class="gray-bg">
        <div class="wrapper wrapper-content">

            <div class="ibox">

                <form id="form1" runat="server">
                    <div class="ibox-content ">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="login">
                                    <h3 class="m-t-none m-b">Password</h3>

                                    <p>Change your password</p>


                                    <div class="form-group">
                                        <label>Current password</label>
                                        <asp:TextBox runat="server" ID="txtCurrentPassword" TextMode="password" class="form-control" AutoPostBack="true" OnTextChanged="txtCurrentPassword_TextChanged" />
                                    </div>
                                    <asp:Panel ID="Panel1" DefaultButton="btnSave" runat="server" Enabled="false">
                                    <div class="form-group">
                                        <label>New password</label>
                                        <asp:TextBox runat="server" ID="txtNewPassword" TextMode="password" class=" form-control"/>
                                    </div>
                                    <div class="form-group">
                                        <label>Re-enter New Password</label>
                                        <asp:TextBox runat="server" ID="txtReEnter" TextMode="password" class="form-control"/>
                                    </div>
                                        <div>
                                        <asp:Label runat="server" ID="lblPassword" Text="" Style="color:red"  />
                                    </div>
                                        </asp:Panel>
                                    <br />
                                    <div>
                                        <asp:Button runat="server" ID="btnSave" Text="Save" class="btn btn-sm btn-primary float-left m-t-n-xs" style="margin-left: 150px" OnClick="btnSave_Click" />
                                    </div>
                                    
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
