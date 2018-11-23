<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="agentsignup.aspx.cs" Inherits="SHe_Helper.agentsignup" %>


<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Agent | Sign up</title>
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

  
    <script src="js/plugins/steps/jquery.steps.min.js"></script>

    <!-- Jquery Validate -->
    <script src="js/plugins/validate/jquery.validate.min.js"></script>
</head>

<body class="">



    <div id="page-wrapper" class="gray-bg">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top  " role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <%-- <li>
                        <span class="m-r-sm text-muted welcome-message">Registration form.</span>
                    </li>--%>



                    <li>
                        <a href="home.aspx">
                            <i class="fa fa-sign-out"></i>Already a member? Sign in
                        </a>
                    </li>
                </ul>

            </nav>
        </div>
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-sm-4">
            </div>
            <div class="col-sm-8">
            </div>
        </div>

        <div class="wrapper wrapper-content">
            <%--<div class="animated fadeInRightBig">--%>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ibox">
                            <div class="ibox-title">
                                <h5>Registration Form</h5>
                            </div>
                            <div class="ibox-content">
                                <h2>Agent Register Wizard
                                </h2>
                                <p>
                                    Enter the correct information to enroll.
                                </p>
                                <form id="form1" runat="server">
                                    <h2>Account Information</h2>
                                    <div><br /></div>
                                    <div class="row">
                                        <div class="col-lg-8">
                                            <div class="form-group">
                                                <label>Username *</label>
                                                <asp:TextBox runat="server" ID="txtuserName" CssClass="form-control required" />
                                                <asp:Label runat="server" ID="lblAvalabilty" Text="" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtuserName" ErrorMessage="Enter Username" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="form-group">
                                                <label>Password *</label>
                                                <asp:TextBox runat="server" ID="txtpassword" TextMode="Password" CssClass="form-control required" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpassword" ErrorMessage="Enter password" ForeColor="Red"></asp:RequiredFieldValidator>
                                                <asp:Label runat="server" ID="lblPassword" Text="" />
                                            </div>
                                            <div class="form-group">
                                                <label>Confirm Password *</label>
                                                <asp:TextBox runat="server" ID="txtcpassword" TextMode="Password" CssClass="form-control required" />
                                                <asp:Label runat="server" ID="lblcpassword" Text="" />
                                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtpassword" ControlToValidate="txtcpassword" ErrorMessage="Password mismatch" ForeColor="Red"></asp:CompareValidator>
                                            </div>
                                            <div><br /></div>
                                            <h2>Personal Details</h2>
                                             <div class="form-group">
                                                <label>Full Name *</label>
                                                <asp:TextBox runat="server" ID="txtName" TextMode="SingleLine" CssClass="form-control required" />
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtName" ErrorMessage="Enter Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                             <div class="form-group">
                                                <label>House Name *</label>
                                                <asp:TextBox runat="server" ID="txtHouseName" TextMode="SingleLine" CssClass="form-control required" />
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtHouseName" ErrorMessage="Enter House Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="form-group">
                                                <label>Place *</label>
                                                <asp:TextBox runat="server" ID="txtPlace" TextMode="SingleLine" CssClass="form-control required" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPlace" ErrorMessage="Enter Place" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="form-group">
                                                <label>Post *</label>
                                                <asp:TextBox runat="server" ID="txtPost" TextMode="SingleLine" CssClass="form-control required" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPost" ErrorMessage="Enter Post" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="form-group">
                                                <label>Pin *</label>
                                                <asp:TextBox runat="server" ID="txtPin" TextMode="SingleLine" CssClass="form-control required" />
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPin" ErrorMessage="Enter Valid PIN Code" ForeColor="Red" ValidationExpression="[0-9]{6}"></asp:RegularExpressionValidator>
                                            </div>
                                             <div class="form-group">
                                                <label>Date of Birth *</label>
                                                <asp:TextBox runat="server" ID="txtDOB" TextMode="Date" CssClass="form-control required" />
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtDOB" ErrorMessage="Enter Date of Birth" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="form-group">
                                                <label>Marital Status </label>
                                                <div>
                                                 <asp:radioButton runat="server" ID="rbtnSingle" GroupName="Married" Text="Single" CssClass="custom-radio" Checked="true" />
                                                <asp:radioButton runat="server" ID="rbtnMarried" GroupName="Married" Text="Married" CssClass="custom-radio agent" />
                                              </div>
                                            </div>
                                             <div class="form-group">
                                                <label>E-mail *</label>
                                                <asp:TextBox runat="server" ID="txtEmail" TextMode="Email" CssClass="form-control required" />
                                                 <asp:RegularExpressionValidator ID="remail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter Valid Email Id" ForeColor="Red"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                            </div>
                                             <div class="form-group">
                                                <label>Phone *</label>
                                                <asp:TextBox runat="server" ID="txtPhone" TextMode="Number" CssClass="form-control required" />
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtPhone" ErrorMessage="Enter Valid Phone Number" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                            </div>
                                             <div class="form-group">
                                                <label>Post Office *</label>
                                                <asp:TextBox runat="server" ID="txtPostOffice" TextMode="SingleLine" CssClass="form-control required" />
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtPostOffice" ErrorMessage="Enter Working Post Office" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                             <div class="form-group">
                                                <label>District*</label>
                                                <asp:dropdownlist runat="server" ID="ddlDist" CssClass="form-control required" >
                                                    <asp:ListItem>Thiruvananthapuram</asp:ListItem>
                                                    <asp:ListItem>Kollam</asp:ListItem>
                                                    <asp:ListItem>Alappuzha</asp:ListItem>
                                                    <asp:ListItem>Pathanamthitta</asp:ListItem>
                                                    <asp:ListItem>Idukki</asp:ListItem>
                                                    <asp:ListItem>Kottayam</asp:ListItem>
                                                    <asp:ListItem>Eranakulam</asp:ListItem>
                                                    <asp:ListItem>Trissur</asp:ListItem>
                                                    <asp:ListItem>Palakkad</asp:ListItem>
                                                    <asp:ListItem>Malappuram</asp:ListItem>
                                                    <asp:ListItem>Kozhikode</asp:ListItem>
                                                    <asp:ListItem>Wayanad</asp:ListItem>
                                                    <asp:ListItem>Kannur</asp:ListItem>
                                                    <asp:ListItem>Kasargod</asp:ListItem>
                                                 </asp:DropDownList>
                                            </div>
                                             <div class="form-group">
                                                <label>Block *</label>
                                                <asp:TextBox runat="server" ID="txtBlock" TextMode="SingleLine" CssClass="form-control required" />
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtBlock" ErrorMessage="Enter Block" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                            <div><br /></div>
                                            <h2>Educational Qualifications</h2>
                                             <div class="form-group">
                                                <label>Highest Qualification: *</label>
                                                <asp:dropdownlist runat="server" ID="ddlEQ" CssClass="form-control required" >
                                                    <asp:ListItem>SSLC</asp:ListItem>
                                                    <asp:ListItem>Plus Two</asp:ListItem>
                                                    <asp:ListItem>Graduation</asp:ListItem>
                                                    <asp:ListItem>Post Graduation</asp:ListItem>
                                                 </asp:DropDownList>
                                            </div>
                                            <div><br /><br /></div>
                                             <div>
                                               
                                                <asp:button runat="server" ID="btnSubmit" text="Submit" CssClass="btn btn-primary float-left m-t-n-xs" OnClick="btnSubmit_Click" />
                                            </div>
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
<script>
    $(document).ready(function () {
        $("#wizard").steps();
        $("#form").steps({
            bodyTag: "fieldset",
            onStepChanging: function (event, currentIndex, newIndex) {
                // Always allow going backward even if the current step contains invalid fields!
                if (currentIndex > newIndex) {
                    return true;
                }

                // Forbid suppressing "Warning" step if the user is to young
                if (newIndex === 3 && Number($("#age").val()) < 18) {
                    return false;
                }

                var form = $(this);

                // Clean up if user went backward before
                if (currentIndex < newIndex) {
                    // To remove error styles
                    $(".body:eq(" + newIndex + ") label.error", form).remove();
                    $(".body:eq(" + newIndex + ") .error", form).removeClass("error");
                }

                // Disable validation on fields that are disabled or hidden.
                form.validate().settings.ignore = ":disabled,:hidden";

                // Start validation; Prevent going forward if false
                return form.valid();
            },
            onStepChanged: function (event, currentIndex, priorIndex) {
                // Suppress (skip) "Warning" step if the user is old enough.
                if (currentIndex === 2 && Number($("#age").val()) >= 18) {
                    $(this).steps("next");
                }

                // Suppress (skip) "Warning" step if the user is old enough and wants to the previous step.
                if (currentIndex === 2 && priorIndex === 3) {
                    $(this).steps("previous");
                }
            },
            onFinishing: function (event, currentIndex) {
                var form = $(this);

                // Disable validation on fields that are disabled.
                // At this point it's recommended to do an overall check (mean ignoring only disabled fields)
                form.validate().settings.ignore = ":disabled";

                // Start validation; Prevent form submission if false
                return form.valid();
            },
            onFinished: function (event, currentIndex) {
                var form = $(this);

                // Submit form input
                form.submit();
            }
        }).validate({
            errorPlacement: function (error, element) {
                element.before(error);
            },
            rules: {
                confirm: {
                    equalTo: "#password"
                }
            }
        });
    });
</script>
</html>
