using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SHe_Helper
{
    public partial class DepositorAccount : System.Web.UI.Page
    {
        DBCON a = new DBCON();
        DBCON b = new DBCON();
        protected void Page_Init(object sender, EventArgs e)
        {

            if (Session["Depositor"] == null)
            {
                Session["Error"] = "unauthorised";
                Response.Redirect("home.aspx");

            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                a.ExcecuteQuery("select * from DepositorATable where CIF='" + Session["Depositor"] + "'");
                rptData.DataSource = a.DT;
                rptData.DataBind();

                b.ExcecuteQuery("select * from DepositorLtable where CIF='" + Session["Depositor"] + "' and D_loaneligible='true'");
                rptData2.DataSource = b.DT;
                rptData2.DataBind();
            }
        }
        protected void logout(object sender, EventArgs e)
        {
            Session["Depositor"] = null;
            Session["DepositorName"] = null;
            Response.Redirect("home.aspx");
        }
    }
}