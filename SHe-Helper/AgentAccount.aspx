<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgentAccount.aspx.cs" Inherits="SHe_Helper.AgentAccount" %>


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
                                    <span class="block m-t-xs font-bold"><%=Session["AgentName"] %></span>
                                    <span class="text-muted text-xs block"><%=Session["Agent"] %> <b class="caret"></b></span>
                                </a>
                            </div>
                            <div class="logo-element">
                                IN+
                            </div>
                        </li>
                        <li>
                            <a href="Agent.aspx"><i class="fa fa-th-large"></i><span class="nav-label">Dashboards</span> </a>

                        </li>
                        <li>
                            <a href="AgentGeneralAccount.aspx"><i class="fa fa-user-circle"></i><span class="nav-label">General Accounts</span></a>
                        </li>
                        <li>
                            <a href="AgentAccount.aspx"><i class="fa fa-user"></i><span class="nav-label">Accounts</span></a>

                        </li>
                        <li>
                            <a href="mailbox.html"><i class="fa fa-inr"></i><span class="nav-label">Loan </span><span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level collapse">
                                <li><a href="loan.aspx">Entry</a></li>
                                <li><a href="AgentLoanDetails.aspx">Details</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="AgentCollection.aspx"><i class="fa fa-briefcase"></i><span class="nav-label">Collection</span>  </a>
                        </li>
                        <li>
                            <a href="AgentPayment.aspx"><i class="fa fa-university"></i><span class="nav-label">Payment</span></a>
                        </li>
                        <li>
                            <a href="AgentSchedule.aspx"><i class="fa fa-calendar"></i><span class="nav-label">Schedule</span></a>

                        </li>
                        <li>
                            <a href="AgentReport.aspx"><i class="fa fa-file"></i><span class="nav-label">Report</span><span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level collapse">
                                <li><a href="AgentReport.aspx">Allowance</a></li>
                                <li><a href="CommissionReport.aspx">Monthly Report</a></li>
                            </ul>
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
                                <span class="m-r-sm text-muted welcome-message">Welcome to Agent Dashboard.</span>
                            </li>
                            <li>
                                <a onclick="MyPopUpWin('/Calculator.aspx',1000,600); return false;">
                                    <i class="fa fa-calculator"></i></a>
                            </li>
                            <li class="dropdown">
                            <a class="dropdown-toggle count-info" href="MessageInbox.aspx">
                                <i class="fa fa-envelope"></i><span class="label label-warning"><%=Session["MessageCount"]%></span>
                            </a>
                            </li>
                            <li>
                                <asp:LinkButton runat="server" ID="btnLogout" OnClick="logout">
                                <i class="fa fa-sign-out"></i>Logout</asp:LinkButton>
                            </li>


                        </ul>

                    </nav>



                    <div class="col-sm">
                        <div class="ibox ">
                            <div class="ibox-title">
                                <h5>Accounts</h5>
                                <div class="ibox-tools">
                                    <a class="collapse-link">
                                        <i class="fa fa-chevron-up"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="ibox-content">
                                <div class="panel-body">
                                    <div class="panel-group" id="accordion">
                                        <div class="panel panel-default" id="Advance">
                                            <div class="panel-heading">
                                                <h5 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Advance Account</a>
                                                </h5>
                                            </div>
                                            <div id="collapseOne" class="panel-collapse collapse in">
                                                <div class="panel-body">

                                                    <div class="table-responsive">
                                                        <asp:Repeater ID="rptData" runat="server">
                                                            <HeaderTemplate>
                                                                <table class="table table-striped table-bordered table-hover dataTables-example">
                                                                    <thead>
                                                                        <tr>

                                                                            <th>Name</th>
                                                                            <th>CIF</th>
                                                                            <th>Account No.</th>
                                                                            <th>Amount</th>
                                                                            <th>Last Date</th>
                                                                            <th>Address</th>

                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                            </HeaderTemplate>

                                                            <ItemTemplate>
                                                                <tr class="gradeX">


                                                                    <td><%# Eval("D_name")%></td>
                                                                    <td><%# Eval("CIF")%></td>
                                                                    <td><%# Eval("D_accno")%></td>
                                                                    <td><%# Eval("D_denomination")%></td>
                                                                    <td><%# Convert.ToDateTime(Eval("D_duedate")).Date.ToString("yyyy-MM-dd")%></td>
                                                                    <td><%# Eval("D_housename") + "," + Eval("D_place") + "," + Eval("D_post")%></td>



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
                                        <div class="panel panel-default" id="Default">
                                            <div class="panel-heading">
                                                <h5 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Default Account</a>
                                                </h5>
                                            </div>
                                            <div id="collapseTwo" class="panel-collapse collapse in">
                                                <div class="panel-body">

                                                    <div class="table-responsive">
                                                        <asp:Repeater ID="rptData2" runat="server" OnItemDataBound="rptData2_ItemDataBound">
                                                            <HeaderTemplate>
                                                                <table class="table table-striped table-bordered table-hover dataTables-example">
                                                                    <thead>
                                                                        <tr>

                                                                            <th>Name</th>
                                                                            <th>CIF</th>
                                                                            <th>Account No.</th>
                                                                            <th>Amount</th>
                                                                            <th>Last Month</th>
                                                                            <th>No of Default</th>
                                                                            <th>Address</th>

                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                            </HeaderTemplate>

                                                            <ItemTemplate>
                                                                <tr class="gradeX">


                                                                    <td><%# Eval("D_name")%></td>
                                                                    <td><%# Eval("CIF")%></td>
                                                                    <td><%# Eval("D_accno")%></td>
                                                                    <td><%# Eval("D_denomination")%></td>
                                                                    <td><%# Convert.ToDateTime(Eval("D_lpdate")).ToString("dd-MM-yyyy")%></td>
                                                                    <td><asp:Literal ID="litdefault" runat="server"></asp:Literal></td>
                                                                    <td><%# Eval("D_housename") + "," + Eval("D_place") + "," + Eval("D_post")%></td>
                                                                    <asp:hiddenField runat="server" ID="hiddenacc" Value='<%# Eval("D_accno") %>' />


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
                                        <div class="panel panel-default" id="Matured">
                                            <div class="panel-heading">
                                                <h5 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">Matured Account</a>
                                                </h5>
                                            </div>
                                            <div id="collapseThree" class="panel-collapse collapse in">
                                                <div class="panel-body">

                                                    <div class="table-responsive">
                                                        <asp:Repeater ID="rptData3" runat="server">
                                                            <HeaderTemplate>
                                                                <table class="table table-striped table-bordered table-hover dataTables-example">
                                                                    <thead>
                                                                        <tr>
                                                                            <th></th>
                                                                            <th>Name</th>
                                                                            <th>CIF</th>
                                                                            <th>Account No.</th>
                                                                            <th>Amount</th>
                                                                            <th>Date of Open</th>
                                                                            <th>Balance</th>

                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                            </HeaderTemplate>

                                                            <ItemTemplate>
                                                                <tr class="gradeX">

                                                                    <td>
                                                                        <asp:CheckBox ID="CheckBox2" runat="server" /></td>
                                                                    <td><%# Eval("D_name")%></td>
                                                                    <td><%# Eval("CIF")%></td>
                                                                    <td><%# Eval("D_accno")%></td>
                                                                    <td><%# Eval("D_denomination")%></td>
                                                                    <td><%# Convert.ToDateTime(Eval("D_doj")).Date.ToString("yyyy-MM-dd")%></td>
                                                                    <td><%# Eval("D_totamount")%></td>
                                                                    <asp:hiddenField runat="server" ID="hiddenacc" Value='<%# Eval("D_accno") %>' />


                                                                </tr>

                                                            </ItemTemplate>

                                                            <FooterTemplate>
                                                                </tbody>
                                    
                                               </table>
                                                    <asp:Button runat="server" ID="btnClose" Text="Close" CssClass="btn btn-primary m-t-n-xs" OnClick="btnClose_Click"/>
                                                            </FooterTemplate>

                                                        </asp:Repeater>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default" id="Closed">
                                            <div class="panel-heading">
                                                <h5 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour">Closed Account</a>
                                                </h5>
                                            </div>
                                            <div id="collapseFour" class="panel-collapse collapse in">
                                                <div class="panel-body">

                                                    <div class="table-responsive">
                                                        <asp:Repeater ID="rptData4" runat="server">
                                                            <HeaderTemplate>
                                                                <table class="table table-striped table-bordered table-hover dataTables-example">
                                                                    <thead>
                                                                        <tr>

                                                                            <th>Name</th>
                                                                            <th>CIF</th>
                                                                            <th>Account No.</th>
                                                                            <th>Amount</th>
                                                                            <th>Date of Open</th>
                                                                            <th>Date of Close</th>
                                                                            <th>Balance</th>

                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                            </HeaderTemplate>

                                                            <ItemTemplate>
                                                                <tr class="gradeX">


                                                                    <td><%# Eval("D_name")%></td>
                                                                    <td><%# Eval("CIF")%></td>
                                                                    <td><%# Eval("D_accno")%></td>
                                                                    <td><%# Eval("D_denomination")%></td>
                                                                    <td><%# Convert.ToDateTime(Eval("D_doj")).Date.ToString("yyyy-MM-dd")%></td>
                                                                    <td><%# Convert.ToDateTime(Eval("D_closedate")).Date.ToString("yyyy-MM-dd")%></td>
                                                                    <td><%# Eval("D_totamount")%></td>



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
                                        <div class="panel panel-default"  id="Extended">
                                            <div class="panel-heading">
                                                <h5 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseFive">Extended Account</a>
                                                </h5>
                                            </div>
                                            <div id="collapseFive" class="panel-collapse collapse in">
                                                <div class="panel-body">

                                                    <div class="table-responsive">
                                                        <asp:Repeater ID="rptData5" runat="server">
                                                            <HeaderTemplate>
                                                                <table class="table table-striped table-bordered table-hover dataTables-example">
                                                                    <thead>
                                                                        <tr>
                                                                            <th></th>
                                                                            <th>Name</th>
                                                                            <th>CIF</th>
                                                                            <th>Account No.</th>
                                                                            <th>Amount</th>
                                                                            <th>Date of Open</th>
                                                                            <th>Balance</th>


                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                            </HeaderTemplate>

                                                            <ItemTemplate>
                                                                <tr class="gradeX">

                                                                    <td>
                                                                        <asp:CheckBox ID="CheckBox1" runat="server" /></td>
                                                                    <td><%# Eval("D_name")%></td>
                                                                    <td><%# Eval("CIF")%></td>
                                                                    <td><%# Eval("D_accno")%></td>
                                                                    <td><%# Eval("D_denomination")%></td>
                                                                    <td><%# Convert.ToDateTime(Eval("D_doj")).Date.ToString("yyyy-MM-dd")%></td>
                                                                    <td><%# Eval("D_totamount")%></td>
                                                                    <asp:hiddenField runat="server" ID="hiddenacc" Value='<%# Eval("D_accno") %>' />
                                                                </tr>

                                                            </ItemTemplate>

                                                            <FooterTemplate>
                                                                </tbody>
                                    
                                               </table>
                                                    <asp:Button runat="server" ID="btnClose" Text="Close" CssClass="btn btn-primary m-t-n-xs" OnClick="btnClose_Click" />
                                                            </FooterTemplate>

                                                        </asp:Repeater>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default" id="Expired">
                                            <div class="panel-heading">
                                                <h5 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseSix">Expired Account</a>
                                                </h5>
                                            </div>
                                            <div id="collapseSix" class="panel-collapse collapse in">
                                                <div class="panel-body">

                                                    <div class="table-responsive">
                                                        <asp:Repeater ID="rptData6" runat="server" OnItemDataBound="rptData6_ItemDataBound">
                                                            <HeaderTemplate>
                                                                <table class="table table-striped table-bordered table-hover dataTables-example">
                                                                    <thead>
                                                                        <tr>
                                                                            <th></th>
                                                                            <th>Name</th>
                                                                            <th>CIF</th>
                                                                            <th>Account No.</th>
                                                                            <th>Amount</th>
                                                                            <th>No of Default</th>
                                                                            <th>Address</th>
                                                                            <th>Balance</th>

                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                            </HeaderTemplate>

                                                            <ItemTemplate>
                                                                <tr class="gradeX">

                                                                    <td>
                                                                        <asp:CheckBox ID="CheckBox1" runat="server" /></td>
                                                                    <td><%# Eval("D_name")%></td>
                                                                    <td><%# Eval("CIF")%></td>
                                                                    <td><%# Eval("D_accno")%></td>
                                                                    <td><%# Eval("D_denomination")%></td>
                                                                    <td><asp:Literal ID="litdefault" runat="server"></asp:Literal></td>
                                                                    <td><%#Eval("D_housename")+ "," +Eval("D_place")+ "," +Eval("D_place")%></td>
                                                                    <td><%# Eval("D_totamount")%></td>
                                                                    <asp:hiddenField runat="server" ID="hiddenacc" Value='<%# Eval("D_accno") %>' />
                                                                </tr>

                                                            </ItemTemplate>

                                                            <FooterTemplate>
                                                                </tbody>
                                    
                                               </table>
                                                    <asp:Button runat="server" ID="btnClose" Text="Close" CssClass="btn btn-primary m-t-n-xs" OnClick="btnClose_Click" />
                                                            </FooterTemplate>

                                                        </asp:Repeater>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>





    <!-- Mainly scripts -->

        <%-- <script>
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

    </script>--%>
    

</body>
</html>
