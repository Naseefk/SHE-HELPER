using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SHe_Helper
{
    public partial class agentsignup : System.Web.UI.Page
    {
        Agent a = new Agent();
        bool status = false;
        private bool validateForm()
        {
            bool Uflag, Pflag, CPflag;
            bool flag = false;
            bool avail = a.checkUsername(txtuserName.Text);
           
            if (rbtnMarried.Checked)
            {
                status = true;
            }else
            {
                status = false;
            }

            if (avail)
            {
                lblAvalabilty.Text = "This username is available";
                Uflag = true;
            }
            else
            {
                lblAvalabilty.Text = "This username is taken. Please type another username";
                Uflag = false;
            }

            if (txtpassword.Text.Length < 6)
            {
                lblPassword.Text = "Password length must be minimum 6 characters.";
                Pflag = false;
                
            }
            else
            {
                lblPassword.Text = "";
                Pflag = true;
            }
            if (txtcpassword.Text != txtpassword.Text)
            {
                lblcpassword.Text = "Passwords do not match";
                CPflag = false;
                

            }
            else
            {
                lblcpassword.Text = "";
                CPflag = true;
            }

            if (Uflag && Pflag && CPflag)
            {
                flag = true;
            }
            else
            {
                flag = false;
            }
            return flag;
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            bool check = validateForm();
            if (check)
            {
                a.addAgent(txtuserName.Text, txtpassword.Text, txtName.Text, txtHouseName.Text, txtPlace.Text, txtPost.Text, txtPin.Text, txtDOB.Text,status, txtEmail.Text, txtPhone.Text, txtPost.Text, ddlDist.SelectedItem.Text.ToString(), txtBlock.Text, ddlEQ.SelectedItem.Text.ToString());
                Response.Redirect("home.aspx");

            }else
            {

            }
        }
    }
}