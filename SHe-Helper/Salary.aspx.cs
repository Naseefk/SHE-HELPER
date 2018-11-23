using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SHe_Helper
{
    public partial class Salary : System.Web.UI.Page
    {
        Agent obj = new Agent();
        string agentid;
        protected void Page_Load(object sender, EventArgs e)
        {
            agentid = Session["Agent"].ToString();
            obj.calculateSalary(agentid);
            txttotalAmount.Text = obj.totalAmount.ToString();
            txtAllowance.Text = obj.effectiveAllowance.ToString();
            txtCommission.Text = obj.effectiveCommision.ToString();
        }
    }
}