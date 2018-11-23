<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MessageCompose.aspx.cs" Inherits="SHe_Helper.MessageCompose" %>


<!DOCTYPE html>

<html>
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Message | Compose</title>
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
    <script src="js/plugins/pace/pace.min.js"></script>

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
    <form id="form2" runat="server">
        <div id="wrapper">
            <nav class="navbar-default navbar-static-side" role="navigation">
                <div class="sidebar-collapse">
                    <ul class="nav metismenu" id="side-menu">
                        <li class="nav-header">
                            <div class="dropdown profile-element">
                            </div>
                            <div class="logo-element">
                                IN+
                            </div>

                        </li>
                        <li>
                            <a href="MessageCompose.aspx"><i class="fa fa-plus"></i><span class="nav-label">Compose</span> </a>

                        </li>
                        <li>
                            <a href="MessageInbox.aspx"><i class="fa fa-envelope"></i><span class="nav-label">Inbox</span></a>
                        </li>
                        <li>
                            <a href="MessageSent.aspx"><i class="fa fa-paper-plane"></i><span class="nav-label">Sent</span></a>

                        </li>

                    </ul>

                </div>
            </nav>


            <div id="page-wrapper1" class="gray-bg">
                <div class="row border-bottom">
                </div>

                <div class="col-12">

                    <div class="mail-box-header">
                        <h2>Compose Message
                        </h2>
                        <div class="mail-tools tooltip-demo m-t-md">
                            <div class="btn-group float-right">
                                <a href="MessageInbox.aspx" class="btn btn-danger btn-sm" data-toggle="tooltip" data-placement="top" title="Discard email"><i class="fa fa-times"></i>Discard</a>
                            </div>

                            <div>
                                <a class="btn btn-primary float-left m-t-n-xs Inbox" href="MessageInbox.aspx">Inbox</a>

                            </div>
                            <div>
                                <br />
                            </div>
                            <br />
                        </div>
                    </div>
                    <div class="mail-box">


                        <div class="mail-body">

                            <%--<form method="get">--%>
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label">From:</label>
                                <div class="col-sm-10">
                                    <asp:TextBox runat="server" ID="txtFrom" TextMode="Singleline" CssClass="form-control" Enabled="false" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <%--<label class="col-sm-2 col-form-label">To:</label>--%>

                                <%--<div class="col-sm-10">
                                   <asp:TextBox runat="server" ID="txtTo" TextMode="Singleline" CssClass="form-control"/>
                                </div>--%>
                                <label class="col-sm-2 col-form-label">To:</label>
                                <div class="col-sm-10">
                                    <input class="form-control form-control-sm width" type="search" list="datalist" required="" id="txtbox" runat="server" />
                                </div>
                                <datalist id="datalist" runat="server">

                                </datalist>

                            </div>

                            <%--</form>--%>
                        </div>

                        <div class="mail-text h-200">

                            <div class="summernote">
                                <asp:TextBox runat="server" ID="txtCompose" TextMode="MultiLine" CssClass="form-control" Height="200px" Width="1047px" />

                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="mail-body text-right tooltip-demo">

                            <asp:Button ID="btnSend" runat="server" Text="Send" CssClass="btn btn-primary float-right m-t-n-xs" OnClick="btnSend_Click1" />

                            <a href="MessageInbox.aspx" class="btn btn-white btn-sm" data-toggle="tooltip" data-placement="top" title="Discard email"><i class="fa fa-times"></i>Discard</a>
                        </div>
                        <div class="clearfix"></div>



                    </div>

                </div>


            </div>
        </div>
    </form>

    <!-- Mainly scripts -->
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="js/inspinia.js"></script>
    <script src="js/plugins/pace/pace.min.js"></script>

    <!-- iCheck -->
    <script src="js/plugins/iCheck/icheck.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
        });
    </script>

    <p>
        &nbsp;
    </p>

</body>
</html>
