<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLoan.aspx.cs" Inherits="SHe_Helper.AdminLoan" %>


<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Admin | Loan</title>
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
     <script>
        $(document).ready(function () {
            $('.dataTables-example').DataTable({
                pageLength: 25,
                responsive: true,
                dom: '<"html5buttons"B>lTfgitp',
                buttons: [
                    { extend: 'copy' },
                    { extend: 'csv' },
                    { extend: 'excel', title: 'ExampleFile' },
                    { extend: 'pdf', title: 'ExampleFile' },

                    {
                        extend: 'print',
                        customize: function (win) {
                            $(win.document.body).addClass('white-bg');
                            $(win.document.body).css('font-size', '10px');

                            $(win.document.body).find('table')
                                    .addClass('compact')
                                    .css('font-size', 'inherit');
                        }
                    }
                ]

            });

        });

    </script>

    <script>
    function MyPopUpWin(url, width, height) {
            var leftPosition, topPosition;
            //Allow for borders.
            leftPosition = (window.screen.width / 2) - ((width / 2) + 10);
            //Allow for title and status bars.
            topPosition = (window.screen.height / 2) - ((height / 2) + 50);
            //Open the window.
            window.open(url, "Window2",
            "status=no,height=" + height + ",width=" + width + ",resizable=yes,left="
            + leftPosition + ",top=" + topPosition + ",screenX=" + leftPosition + ",screenY="
            + topPosition + ",toolbar=no,menubar=no,scrollbars=no,location=no,directories=no");
    }
        </script>
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
                        <a href="Admin.aspx"><i class="fa fa-th-large"></i><span class="nav-label">Dashboards</span> </a>

                    </li>
                    <li>
                        <a href="AdminAgent.aspx"><i class="fa fa-user-circle"></i><span class="nav-label">Agents</span></a>
                    </li>
                    <li>
                        <a href="AdminDepositor.aspx"><i class="fa fa-user"></i><span class="nav-label">Depositor</span></a>
                    </li>
                    <li>
                        <a href="AdminLoan.aspx"><i class="fa fa-inr"></i><span class="nav-label">Loan</span></a>
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
                        <li>
                            <span class="m-r-sm text-muted welcome-message">Welcome to Admin Dashboard.</span>
                        </li>
                        <li>
                            <a onclick="MyPopUpWin('/SalaryReg.aspx',1000,600); return false;">
                            <i class="fa fa-wrench"></i>  </a>
                        </li>
                        <li>
                       <a onclick="MyPopUpWin('/Calculator.aspx',1000,600); return false;">
                        <i class="fa fa-calculator"></i>  </a>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" href="MessageInbox.aspx">
                            <i class="fa fa-envelope"></i><span class="label label-warning" ><%=count%></span>
                            </a>
                          </li>
                        <li><asp:LinkButton runat="server" ID="btnLogout" OnClick="logout">
                                <i class="fa fa-sign-out"></i>Logout</asp:LinkButton>
                            </li>

                    </ul>
                </nav>
                <div class="col-12">

                    <div class="ibox ">
                        <div class="ibox-title">
                           
                            <h5>Loans</h5>
                        </div>
                        <div class="ibox-content">

                            <div class="table-responsive">

                                <asp:Repeater ID="rptData" runat="server">
                                    <HeaderTemplate>
                                        <table class="table table-striped table-bordered table-hover dataTables-example">
                                            <thead>
                                                <tr>
                                                    <th>Account No</th>
                                                    <th>Name</th>
                                                    <th>Amount</th>
                                                    <th>Date</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>

                                    <ItemTemplate>
                                        <tr class="gradeX">

                                            <td><a onclick="MyPopUpWin('/LoanApprove.aspx?id=<%# Eval("D_accno")%>',1000,600); return false;"><%# Eval("D_accno")%></a></td>
                                            <td><%# Eval("D_name")%></td>
                                            <td><%# Eval("D_loanamt")%></td>
                                            <td><%# Convert.ToDateTime(Eval("D_loandate")).Date.ToString("yyyy-MM-dd")%></td>
                                        </tr>

                                    </ItemTemplate>

                                    <FooterTemplate>
                                        </tbody>
                       
                                </table>
                                    </FooterTemplate>

                                </asp:Repeater>

                            </div>

                        </div>
                    </div>


                </div>

            </div>



        </div>
    </div>
    </form>

    </body>
</html>



    <!-- Mainly scripts -->

   

