<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgentDetails.aspx.cs" Inherits="SHe_Helper.AgentDetails" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Agent | Details</title>
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
    <%--  <script src="js/inspinia.js"></script>--%>
    <%-- <script src="js/plugins/pace/pace.min.js"></script>--%>
    <!-- Steps -->
    <script src="js/plugins/steps/jquery.steps.min.js"></script>

    <!-- Jquery Validate -->
    <script src="js/plugins/validate/jquery.validate.min.js"></script>

</head>

<body class="">



    <div id="page-wrapper" class="gray-bg">

        <div class="wrapper wrapper-content">

            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox">
                        <div class="ibox-title text-center">
                            <h5>Agent Details</h5>
                        </div>
                        <div class="ibox-content">

                            <form id="form1" runat="server">

                                <div>
                                    <br />
                                </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label>Agent ID</label>
                                            <asp:TextBox runat="server" ID="txtId" CssClass="form-control login" Enabled="false" />

                                        </div>
                                        <div class="form-group">
                                            <label>Agent Name</label>
                                            <asp:TextBox runat="server" ID="txtName" TextMode="SingleLine " CssClass="form-control login" Enabled="false" />

                                        </div>
                                        <div class="form-group">
                                            <label>Address</label>
                                            <asp:TextBox runat="server" ID="txtAddress" TextMode="MultiLine" CssClass="form-control login" Enabled="false" />

                                        </div>

                                        <div class="form-group">
                                            <label>Contact</label>
                                            <asp:TextBox runat="server" ID="txtPhone" TextMode="SingleLine" CssClass="form-control login" Enabled="false" />

                                        </div>
                                        <div class="form-group">
                                            <label>Date Of Birth</label>
                                            <asp:TextBox runat="server" ID="txtDb" TextMode="SingleLine" CssClass="form-control login" Enabled="false" />

                                        </div>
                                        <div class="form-group">
                                            <label>Marital Status</label>
                                            <asp:TextBox runat="server" ID="txtMs" TextMode="SingleLine" CssClass="form-control login" Enabled="false" />
                                            <asp:Label runat="server" ID="Label4" Text="" />
                                        </div>

                                        <div class="form-group">
                                            <label>E-mail</label>
                                            <asp:TextBox runat="server" ID="txtEmail" TextMode="Email" CssClass="form-control login" Enabled="false" />
                                        </div>
                                        <div class="form-group">
                                            <label>Post Office</label>
                                            <asp:TextBox runat="server" ID="txtPost" TextMode="SingleLine" CssClass="form-control login" Enabled="false" />
                                        </div>
                                        <div class="form-group">
                                            <label>District</label>
                                            <asp:TextBox runat="server" ID="textDist" TextMode="SingleLine" CssClass="form-control login" Enabled="false" />


                                        </div>
                                        <div class="form-group">
                                            <label>Block</label>
                                            <asp:TextBox runat="server" ID="txtBlock" TextMode="SingleLine" CssClass="form-control login" Enabled="false" />
                                        </div>

                                        <div class="form-group">
                                            <label>Educational Qualification:</label>
                                            <asp:TextBox runat="server" ID="textEQ" TextMode="SingleLine" CssClass="form-control login" Enabled="false" />
                                        </div>
                                        <br />
                                        <div>
                                            <asp:Button Style="margin-left: 12px" runat="server" ID="btnApprove" Text="Approve" CssClass="btn btn-primary float-left m-t-n-xs" OnClick="btnApprove_Click" />
                                        </div>
                                        <div>
                                            <asp:Button Style="margin-left: 66px" runat="server" ID="btnReject" Text="Reject" CssClass="btn btn-primary float-left m-t-n-xs" OnClick="btnReject_Click" />
                                        </div>
                                        </div>
                            </form>

                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>

</body>

</html>
