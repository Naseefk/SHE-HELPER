using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Linq.SqlClient;

namespace SHe_Helper
{
    public partial class Calculator : System.Web.UI.Page
    {
        double rate, x, res, tax, itax;
        string amt, month;
        int t, i, amount, balance;
        bool isMonths;
        DBCON a = new DBCON();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (rbtnMonth.Checked == true)
            {
                isMonths = true;
                txtFromdate.Enabled = false;
                txtTodate.Enabled = false;
                txtMonth.Enabled = true;
            }
            a.ExcecuteQuery("select interest,interestax from AdminTable");
            if (a.DT.Rows.Count != 0)
            {
                rate = Convert.ToDouble(a.DT.Rows[0][0].ToString());
                itax = Convert.ToDouble(a.DT.Rows[0][1].ToString());
            }
        }

        protected void rbtnYear_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void rbtnDate_CheckedChanged(object sender, EventArgs e)
        {
            isMonths = false;
            txtMonth.Enabled = false;
            txtFromdate.Enabled = true;
            txtTodate.Enabled = true;
        }

        protected void btnCalculate_Click(object sender, EventArgs e)
        {
            if (isMonths == false)
            {
                month = (SqlMethods.DateDiffMonth(DateTime.Parse(txtFromdate.Text).Date, DateTime.Parse(txtTodate.Text).Date)).ToString();
            }else
            {
                month = txtMonth.Text;
            }
            x = 0;
            res = 0;
            tax = 0;
            amt = txtMonthlyPmt.Text;
            if (amt == "")
                amt = "0";
            
            amount = Convert.ToInt32(amt) * 3;
            x = amount * rate;
            t = Convert.ToInt32(month) / 3;
            balance = Convert.ToInt32(month) % 3;
            for (i = 0; i < t; i++)
            {

                res += x;

                if ((i + 1) % 4 == 0)
                {
                    x = x + (res - 4 * x);
                }
            }
            if (balance > 0)
            {
                res = res + balance * Convert.ToUInt32(amt);
            }
            tax = (res - (Convert.ToInt32(month) * Convert.ToInt32(amt))) * itax;
            txtTotalAmount.Text = Convert.ToString(res - tax);
        }
    }
}