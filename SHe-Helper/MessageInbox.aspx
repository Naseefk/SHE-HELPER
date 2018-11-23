<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MessageInbox.aspx.cs" Inherits="SHe_Helper.MessageInbox" %>

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
                            
                          
                            <asp:LinkButton runat="server" ID="btnHome" OnClick="bak">
                                <i class="fa fa-home fa-3x"></i></asp:LinkButton>
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
            
            <div class="col-lg-12 animated fadeInRight">
               

            <div class="mail-box-header">

                
                    <div class="input-group">
                        
                    </div>
              
                <h2>
                    Inbox
                </h2>
                <div class="mail-tools tooltip-demo m-t-md">
                    <div>
                       <a class="btn btn-primary float-left m-t-n-xs Compose" href="MessageCompose.aspx">Compose</a>
                    </div>
                    <div>
                        <br />
                    </div>
                    <br />
                    
                </div>
            </div>
                  
                <div class="mail-box">
                    <table class="table table-hover table-mail">
                    <asp:Repeater ID="rptData" runat="server"  >
                    
                        
                            <ItemTemplate>
                                        <tr class="gradeX">
                                            <td class="mail-ontact" ><%# Eval("From")%></td>
                                            <td class="mail-subject"><a href="MessageView.aspx?id=<%#Eval("M_id")%>"><%# Eval("message")%></a></td>
                                            <td class="text-right mail-date"><%# Convert.ToDateTime(Eval("date")).ToString("MM-dd-yyyy hh:mm tt")%></td>
                                        </tr>

                           </ItemTemplate>
                        
                    
                    </asp:Repeater>
                    </table>
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
    <%--<script src="js/plugins/pace/pace.min.js"></script>--%>

    <!-- iCheck -->
    <script src="js/plugins/iCheck/icheck.min.js"></script>
    <script>
        $(document).ready(function(){
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
        });
    </script>

</body>
</html>
