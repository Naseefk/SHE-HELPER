using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SHe_Helper
{
    public partial class AgentSchedule : System.Web.UI.Page
    {
        DBCON a = new DBCON();
        DBCON b = new DBCON();

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
            
            if (!IsPostBack)
            {
                a.ExcecuteQuery("Select max(schedule_no) from ScheduleTable where agent_id='" + Session["Agent"] + "'");
                txtScheduleNo.Text = a.DT.Rows[0][0].ToString().Trim();
                a.DT.Clear();
                a.ExcecuteQuery("select * from DepositorAtable where D_agentid = '" + Session["Agent"] + "' and D_scheduleno='" + txtScheduleNo.Text + "' and D_duedate >'" + DateTime.Now.Date.ToString("yyyy-MM-dd") + "'");

                rptData.DataSource = a.DT;
                rptData.DataBind();

            }
        }

        protected void btnScheduleNo_Click(object sender, EventArgs e)
        {
            a.DT.Clear();
            a.ExcecuteQuery("select * from DepositorAtable t1 inner join DepositorPtable t2 on t1.CIF=t2.CIF where t1.D_agentid = '" + Session["Agent"] + "' and t1.D_scheduleno='" + txtScheduleNo.Text + "' and t1.D_duedate>'" + DateTime.Now.Date.ToString("yyyy-MM-dd") + "'");

            rptData.DataSource = a.DT;
            rptData.DataBind();

            
            b.ExcecuteQuery("select depositors,total from ScheduleTable where agent_id='" + Session["Agent"] + "' and schedule_no='" + txtScheduleNo.Text + "'");
            if (b.DT.Rows.Count != 0)
                lblTotalAcc.Text = b.DT.Rows[0][0].ToString();
            else
                lblTotalAcc.Text = "nil";
            if (b.DT.Rows.Count != 0)
                lblTotalAmt.Text = b.DT.Rows[0][1].ToString();
            else
                lblTotalAmt.Text = "nil";

        }
        protected void logout(object sender, EventArgs e)
        {
            Session["Agent"] = null;
            Session["AgentName"] = null;
            Response.Redirect("home.aspx");
        }
    }
}