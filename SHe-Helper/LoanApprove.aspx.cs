using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SHe_Helper
{
    public partial class LoanApprove : System.Web.UI.Page
    {
        DBCON a = new DBCON();
        DBCON b = new DBCON();
        public DateTime now = DateTime.Now;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    a.ExcecuteQuery("select d1.D_accno,D_name, D_loandate, D_loanamt, d1.CIF, D_denomination, D_totamount, D_doj,D_lpdate from DepositorAtable d1 INNER JOIN DepositorPtable d2 ON d2.CIF = d1.CIF INNER JOIN DepositorLtable d3 ON d3.D_accno = d1.D_accno where d1.D_accno = '" + Request.QueryString["id"] + "'");
                    if (a.DT.Rows[0][8].ToString().Length != 0)
                    {
                        txtLastTransaction.Text = Convert.ToDateTime(a.DT.Rows[0][8].ToString()).Date.ToString("yyyy-MM-dd");
                    }
                    txtAccountNo.Text = a.DT.Rows[0][0].ToString();
                    txtName.Text= a.DT.Rows[0][1].ToString();
                    txtLoanDate.Text= Convert.ToDateTime(a.DT.Rows[0][2].ToString()).Date.ToString("yyyy-MM-dd");
                    txtLoanAmount.Text = a.DT.Rows[0][3].ToString();
                    txtCif.Text= a.DT.Rows[0][4].ToString();
                    txtDenomination.Text= a.DT.Rows[0][5].ToString();
                    txtBalance.Text= a.DT.Rows[0][6].ToString();
                    txtOpenDate.Text= Convert.ToDateTime(a.DT.Rows[0][7].ToString()).Date.ToString("yyyy-MM-dd");
                    
                }
            }
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            b.ExcecuteNonQuery("update DepositorLtable set D_loaneligible='true',D_loandate='" + now.ToString("yyyy-MM-dd") + "',D_loanbal='" + txtLoanAmount.Text + "' where D_accno='" + Request.QueryString["id"] + "'");
            btnApprove.Visible = false;
            btnReject.Visible = false;
        }
        protected void btnReject_Click(object sender, EventArgs e)
        {
            b.ExcecuteNonQuery("update DepositorLtable set D_status='true', D_loaneligible='false' where D_accno='" + Request.QueryString["id"] + "'");
            btnApprove.Visible = false;
            btnReject.Visible = false;
        }
    }
}