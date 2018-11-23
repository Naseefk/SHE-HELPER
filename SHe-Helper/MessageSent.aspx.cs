using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SHe_Helper
{
    public partial class MessageSent : System.Web.UI.Page
    {
        DBCON a = new DBCON();
        protected void Page_Init(object sender, EventArgs e)
        {

            if (Session["Admin"] == null && Session["Agent"] == null && Session["Depositor"] == null)
            {
                Session["Error"] = "unauthorised";
                Response.Redirect("home.aspx");

            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Message"].ToString() == "Agent")
                {
                    a.ExcecuteQuery("select * from MessageTable where [From]='" + Session["AgentName"] + "[" + Session["Agent"] + "]" + "'");
                    rptData.DataSource = a.DT;
                    rptData.DataBind();
                }
                else if (Session["Message"].ToString() == "Admin")
                {
                    a.ExcecuteQuery("select * from MessageTable where [From]='Admin'");
                    rptData.DataSource = a.DT;
                    rptData.DataBind();
                }
                else if (Session["Message"].ToString() == "Depositor")
                {
                    a.ExcecuteQuery("select * from MessageTable where [From]='" + Session["DepositorName"] + "[" + Session["Depositor"] + "]" + "'");
                    rptData.DataSource = a.DT;
                    rptData.DataBind();
                }
            }
        }
        
    }
}