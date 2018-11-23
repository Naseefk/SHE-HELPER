using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SHe_Helper
{
    public partial class Loan : System.Web.UI.Page
    {
        DBCON a = new DBCON();
        DBCON b = new DBCON();
        DBCON c = new DBCON();
        string accno;
        DateTime loandate=DateTime.Now;
        string loanAmount;
        Loans obj = new Loans();
        protected void Page_Init(object sender, EventArgs e)
        {

            if (Session["Agent"] == null)
            {
                Session["Error"] = "unauthorised";
                Response.Redirect("home.aspx");

            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnRequest_Click(object sender, EventArgs e)
        {
            accno = txtAccountNo.Text;
            obj.retrieve(accno);
            if (obj.isEligible())
            {
                b.ExcecuteNonQuery("update DepositorLtable set  D_loanamt='" + txtLoanAmount.Text + "', D_loandate='" + txtLoanDate.Text + "', D_status='false' where CIF='" + txtCif.Text + "' and D_accno='" + txtAccountNo.Text + "'");
                Response.Redirect("Agent.aspx");
            }
            else
            {
                Panel1.Enabled = false;
                lblEligible.Visible = true;
                btnRequest.Visible = false;
                btnOk.Visible = true;
            }
        }

        protected void txtAccountNo_TextChanged(object sender, EventArgs e)
        {
            a.ExcecuteQuery("select * from DepositorPtable t1 inner join depositorAtable t2 on t1.CIF=t2.CIF where t2.D_accno='" + txtAccountNo.Text + "' and t2.D_closedate is null");
            if (a.DT.Rows.Count != 0)
            {
                if (a.DT.Rows[0]["D_lpdate"].ToString().Length != 0)
                {
                    txtLastTransaction.Text = Convert.ToDateTime(a.DT.Rows[0]["D_lpdate"].ToString()).Date.ToString("yyyy-MM-dd");
                }
                txtLoanDate.Text = loandate.Date.ToString("yyyy-MM-dd");
                txtCif.Text = a.DT.Rows[0]["CIF"].ToString();
                txtDenomination.Text = a.DT.Rows[0]["D_denomination"].ToString();
                txtName.Text = a.DT.Rows[0]["D_name"].ToString();
                txtOpenDate.Text = Convert.ToDateTime(a.DT.Rows[0]["D_doj"].ToString()).Date.ToString("yyyy-MM-dd");
                txtBalance.Text = a.DT.Rows[0]["D_totamount"].ToString();
            }
            else
            {
                c.ExcecuteQuery("select * from DepositorPtable t1 inner join depositorAtable t2 on t1.CIF=t2.CIF where t2.D_accno='" + txtAccountNo.Text + "' and t2.D_closedate is not null");
                if (c.DT.Rows.Count != 0)
                {
                    Panel1.Enabled = false;
                    lblEligible.Text = "Account is closed";
                    btnRequest.Visible = false;
                    btnOk.Visible = true;
                    lblEligible.Visible = true;
                }
                else
                {
                    Panel1.Enabled = false;
                    lblEligible.Text = "Enter Correct Account Number";
                    btnRequest.Visible = false;
                    btnOk.Visible = true;
                    lblEligible.Visible = true;
                }
                    
            }
        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            Panel1.Enabled = true;
            btnRequest.Visible = true;
            btnOk.Visible = false;
            lblEligible.Visible = false;
            txtAccountNo.Text = "";
            txtCif.Text = "";
            txtDenomination.Text = "";
            txtName.Text = "";
            txtOpenDate.Text = "";
            txtLastTransaction.Text = "";
            txtBalance.Text = "";
            txtLoanAmount.Text = "";
        }
        protected void logout(object sender, EventArgs e)
        {
            Session["Agent"] = null;
            Session["AgentName"] = null;
            Response.Redirect("home.aspx");
        }
    }
}