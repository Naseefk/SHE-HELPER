<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DepositorAccount.aspx.cs" Inherits="SHe_Helper.DepositorAccount" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Depositor | Dashboard</title>
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


    <script src="js/plugins/dataTables/datatables.min.js"></script>
    <script src="js/plugins/dataTables/dataTables.bootstrap4.min.js"></script>
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
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="block m-t-xs font-bold "><%=Session["DepositorName"] %></span>
                            </a>
                        </div>
                        <div class="logo-element">
                            IN+
                        </div>
                    </li>
                    <li>
                        <a href="Depositor.aspx"><i class="fa fa-th-large"></i><span class="nav-label">Dashboards</span></a>

                    </li>
                    <li>
                        <a href="#Account"><i class="fa fa-money"></i><span class="nav-label">Account</span></a>
                    </li>
                    <li>
                        <a href="#Loan"><i class="fa fa-inr"></i><span class="nav-label">Loan</span></a>
                    </li>

                </ul>

            </div>

        </nav>

        <div id="page-wrapper1" class="gray-bg">
            <div class="wrapper border-bottom white-bg">

                <div class="row border-bottom">
                    <nav class="navbar navbar-static-top white-bg" role="navigation" style="margin-bottom: 0">
                        <div class="navbar-header">
                        </div>
                        <ul class="nav navbar-top-links navbar-right">
                            <li>
                                <span class="m-r-sm text-muted welcome-message">Welcome to Depositor Dashboard.</span>
                            </li>
                            <li>
                                <a onclick="MyPopUpWin('/Calculator.aspx',1000,600); return false;">
                                    <i class="fa fa-calculator"></i></a>
                            </li>
                            <li class="dropdown">
                                <a class="dropdown-toggle count-info" href="MessageInbox.aspx">
                                <i class="fa fa-envelope"></i><span class="label label-warning" ><%=Session["MessageCount"]%></span>                                </a>
                            </li>
                            <li><asp:LinkButton runat="server" ID="btnLogout" OnClick="logout">
                                <i class="fa fa-sign-out"></i>Logout</asp:LinkButton>
                            </li>
                        </ul>
                    </nav>
                </div>

                <div class=" col-sm" id="Account">
                    <div class="ibox collapsed">
                        <div class="ibox-title">
                            <h5>Account Details</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>

                            </div>
                        </div>
                        <div class="ibox-content">
                            <div class="table-responsive">
                                <asp:Repeater ID="rptData" runat="server">
                                    <HeaderTemplate>
                                        <table class="table table-striped table-bordered table-hover ">
                                            <thead>
                                                <tr>

                                                    <th>Account No.</th>
                                                    <th>Denomination</th>
                                                    <th>Date of Opening</th>
                                                    <th>Agent ID</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>

                                    <ItemTemplate>
                                        <tr class="gradeX">

                                            <td><a onclick="MyPopUpWin('/DepositorDetails.aspx?accno=<%#Eval("D_accno")%>',1000,600); return false;"><%# Eval("D_accno")%></a></td>
                                            <td><%# Eval("D_denomination")%></td>
                                            <td><%# Convert.ToDateTime(Eval("D_doj")).Date.ToString("yyyy-MM-dd")%></td>
                                            <td><a onclick="MyPopUpWin('/AgentDetails.aspx?id=<%#Eval("D_agentid")%>',1000,600); return false;"><%# Eval("D_agentid")%></a></td>



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


                    <div class="ibox collapsed" id="Loan">
                        <div class="ibox-title">
                            <h5>Loan Details</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>

                            </div>
                        </div>
                        <div class="ibox-content">
                            <div class="table-responsive">
                                <asp:Repeater ID="rptData2" runat="server">
                                    <HeaderTemplate>
                                        <table class="table table-striped table-bordered table-hover ">
                                            <thead>
                                                <tr>

                                                    <th>Account No.</th>
                                                    <th>Loan Date</th>
                                                    <th>Loan Amount</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>

                                    <ItemTemplate>
                                        <tr class="gradeX">

                                            <td><a onclick="MyPopUpWin('/LoanDetails.aspx?id=<%#Eval("D_accno")%>',1000,600); return false;"><%# Eval("D_accno")%></a></td>
                                            <td><%# Convert.ToDateTime(Eval("D_loandate")).Date.ToString("yyyy-MM-dd")%></td>
                                            <td><%# Eval("d_loanamt")%></td>



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
    <!-- Mainly scripts -->

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


</body>
</html>
