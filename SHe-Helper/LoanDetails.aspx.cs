using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SHe_Helper
{
    public partial class LoanDetails : System.Web.UI.Page
    {
        DBCON a = new DBCON();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(Request.QueryString["id"] != null){
                    a.ExcecuteQuery("select D_name,t1.CIF,D_accno,D_loandate,D_loanamt,D_loanlastpay,D_loanpaydate,D_loanreturn,D_loanbal from DepositorLtable t1 inner join DepositorPtable t2 on t1.CIF=t2.CIF where D_accno='" + Request.QueryString["id"] + "'");
                    if (a.DT.Rows[0][6].ToString().Length != 0)
                    {
                        txtLastPayDate.Text = Convert.ToDateTime(a.DT.Rows[0][6].ToString()).Date.ToString("dd-MM-yyyy");
                    }
                    
                    txtName.Text = a.DT.Rows[0][0].ToString();
                    txtCif.Text = a.DT.Rows[0][1].ToString();
                    txtAccountNo.Text= a.DT.Rows[0][2].ToString();
                    txtLoanDate.Text= Convert.ToDateTime(a.DT.Rows[0][3].ToString()).Date.ToString("dd-MM-yyyy");
                    txtLoanAmount.Text= a.DT.Rows[0][4].ToString();
                    txtLastPay.Text= a.DT.Rows[0][5].ToString();
                    txtLoanReturn.Text = a.DT.Rows[0][7].ToString();
                    txtLoanBalance.Text= a.DT.Rows[0][8].ToString();
                }
            }
        }
    }
}