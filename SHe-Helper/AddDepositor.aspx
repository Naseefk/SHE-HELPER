<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddDepositor.aspx.cs" Inherits="SHe_Helper.AddDepositor" %>


<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Add Depositor</title>

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
</head>

<body class="">



    <div id="page-wrapper" class="gray-bg">
       
        <div class="wrapper wrapper-content">
          
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ibox">
                            <div class="ibox-title">
                                
                                <asp:Label ID="lblHeading" runat="server" Font-Bold="True" Font-Size="Medium" Text="Registration Form"></asp:Label>
                            </div>
                            <div class="ibox-content">
                                
                              
                                <form id="form1" runat="server">
                                    
                                    <div><br /></div>
                                    <div class="row">
                                        <div class="col-lg-8">
                                            <div> 
                                                <asp:RadioButton ID="rbtnNew" Text="New" runat="server" GroupName="radioStatus"  checked="true" AutoPostBack="True" OnCheckedChanged="rbtnNew_CheckedChanged"/>
                                                <asp:RadioButton ID="rbtnExisting" Text="Existing" runat="server" style="margin-left: 108px !important;" GroupName="radioStatus" AutoPostBack="True" OnCheckedChanged="rbtnExisting_CheckedChanged" />
                                            </div>
                                                
                                            <div class="form-group">
                                                <asp:label runat="server" ID="lblCif" visibility="false" >CIF</asp:label>
                                                <asp:TextBox runat="server" ID="txtCif" TextMode="SingleLine" AutoPostBack="true" CssClass="form-control required" OnTextChanged="txtCif_TextChanged" />
                                            </div>
                                             <div class="form-group">
                                                <asp:label runat="server" ID="lblName" >Name</asp:label>
                                                <asp:TextBox runat="server" ID="txtName" TextMode="SingleLine" CssClass="form-control required" />
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="Enter Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                             <div class="form-group">
                                                <label>House name</label>
                                                <asp:TextBox runat="server" ID="txtHouseName" TextMode="SingleLine" CssClass="form-control required" />
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtHouseName" ErrorMessage="Enter House Name" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="form-group">
                                                <label>Place</label>
                                                <asp:TextBox runat="server" ID="txtPlace" TextMode="SingleLine" CssClass="form-control required" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPlace" ErrorMessage="Enter Place" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="form-group">
                                                <label>Post</label>
                                                <asp:TextBox runat="server" ID="txtPost" TextMode="SingleLine" CssClass="form-control required" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPost" ErrorMessage="Enter Post" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="form-group">
                                                <label>Pin</label>
                                                <asp:TextBox runat="server" ID="txtPin" TextMode="SingleLine" CssClass="form-control required" />
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPin" ErrorMessage="Enter Valid PIN Code" ForeColor="Red" ValidationExpression="[0-9]{6}"></asp:RegularExpressionValidator>
                                            </div>
                                             <div class="form-group">
                                                <label>Date of Birth</label>
                                                <asp:TextBox runat="server" ID="txtDOB" TextMode="Date" CssClass="form-control required" />
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDOB" ErrorMessage="Enter Date of Birth" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="form-group">
                                                <label>Aadhar</label>
                                                <asp:TextBox runat="server" ID="txtAadhar" TextMode="SingleLine" CssClass="form-control required" />
                                                <label>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtAadhar" ErrorMessage="Enter Valid Aadhar" ForeColor="Red" ValidationExpression="[0-9]{12}"></asp:RegularExpressionValidator>
                                                </label>
                                            </div>
                                            
                                             <div class="form-group">
                                                 <asp:Label ID="lblNominee" runat="server" Text="Nominee"></asp:Label>
                                             </div>
                                            <div class="form-group">
                                                 <asp:TextBox runat="server" ID="txtNominee" TextMode="SingleLine" CssClass="form-control form-control-sm width required" />
                                                 <br />
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtNominee" ErrorMessage="Enter Name of Nominee" ForeColor="Red"></asp:RequiredFieldValidator>
                                                 <br />
                                                 <asp:Label ID="lblRelation" runat="server" Text="Relation"></asp:Label>
                                                 <br />
                                                 <asp:TextBox runat="server" ID="txtRelation" TextMode="SingleLine" CssClass="form-control form-control-sm width required" />
                                                 <br />
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtRelation" ErrorMessage="Enter Relation " ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                            
                                            <div class="form-group">
                                                <asp:Label ID="lblDenomination" runat="server" Text="Denomination"></asp:Label>
                                                <asp:TextBox runat="server" ID="txtDenomination" TextMode="SingleLine" CssClass="form-control required" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtDenomination" ErrorMessage="Enter Denomination" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                             <div class="form-group">
                                                <label>Phone</label>
                                                <asp:TextBox runat="server" ID="txtPhone" TextMode="SingleLine" CssClass="form-control required" required=""/>
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtPhone" ErrorMessage="Enter phone number" ForeColor="Red"></asp:RequiredFieldValidator>
                                                <label>
                                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPhone" ErrorMessage="Enter Valid Phone Number" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                                 </label>
                                            </div>
                                            <div class="form-group">
                                                <label>Pan</label>
                                                <asp:TextBox runat="server" ID="txtPan" TextMode="SingleLine" CssClass="form-control required"/>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtPan" ErrorMessage="Enter Pan" ForeColor="Red"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPan" ErrorMessage="Enter Valid PAN Number" ForeColor="Red" ValidationExpression="[A-Z]{5}\d{4}[A-Z]{1}"></asp:RegularExpressionValidator>
                                            </div>
                                             
                                             
                                             
                                            <div><br /><br /></div>
                                             <div>
                                               
                                                 <asp:button runat="server" ID="btnRegister" text="Register" CssClass="btn btn-primary float-left m-t-n-xs" style="margin-left: 80px !important;" OnClick="btnRegister_Click"/>
                                                 <asp:button runat="server" ID="btnSave" text="Save" CssClass="btn btn-primary float-left m-t-n-xs"  Style="margin-left: 110px !important;" OnClick="btnSave_Click"/>
                                                 <asp:button runat="server" ID="btnCancel" text="Cancel" CssClass="btn btn-primary float-left m-t-n-xs"  Style="margin-left: 110px !important;" OnClick="btnCancel_Click"/>
                                                

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
