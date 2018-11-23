using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SHe_Helper
{
    public partial class AgentCollection : System.Web.UI.Page
    {
        DBCON a = new DBCON();
        DBCON b = new DBCON();
        DBCON c = new DBCON();
        DBCON d = new DBCON();
        DBCON f = new DBCON();
        DBCON g = new DBCON();
        DBCON h = new DBCON();
        int count;
        int duepay;
        string denomination;
        string accno;
        DateTime date = DateTime.Now.Date;
        protected void Page_Init(object sender, EventArgs e)
        {

            if (Session["Agent"] == null)
            {
                Session["Error"] = "unauthorised";
                Response.Redirect("home.aspx");

            }
        }
        public void refresh()
        {
            a.ExcecuteQuery("select * from DepositorAtable d1 INNER JOIN DepositorPtable d2 ON d2.CIF=d1.CIF where d1.D_agentid='" + Session["Agent"] + "' and d1.D_collected='false' and D_wallet<=0");

            rptData.DataSource = a.DT;
            rptData.DataBind();

            b.ExcecuteQuery("select * from DepositorAtable d1 INNER JOIN DepositorPtable d2 ON d2.CIF=d1.CIF where d1.D_agentid='" + Session["Agent"] + "' and d1.D_collected='True' D_wallet<=0");
            rptData2.DataSource = b.DT;
            rptData2.DataBind();
            c.ExcecuteQuery("select count(D_accno) from DepositorAtable where D_agentid='" + Session["Agent"] + "' and D_collected='True'");
            lblTotalAcc.Text = c.DT.Rows[0][0].ToString();
            d.ExcecuteQuery("select sum(0+t1.D_denomination+t1.D_wallet+t2.D_loanlastpay) from DepositorAtable t1 inner join DepositorLtable t2 on t1.D_accno=t2.D_accno where t1.D_agentid='" + Session["Agent"] + "' and t1.D_collected='True'");
            lblTotalAmt.Text = d.DT.Rows[0][0].ToString();
            if (lblTotalAmt.Text == "")
            {
                lblTotalAmt.Text = "0";
            }

            g.ExcecuteQuery("Select D_duedate,D_lpdate,D_denomination,D_accno from DepositorAtable where D_agentid='" + Session["Agent"] + "' and D_collected='false'");
            count = g.DT.Rows.Count;
            for(int i = 0; i < count; i++)
            {
                int temp = Convert.ToInt32(Convert.ToDateTime(g.DT.Rows[i][0]).Month) - Convert.ToInt32(Convert.ToDateTime(g.DT.Rows[i][1]).Month);
                if (temp>=2)
                {
                    denomination = g.DT.Rows[i][2].ToString();
                    duepay = temp * Convert.ToInt32(denomination);
                    accno = g.DT.Rows[i][3].ToString();
                    h.ExcecuteNonQuery("update DepositorAtable set D_duepay='" + duepay + "' where D_accno='" + accno + "'");
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
                     
            if (!IsPostBack)
            {
                    refresh();
            }
        }

       protected void btnSave_Click(Object sender, EventArgs e)
        {
            foreach (RepeaterItem i in rptData.Items)
            {
                CheckBox cb = (CheckBox)i.FindControl("CheckBox1");
                if (cb.Checked)
                {
                    HiddenField hidden = (HiddenField)i.FindControl("hidden");
                    f.ExcecuteNonQuery("update DepositorAtable set D_collected='true',D_paid='false',D_collectDate='" + date.Date.ToString("yyyy-MM-dd") + "' where D_accno='" + hidden.Value + "'");
                    
                }
            }
            refresh();
            

        }
        protected void logout(object sender, EventArgs e)
        {
            Session["Agent"] = null;
            Session["AgentName"] = null;
            Response.Redirect("home.aspx");
        }


    }
}