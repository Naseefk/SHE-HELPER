using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SHe_Helper
{
    public partial class AgentPayment : System.Web.UI.Page
    {
        DBCON a = new DBCON();
        DBCON b = new DBCON();
        DBCON c = new DBCON();
        DBCON d = new DBCON();
        DBCON f = new DBCON();
        DBCON g = new DBCON();
        DBCON h = new DBCON();
        DBCON j = new DBCON();
        DBCON k = new DBCON();
        DBCON l = new DBCON();
        string pay;
        string advance;
        string loan;
        string total;
        string noOfpay;
        int amt;
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
            a.ExcecuteQuery("select * from DepositorATable d1 INNER JOIN DepositorPTable d2 ON d2.CIF=d1.CIF where d1.D_agentid='" + Session["Agent"] + "' and d1.D_collected='true' and d1.D_paid='false'");

            rptData.DataSource = a.DT;
            rptData.DataBind();


            b.ExcecuteQuery("Select max(schedule_no) from ScheduleTable where agent_id='" + Session["Agent"] + "'");
            if (b.DT.Rows[0][0].ToString().Length != 0)
            {
                txtSchedule.Text = b.DT.Rows[0][0].ToString().Trim();
            }
            else
            {
                txtSchedule.Text = "1";
            }

            c.ExcecuteQuery("Select depositors from ScheduleTable where agent_id='" + Session["Agent"] + "' and schedule_no='" + txtSchedule.Text + "'");
            if (c.DT.Rows.Count != 0)
            {
                lblCount.Text = c.DT.Rows[0][0].ToString();
            }
            else
            {
                lblCount.Text = "0";
            }

            d.ExcecuteQuery("Select total from ScheduleTable where agent_id='" + Session["Agent"] + "' and schedule_no='" + txtSchedule.Text + "'");
            
            if (d.DT.Rows.Count != 0)
            {
                lblAmount.Text = d.DT.Rows[0][0].ToString();
            }
            else
            {
                lblAmount.Text = "0";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                refresh();
                
            }
        }

        protected void txtSchedule_TextChanged(object sender, EventArgs e)
        {
            c.DT.Clear();
            d.DT.Clear();
            c.ExcecuteQuery("Select depositors from ScheduleTable where agent_id='" + Session["Agent"] + "' and schedule_no='" + txtSchedule.Text + "'");
            if (c.DT.Rows.Count != 0)
                lblCount.Text = c.DT.Rows[0][0].ToString();
            else
                lblCount.Text = "0";

            d.ExcecuteQuery("Select total from ScheduleTable where agent_id='" + Session["Agent"] + "' and schedule_no='" + txtSchedule.Text + "'");
            if (d.DT.Rows.Count != 0)
                lblAmount.Text = d.DT.Rows[0][0].ToString();
            else
                lblAmount.Text = "0";

            a.DT.Clear();
            a.ExcecuteQuery("select * from DepositorATable d1 INNER JOIN DepositorPTable d2 ON d2.CIF=d1.CIF where d1.D_agentid='" + Session["Agent"] + "' and d1.D_collected='true' and d1.D_paid='false'");

            rptData.DataSource = a.DT;
            rptData.DataBind();
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox cb = (CheckBox)sender;
            if (cb.Checked)
            {
                var repeaterItem = ((Control)sender).NamingContainer;
                HiddenField hidden = (HiddenField)repeaterItem.FindControl("hidden");
                HiddenField hidacc = (HiddenField)repeaterItem.FindControl("hiddenacc");
                g.ExcecuteQuery("select sum(0+D_wallet),sum(0+D_loanlastpay) from DepositorAtable t1 inner join DepositorLtable t2 on t1.D_accno=t2.D_accno where t1.D_agentid='" + Session["Agent"] + "' and t1.D_accno='" + hidacc.Value + "'");
                string adv = g.DT.Rows[0][0].ToString();
                string lon = g.DT.Rows[0][1].ToString();

                lblAmount.Text = Convert.ToString(Convert.ToInt32(lblAmount.Text) + Convert.ToInt32(hidden.Value)  + Convert.ToInt16(adv) + Convert.ToInt16(lon));
                lblCount.Text = Convert.ToString(Convert.ToInt32(lblCount.Text) + 1);
            }else {
                var repeaterItem = ((Control)sender).NamingContainer;
                HiddenField hidden = (HiddenField)repeaterItem.FindControl("hidden");
                HiddenField hidacc = (HiddenField)repeaterItem.FindControl("hiddenacc");
                g.ExcecuteQuery("select sum(0+D_wallet),sum(0+D_loanlastpay) from DepositorAtable t1 inner join DepositorLtable t2 on t1.D_accno=t2.D_accno where t1.D_agentid='" + Session["Agent"] + "' and t1.D_accno='" + hidacc.Value + "'");

                string adv = g.DT.Rows[0][0].ToString();
                string lon = g.DT.Rows[0][1].ToString();
                lblAmount.Text = Convert.ToString(Convert.ToInt32(lblAmount.Text) - (Convert.ToInt32(hidden.Value) + Convert.ToInt16(adv) + Convert.ToInt16(lon)));
                lblCount.Text = Convert.ToString(Convert.ToInt32(lblCount.Text) - 1);
            }
            amt = Convert.ToInt32(lblAmount.Text);
            if (amt > 20000)
            {
                btnSave.Enabled = false;
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You can not pay > 20,000')", true);
            }
            else
            {
                btnSave.Enabled = true;
            }
            
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string adv;
            string deno;
            string lon;
            string nop;
            string tot;
            string duepay;
            string totamount;
            DateTime matDate;
            DateTime duedt;
                foreach (RepeaterItem i in rptData.Items)
                {
                    CheckBox cb = (CheckBox)i.FindControl("CheckBox1");
                    if (cb.Checked)
                    {
                        HiddenField hidAcc = (HiddenField)i.FindControl("hiddenacc");
                        l.ExcecuteQuery("select sum(0+D_wallet),sum(0+D_loanlastpay) from DepositorAtable t1 inner join DepositorLtable t2 on t1.D_accno=t2.D_accno where t1.D_agentid='" + Session["Agent"] + "' and t1.D_accno='" + hidAcc.Value + "'");
                        j.ExcecuteQuery("select  D_denomination,D_noOfpay,D_duedate,D_totamount,D_matdate from DepositorAtable where D_accno='" + hidAcc.Value + "'");
                        if (l.DT.Rows[0][0].ToString().Length != 0)
                        {
                            adv = l.DT.Rows[0][0].ToString();
                        }
                        else
                        {
                            adv = "0";
                        }
                        if (l.DT.Rows[0][1].ToString().Length != 0)
                        {
                            lon = l.DT.Rows[0][1].ToString();
                        }
                        else
                        {
                            lon = "0";
                        }
                        deno = j.DT.Rows[0][0].ToString();
                        duedt = Convert.ToDateTime(j.DT.Rows[0][2].ToString());
                        nop = j.DT.Rows[0][1].ToString();
                        matDate = Convert.ToDateTime(j.DT.Rows[0][4].ToString());
                        tot = Convert.ToString(Convert.ToInt32(adv) + Convert.ToInt32(lon) + Convert.ToInt32(deno));
                        totamount = Convert.ToString(Convert.ToInt32(j.DT.Rows[0][3]) + Convert.ToInt32(tot));
                        noOfpay = Convert.ToString(Convert.ToInt32(nop) + (Convert.ToInt32(adv) / Convert.ToInt32(deno)) + 1);
                        if (adv == "0")
                        {
                            duedt = duedt.AddMonths(1);
                            if ((matDate.Year - duedt.Year) == 0 && (matDate.Month - duedt.Month) == 1)
                            {
                                duepay = "0";
                            }
                            else
                            {
                                duepay = deno;
                            }

                        }
                        else
                        {
                            duedt = duedt.AddMonths((Convert.ToInt32(adv) / Convert.ToInt32(deno)));
                            
                            if ((matDate.Year - duedt.Year)==0 && (matDate.Month - duedt.Month) == 1)
                            {
                                duepay = "0";
                            }
                            else
                            {
                                duepay = deno;
                            }
                            
                        }
                        a.ExcecuteNonQuery("update DepositorATable set D_paid='True',D_collected='false', D_noOfpay='" + noOfpay + "',D_lastpay='" + tot + "',D_lpdate='" + DateTime.Now.Date.ToString("yyyy-MM-dd") + "',D_totamount='" + totamount + "',D_duedate='" + duedt.Date.ToString("yyyy-MM-dd") + "',D_duepay='" + duepay + "',D_scheduleno='" + txtSchedule.Text + "' where D_accno='" + hidAcc.Value + "'");
                        l.DT.Clear();
                        l.ds.Clear();

                        j.DT.Clear();
                        j.ds.Clear();
                        noOfpay = "0"; 
                    }
                }
                k.ExcecuteQuery("select sum(0+D_denomination),sum(0+D_wallet),sum(0+D_loanlastpay) from DepositorAtable t1 inner join DepositorLtable t2 on t1.D_accno=t2.D_accno where t1.D_agentid='" + Session["Agent"] + "' and t1.D_paid='True' and D_scheduleno='" + txtSchedule.Text + "'");
                pay = k.DT.Rows[0][0].ToString();
                advance = k.DT.Rows[0][1].ToString();
                loan = k.DT.Rows[0][2].ToString();
                total = Convert.ToString(Convert.ToInt32(pay) + Convert.ToInt32(advance) + Convert.ToInt32(loan));

                f.ExcecuteNonQuery("Insert into ScheduleTable (agent_id,schedule_no,s_date,depositors,pay,advance,loan,total) values('" + Session["Agent"] + "','" + txtSchedule.Text + "','" + DateTime.Now.Date.ToString("yyyy-MM-dd") + "','" + lblCount.Text + "','" + pay + "','" + advance + "','" + loan + "','" + total + "')");
            
        }
        protected void logout(object sender, EventArgs e)
        {
            Session["Agent"] = null;
            Session["AgentName"] = null;
            Response.Redirect("home.aspx");
        }
    }
}