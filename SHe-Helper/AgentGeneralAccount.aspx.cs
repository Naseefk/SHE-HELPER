using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SHe_Helper
{
    public partial class AgentGeneralAccount : System.Web.UI.Page
    {
        DBCON a = new DBCON();
        Agent agent = new Agent();
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session["Agent"] == null)
            {
                Session["Error"] = "unauthorised";
                Response.Redirect("home.aspx");
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["agent_id"] = agent.id;
            if (!IsPostBack)
            {
                a.ExcecuteQuery("select * from DepositorAtable d1 INNER JOIN DepositorPtable d2 ON d2.CIF = d1.CIF where d1.D_agentid = '" + Session["Agent"] + "' and d2.D_status='true' ");

                rptData.DataSource = a.DT;
                rptData.DataBind();

            }
        }
        protected void logout(object sender, EventArgs e)
        {
            Session["Agent"] = null;
            Session["AgentName"] = null;
            Response.Redirect("home.aspx");
        }

    }
}