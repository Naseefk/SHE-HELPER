using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SHe_Helper
{
    public partial class AgentAccount : System.Web.UI.Page
    {
        DBCON t1 = new DBCON();
        DBCON t2 = new DBCON();
        DBCON t3 = new DBCON();
        DBCON t4 = new DBCON();
        DBCON t5 = new DBCON();
        DBCON t6 = new DBCON();
        DBCON a = new DBCON();
        DateTime now = DateTime.Now;
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
                t1.ExcecuteQuery("select * from DepositorAtable d1 INNER JOIN DepositorPtable d2 ON d2.CIF=d1.CIF where d1.D_agentid ='" + Session["Agent"] + "' and d1.D_wallet>0");
                rptData.DataSource = t1.DT;
                rptData.DataBind();

                t2.ExcecuteQuery("select * from DepositorATable d1 INNER JOIN DepositorPtable d2 ON d2.CIF=d1.CIF where d1.D_agentid ='" + Session["Agent"] + "' and d1.D_duedate <'" + DateTime.Now.Date.ToString("yyyy-MM-dd") + "'and d1.D_matdate >'" + DateTime.Now.Date.ToString("yyyy-MM-dd") + "' and d1.D_collected='False' ");
                rptData2.DataSource = t2.DT;
                rptData2.DataBind();

                t3.ExcecuteQuery("select * from DepositorATable d1  INNER JOIN DepositorPtable d2 ON d2.CIF=d1.CIF where d1.D_agentid ='" + Session["Agent"] + "' and month(d1.D_matdate) ='" + DateTime.Now.Month + "' and year(d1.D_matdate) ='" + DateTime.Now.Year + "'  and d1.D_closedate is null");
                rptData3.DataSource = t3.DT;
                rptData3.DataBind();

                t4.ExcecuteQuery("select * from DepositorATable d1 INNER JOIN DepositorPtable d2 ON d2.CIF=d1.CIF where d1.D_agentid ='" + Session["Agent"] + "' and d1.D_closedate <='" + DateTime.Now.Date.ToString("yyyy-MM-dd") + "'");
                rptData4.DataSource = t4.DT;
                rptData4.DataBind();

                t5.ExcecuteQuery("select * from DepositorATable d1 INNER JOIN DepositorPtable d2 ON d2.CIF=d1.CIF where d1.D_agentid ='" + Session["Agent"] + "' and d1.D_matdate <'" + DateTime.Now.Date.ToString("yyyy-MM-dd") + "' and d1.D_closedate is null ");
                rptData5.DataSource = t5.DT;
                rptData5.DataBind();

                t6.ExcecuteQuery("select * from DepositorATable d1 INNER JOIN DepositorPtable d2 ON d2.CIF=d1.CIF where d1.D_agentid ='" + Session["Agent"] + "' and d1.D_lpdate <'" + DateTime.Now.AddMonths(-6).ToString("yyyy-MM-dd") + "' and d1.D_closedate is null and d1.D_matdate > '" + DateTime.Now.Date.ToString("yyyy-MM-dd") + "'");
                rptData6.DataSource = t6.DT;
                rptData6.DataBind();
            }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
        }
        protected void rptData6_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Literal litDefault = new Literal();

                litDefault = e.Item.FindControl("litDefault") as Literal;

                string D_doj = DataBinder.Eval(e.Item.DataItem, "D_doj").ToString();
                string nop = DataBinder.Eval(e.Item.DataItem, "D_noOfpay").ToString();
                string noMonth= Convert.ToString((((Convert.ToInt32(now.Year)-Convert.ToInt32(Convert.ToDateTime(D_doj).Year))*12) + (Convert.ToInt32(now.Month)- Convert.ToDateTime(D_doj).Month)));
                string defaultNo = Convert.ToString(Convert.ToInt32(noMonth) - Convert.ToInt32(nop));
                litDefault.Text = defaultNo;
            }
        }
        protected void rptData2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Literal litDefault = new Literal();

                litDefault = e.Item.FindControl("litDefault") as Literal;

                string D_doj = DataBinder.Eval(e.Item.DataItem, "D_doj").ToString();
                string nop = DataBinder.Eval(e.Item.DataItem, "D_noOfpay").ToString();
                string noMonth = Convert.ToString((((Convert.ToInt32(now.Year) - Convert.ToInt32(Convert.ToDateTime(D_doj).Year)) * 12) + (Convert.ToInt32(now.Month) - Convert.ToDateTime(D_doj).Month)));
                string defaultNo = Convert.ToString(Convert.ToInt32(noMonth) - Convert.ToInt32(nop));
                litDefault.Text = defaultNo;
            }
        }
        protected void btnClose_Click(object sender, EventArgs e)
        {
            foreach (RepeaterItem i in rptData3.Items)
            {
                CheckBox cb = (CheckBox)i.FindControl("CheckBox2");
                if (cb.Checked)
                {
                    HiddenField hiddenacc = (HiddenField)i.FindControl("hiddenacc");
                    a.ExcecuteNonQuery("update DepositorAtable set D_closedate='" + now.Date.ToString("yyyy-MM-dd") + "' where D_accno='" + hiddenacc.Value + "'");
                }
            }
            foreach (RepeaterItem i in rptData5.Items)
            {
                CheckBox cb = (CheckBox)i.FindControl("CheckBox1");
                if (cb.Checked)
                {
                    HiddenField hiddenacc = (HiddenField)i.FindControl("hiddenacc");
                    a.ExcecuteNonQuery("update DepositorAtable set D_closedate='" + now.Date.ToString("yyyy-MM-dd") + "' where D_accno='" + hiddenacc.Value + "'");
                }
            }
            foreach (RepeaterItem i in rptData6.Items)
            {
                CheckBox cb = (CheckBox)i.FindControl("CheckBox1");
                if (cb.Checked)
                {
                    HiddenField hiddenacc = (HiddenField)i.FindControl("hiddenacc");
                    a.ExcecuteNonQuery("update DepositorAtable set D_closedate='" + now.Date.ToString("yyyy-MM-dd") + "' where D_accno='" + hiddenacc.Value + "'");
                }
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