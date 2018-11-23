using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SHe_Helper
{
    public partial class AgentCollectionAdvance : System.Web.UI.Page
    {
        DBCON a = new DBCON();
        DBCON b = new DBCON();
        DBCON c = new DBCON();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            string total;
            if(txtAdvance.Text== "")
            {
                txtAdvance.Text = "0";
            }
            if(txtDefualtFine.Text == "")
            {
                txtDefualtFine.Text = "0";
            }
            if (txtLoanRepayment.Text == "")
            {
                txtLoanRepayment.Text = "0";
            }
            total = Convert.ToString(Convert.ToDouble(txtAdvance.Text) - Convert.ToDouble(txtDefualtFine.Text));

            
            c.ExcecuteQuery("select D_loanreturn,D_loanamt from DepositorLtable where D_accno='" + Request.QueryString["id"] + "'");
            a.ExcecuteNonQuery("update DepositorAtable set D_wallet='" + total + "' where D_accno='" + Request.QueryString["id"] + "'");
            string loanreturn = Convert.ToString(Convert.ToInt32(txtLoanRepayment.Text) + Convert.ToInt32(c.DT.Rows[0][0].ToString()));
            string loanbal = Convert.ToString(Convert.ToInt32(c.DT.Rows[0][1].ToString()) - Convert.ToInt32(loanreturn));
            if (txtLoanRepayment.Text != "")
            {
                b.ExcecuteNonQuery("update DepositorLtable set D_loanreturn='" + loanreturn + "',D_loanlastpay='" + txtLoanRepayment.Text + "',D_loanpaydate='" + DateTime.Now.Date.ToString("yyyy-MM-dd") + "',D_loanbal='" + loanbal + "' where D_accno='" + Request.QueryString["id"] + "'");
            }
        }
    }
}