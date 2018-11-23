using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SHe_Helper
{
    public partial class settings : System.Web.UI.Page
    {

        salary obj = new salary();
        double allowance;
        double commission;
        double interest;
        double limit;
        double tax;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                obj.retrieve();
            }


        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            txtAllowance.Enabled = true;
            txtCommission.Enabled = true;
            txtInterest.Enabled = true;
            txtLimitofTtlAmt.Enabled = true;
            txtTax.Enabled = true;
            btnSave.Visible = true;
            btnEdit.Visible = false;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("settings.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            obj.update(Convert.ToDouble(txtAllowance.Text),
                        Convert.ToDouble(txtCommission.Text),
                        Convert.ToDouble(txtInterest.Text),
                        Convert.ToDouble(txtLimitofTtlAmt.Text),
                        Convert.ToDouble(txtTax.Text));
        }
    }
}
