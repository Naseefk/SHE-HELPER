using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SHe_Helper
{
    public partial class SalaryReg : System.Web.UI.Page
    {
        DBCON a = new DBCON();
        DBCON b = new DBCON();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnSave.Visible = false;
                btnCancel.Visible = false;
                a.ExcecuteQuery("select * from AdminTable");
                txtAllowance.Text = a.DT.Rows[0][0].ToString();
                txtTax.Text = a.DT.Rows[0][1].ToString();
                txtCommission.Text = a.DT.Rows[0][2].ToString();
                txtLimitOftotalamt.Text = a.DT.Rows[0][3].ToString();
                txtInterest.Text = a.DT.Rows[0][4].ToString();
                txtInterestax.Text = a.DT.Rows[0][5].ToString();
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            b.ExcecuteNonQuery("update AdminTable set allowance='" + txtAllowance.Text + "', tax='" + txtTax.Text + "', commission='" + txtCommission.Text + "', totalamt='" + txtLimitOftotalamt.Text + "', interest='" + txtInterest.Text + "', interestax='" + txtInterestax.Text + "' ");
            Response.Redirect("SalaryReg.aspx");
        }
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            btnSave.Visible = true;
            btnCancel.Visible = true;
            btnEdit.Visible = false;
            txtAllowance.Enabled = true;
            txtCommission.Enabled = true;
            txtTax.Enabled = true;
            txtInterest.Enabled = true;
            txtLimitOftotalamt.Enabled = true;
            txtInterestax.Enabled = true;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("SalaryReg.aspx");
        }
    }
}