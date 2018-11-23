using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SHe_Helper
{
    public partial class AddDepositor : System.Web.UI.Page
    {
        Depositor depositor = new Depositor();
        DBCON a = new DBCON();
        Boolean isExisting = false;
        string agentid;
        string CIF;
        public void checkState()
        {
            if (rbtnNew.Checked == true)
            {
                lblCif.Visible = false;
                txtCif.Visible = false;
            }
            else if(rbtnExisting.Checked==true)
            {
                lblCif.Visible = true;
                txtCif.Visible = true;
                txtName.Enabled = false;
                txtHouseName.Enabled = false;
                txtDOB.Enabled = false;
                txtAadhar.Enabled = false;
                txtPan.Enabled = false;
                txtPlace.Enabled = false;
                txtPin.Enabled = false;
                txtPost.Enabled = false;
                txtPhone.Enabled = false;
                isExisting = true;
            }
        }
        public void clear()
        {
            txtCif.Text = "";
            txtName.Text = "";
            txtHouseName.Text = "";
            txtPlace.Text = "";
            txtPin.Text = "";
            txtPost.Text = "";
            txtPan.Text = "";
            txtDOB.Text = "";
            txtDenomination.Text = "";
            txtAadhar.Text = "";
            txtNominee.Text = "";
            txtRelation.Text = "";
            txtPhone.Text = "";
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            agentid = Session["Agent"].ToString();
            if (!IsPostBack)
            {
                
                if (Request.QueryString["flag"] == "true")
                {
                    checkState();
                    btnSave.Visible = false;
                }
                else if( Request.QueryString["flag"] == "false")
                {
                    rbtnNew.Checked = false;
                    checkState();
                    lblHeading.Text = "Edit Account";
                    rbtnNew.Visible = false;
                    rbtnExisting.Visible = false;
                    btnRegister.Visible = false;
                    txtNominee.Visible = false;
                    txtDenomination.Visible = false;
                    txtRelation.Visible = false;
                    lblNominee.Visible = false;
                    lblDenomination.Visible = false;
                    lblRelation.Visible = false;

                    txtName.Enabled = false;
                    txtDOB.Enabled = false;
                    txtHouseName.Enabled = true;
                    txtPlace.Enabled = true;
                    txtPost.Enabled = true;
                    txtPin.Enabled = true;
                    txtAadhar.Enabled = false;
                    
                    txtPhone.Enabled = true;
                    txtPan.Enabled = true;

                    
                    
                }
                else
                {
                    rbtnNew.Checked = true;
                    checkState();
                }

            }
        }

        protected void rbtnNew_CheckedChanged(object sender, EventArgs e)
        {
            checkState();
        }

        protected void rbtnExisting_CheckedChanged(object sender, EventArgs e)
        {
            checkState();
        }
        protected void txtCif_TextChanged(object sender, EventArgs e)
        {
            CIF = txtCif.Text;
            depositor.LoadDepositor(CIF);
            txtName.Text = depositor.name;
            txtHouseName.Text = depositor.housename;
            txtPlace.Text = depositor.place;
            txtPost.Text = depositor.post;
            txtPin.Text = depositor.pin;
            txtDOB.Text = Convert.ToDateTime(depositor.dob).ToString("yyyy-MM-dd");
            txtAadhar.Text = depositor.aadhar.Trim();
            txtPhone.Text = depositor.phone.Trim();
            txtPan.Text = depositor.pan;

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if(rbtnExisting.Checked==true)
            { 
                depositor.addAccount(agentid, txtDenomination.Text, txtNominee.Text, txtRelation.Text, txtCif.Text);
            }
            else
            {
                depositor.storeDepositor( txtName.Text, txtHouseName.Text, txtPlace.Text, txtPost.Text, txtPin.Text, txtDOB.Text, txtAadhar.Text, txtPan.Text, txtPhone.Text, Convert.ToDouble(txtDenomination.Text), txtNominee.Text, txtRelation.Text);
                depositor.newDepositor(agentid);
            }
            clear();
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            a.ExcecuteNonQuery("update DepositorPtable set D_housename='" + txtHouseName.Text + "',D_place='" + txtPlace.Text + "', D_post='" + txtPost.Text + "', D_pin='" + txtPin.Text + "', D_phone='" + txtPhone.Text + "', D_pan='" + txtPan.Text + "' where CIF='" + txtCif.Text + "'");
            clear();
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            clear();
        }
    }
}