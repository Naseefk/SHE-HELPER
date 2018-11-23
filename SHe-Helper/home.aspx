<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="template.page" %>


<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>She helper</title>
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="css/animate.css" rel="stylesheet" />
    <link href="css/awesome-bootstrap-checkbox.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/custom.css" rel="stylesheet" />
    <link href="css/default.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

</head>

<body>




    <form id="form1" runat="server">
        <div id="page-wrapper" class="gray-bg">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header">

                        <asp:ImageButton CssClass="logo" ID="ImageButton1" runat="server" ImageUrl="~/India Post LOGO.jpg" />



                    </div>
                    <ul class="nav navbar-top-links navbar-right">
                        <li>
                            <span class="m-r-sm text-muted welcome-message">Welcome to She Helper</span>
                        </li>


                        <li>
                            <a data-toggle="modal" href="#modal-form">
                                <i class="fa fa-user-secret"></i>Admin
                            </a>
                        </li>
                    </ul>
                    <div id="modal-form" class="modal fade" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-body">

                                    <asp:Panel ID="Panel1" DefaultButton="btnAdminLogin" runat="server">
                                        <div class="login">
                                            <h3 class="m-t-none m-b">Admin Login</h3>

                                            <p>Login to access the admin panel.</p>


                                            <div class="form-group">
                                                <label>Username</label>
                                                <asp:TextBox runat="server" ID="txtadminUsername" placeholder="Enter username" class="form-control" />
                                            </div>
                                            <div class="form-group">
                                                <label>Password</label>
                                                <asp:TextBox runat="server" ID="txtAdminpass" TextMode="password" placeholder="Password" class="form-control" />
                                            </div>
                                            <div>
                                                <asp:Button runat="server" ID="btnAdminlogin" Text="Log in" class="btn btn-sm btn-primary float-right m-t-n-xs" OnClick="btnAdminlogin_clicked" />
                                            </div>
                                            <div>
                                                <asp:Label runat="server" ID="lblAdmin" Text="" />
                                            </div>
                                        </div>
                                    </asp:Panel>

                                </div>

                            </div>
                        </div>
                    </div>
                </nav>
            </div>

            <div class="wrapper wrapper-content animated fadeInRight">
                <div class="row">
                    <div class="col-lg-7">
                        <div class="ibox ">
                            <div class="ibox-title">
                                <h5>Sign In</h5>
                            </div>

                            <div class="ibox-content">
                                <div class="row">
                                    <div class="col-sm-6 b-r">
                                        <asp:Panel ID="panel2" DefaultButton="btnLogin" runat="server">
                                        <asp:RadioButton ID="rbtnDepositor" Text="Depositor" runat="server" GroupName="radioUsers" CssClass="m-t-none m-b" OnCheckedChanged="rbtnDepositor_CheckedChanged" AutoPostBack="true" />
                                        <asp:RadioButton ID="rbtnAgent" Text="Agent" runat="server" GroupName="radioUsers" CssClass="agent" OnCheckedChanged="rbtnAgent_CheckedChanged" AutoPostBack="True" Checked="true" />

                                        <div class="form-group">
                                            <asp:Label ID="lblusername" runat="server">Email</asp:Label>
                                            <asp:TextBox ID="txtUsername" runat="server" placeholder="Enter email" class="form-control" />
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <asp:TextBox ID="txtpassword" runat="server" placeholder="Password" class="form-control" type="password"/>
                                        </div>
                                        <div>
                                            <asp:Button ID="btnLogin" runat="server" Text="Login" class="btn btn-sm btn-primary float-right m-t-n-xs" OnClick="btnLogin_Click" />
                                            <label>
                                                <input type="checkbox" class="i-checks">
                                                Remember me
                                            </label>
                                        </div>
                                        <div>
                                            <asp:Label ID="lblMessage" runat="server" CssClass="btn animated shake" Text="" data-animation="shake" />
                                        </div>
                                            </asp:Panel>
                                    </div>
                                    <div class="col-sm-6">
                                        <h4>Become an Agent</h4>
                                        <p>You can create an account:</p>
                                        <p class="text-center">
                                            <a href="agentsignup.aspx"><i class="fa fa-sign-in big-icon"></i></a>
                                        </p>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="ibox ">
                            <div class="ibox-title">
                                <h5>5-Year Post Office Recurring Deposit Account (RD)</h5>

                            </div>
                            <div class="ibox-content">
                                <ul class="bulleted-list">
                                    <li>6.9% per annum (quarterly compounded)</li> 
                                    <li>​Minimum INR 10/- per month or any amount in multiples of INR 5/-. No maximum limit.</li>
                                    <li>Account can be opened by cash / Cheque and in case of Cheque the date of deposit shall be date of presentation of Cheque</li>
                                    <li>Nomination facility is available at the time of opening</li>
                                    <li>Any number of accounts can be opened in any post office</li>
                                    <li>Subsequent deposit can be made up to 15th day of next month if account is opened up to 15th​ of a calendar month and up to last working day of next month if account is opened between 16th day and last working day of a calendar month.</li>
                                    <li>If subsequent deposit is not made up to the prescribed day, a default fee is charged for each default, default fee @ 0.05 rs for every 5 rupee shall be charged. After 6 regular defaults, the account becomes discontinued and can be revived in two months but if the same is not revived within this period, no further deposit can be made.</li>
                                    <li>If in any RD account, there is monthly default amount , ​ the depositor has to first pay the defaulted monthly deposit with default fee and then pay the current month deposit.</li>
                                    <li>One withdrawal up to 50% of the balance allowed after one year. It may be repaid in one lumpsum along with interest at the prescribed rate at any time during the currency of the account​</li>

                                </ul>
                                

                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="footer">
                <div>
                    <strong>Copyright</strong> ictcodes Pvt. Ltd. &copy; 2018
                </div>
            </div>

        </div>

    </form>

</body>

</html>
