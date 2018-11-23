<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MessageView.aspx.cs" Inherits="SHe_Helper.MessageView" %>


<!DOCTYPE html>

<html>
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Message | Inbox</title>
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
    <form id="form1" runat="server">
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
                <nav class="navbar navbar-static-top white-bg" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header">
                    </div>
                    <ul class="nav navbar-top-links navbar-right">
                        <li></li>

                    </ul>

                </nav>
            </div>
             <div class="col-12">
            
                <div class="col-lg-12 animated fadeInRight">

                        <div class="mail-box-header">
                            
                            <h2>View Message
                            </h2>
                            <div class="mail-tools tooltip-demo m-t-md">

                                <h5>
                                    <span class="font-normal">From: 
                                        <asp:Label ID="lblFrom" runat="server" Font-Bold="True"></asp:Label>
                                    </span> 
                                    <span class="float-right font-normal">
                                        <asp:Label ID="lblDate" runat="server"></asp:Label>
                                    </span>
                                </h5>
                        
                            </div>
                        </div>
                        <div class="mail-box">
                            <div class="mail-body">
                                
                                <asp:TextBox runat="server" id="txtMessage" TextMode="MultiLine" CssClass="form-control" Height="200px" Width="978px"/>
                            </div>

                            <div class="mail-body text-right tooltip-demo">
                                <a href="MessageCompose.aspx?id=<%=lblFrom.Text.ToString()%>">
                                <i class="fa fa-reply"></i>Reply</a>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
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
</body>
</html>
