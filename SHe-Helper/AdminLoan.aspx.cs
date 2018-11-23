using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SHe_Helper
{
    public partial class AdminLoan : System.Web.UI.Page
    {
        DBCON a = new DBCON();
        DBCON b = new DBCON();
        public string count;
        protected void Page_Init(object sender, EventArgs e)
        {

            if (Session["Admin"] == null)
            {
                Session["Error"] = "unauthorised";
                Response.Redirect("home.aspx");

            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Admin"] != null)
                {
                    a.ExcecuteQuery(" select * from DepositorAtable d1 INNER JOIN DepositorPtable d2 ON d2.CIF=d1.CIF INNER JOIN DepositorLtable d3 ON d3.D_accno=d1.D_accno where d3.D_loaneligible='false' and d3.D_status='false'");
                    rptData.DataSource = a.DT;
                    rptData.DataBind();
                    b.ExcecuteQuery("select COUNT(*) from MessageTable where flag='false' and [to]='" + Session["Message"] + "' ");
                    count = b.DT.Rows[0][0].ToString();
                }
            }
            
        }
        protected void logout(object sender, EventArgs e)
        {

            Session["Admin"] = null;
            Response.Redirect("home.aspx");
        }
    }
}