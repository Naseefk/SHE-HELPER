<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Loan.aspx.cs" Inherits="SHe_Helper.Loan" %>


<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Loan</title>
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

     <form id="form2" runat="server">
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
                            <a href="AgentLoanDetails.aspx"><i class="fa fa-inr"></i><span class="nav-label">Loan </span><span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level collapse">
                                <li><a href="loan.aspx">Entry</a></li>
                                <li><a href="AgentLoanDetails.aspx">Details</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="AgentCollection.aspx"><i class="fa fa-briefcase"></i><span class="nav-label">Collection</span>  </a>
                        </li>
                        <li>
                            <a href="AgentPayment.aspx"><i class="fa fa-money"></i><span class="nav-label">Payment</span></a>
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
                        <i class="fa fa-calculator"></i>  </a>
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

    <%--<div id="page-wrapper" class="gray-bg">--%>

        <div class="wrapper wrapper-content">

            
                    <div class="ibox">

                        <%--<form id="form1" runat="server">--%>
                            <div class="ibox-content text-center">
                                <div class="col-lg-12">
                                
                                    
                                    <asp:Panel ID="Panel1" runat="server">
                                    <div class="form-group">
                                        
                                        <label style="margin-left: -113px">Loan Date</label>
                                        <label style="margin-left: 210px">Account No.</label>
                                        <br />
                                        <asp:TextBox Style="margin-left: 7px  !important" runat="server" ID="txtLoanDate" TextMode="Date" CssClass="form-control form-control-sm width" />
                                        <asp:TextBox Style="margin-left: 135px  !important" runat="server" ID="txtAccountNo" TextMode="SingleLine" CssClass="form-control form-control-sm width" OnTextChanged="txtAccountNo_TextChanged" AutoPostBack="true"/>
                                        <br />
                                    </div>
                                    
                                    <div class="form-group">
                                        <label style="margin-left: -177px">Name</label>
                                        <label style="margin-left: 234px">CIF</label>
                                        <br />
                                        <asp:TextBox runat="server" ID="txtName" TextMode="SingleLine" CssClass="form-control form-control-sm width" Enabled="false" />
                                        <asp:TextBox Style="margin-left: 74px" runat="server" ID="txtCif" TextMode="SingleLine" CssClass="form-control form-control-sm width" Enabled="false" />
                                    </div>

                                    <div class="form-group">
                                        <label style="margin-left: -99px;">Open Date</label>
                                        <label style="margin-left: 206px">Last Transaction</label>
                                        <br />
                                        <asp:TextBox runat="server" ID="txtOpenDate" TextMode="SingleLine" CssClass="form-control form-control-sm width" Enabled="false" />
                                        <asp:TextBox Style="margin-left: 74px" runat="server" ID="txtLastTransaction" TextMode="SingleLine" CssClass="form-control form-control-sm width" Enabled="false" />
                                    </div>

                                    <div class="form-group">
                                        <label style="margin-left: -147px">Denomination</label>
                                        <label style="margin-left: 188px">Balance</label>
                                        <br />
                                        <asp:TextBox runat="server" ID="txtDenomination" TextMode="SingleLine" CssClass="form-control form-control-sm width" Enabled="false" />
                                        <asp:TextBox Style="margin-left: 74px" runat="server" ID="txtBalance" TextMode="SingleLine" CssClass="form-control form-control-sm width" Enabled="false" />
                                    </div>

                                    <div class="form-group">
                                        <label>Loan Amount</label>
                                        <br />
                                        <asp:TextBox runat="server" ID="txtLoanAmount" TextMode="SingleLine" CssClass="form-control form-control-sm width" />
                                    </div>
                                    <br />
                                    <div>
                                        <asp:Button style="margin-left: 605px" runat="server" ID="btnRequest" Text="Request" CssClass="btn btn-primary float-left m-t-n-xs" OnClick="btnRequest_Click" />
                                    </div>
                                </asp:Panel>
                                    <asp:Label ID="lblEligible" runat="server" Text="Not Eligibile" CssClass="fa fa-exclamation-circle" Visible="false" ForeColor="Red"></asp:Label>
                                    <br />
                                    <asp:Button style="margin-left: 605px" runat="server" ID="btnOk" Text="Ok" CssClass="btn btn-primary float-left m-t-n-xs" Visible="false" OnClick="btnOk_Click"/>
                                    <br />
                                  </div>
                            </div>
                                    
                                
                                    
                                </div>
                             <%--</form>--%>
                    </div>
                </div>

               

            </div>
            </div>
            </div>
         </form>
   
</body>

</html>
