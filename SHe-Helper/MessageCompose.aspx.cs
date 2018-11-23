using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SHe_Helper
{
    public partial class MessageCompose : System.Web.UI.Page
    {
        DBCON a = new DBCON();
        DBCON b = new DBCON();
        DBCON c = new DBCON();
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
                auto();
            }
            
        }
        protected void auto()
        {
            if (Session["Message"].ToString() == "Admin")
            {
                txtFrom.Text = Session["Message"].ToString();
                if (Request.QueryString["id"] != null)
                {
                    txtbox.Value = Request.QueryString["id"];
                    txtbox.Disabled = true;
                }
                else
                {
                    b.ExcecuteQuery("select D_name,CIF from DepositorPtable union select A_name,Agent_id from AgentTable");
                    int row = b.ds.Tables[0].Rows.Count;
                    string abc = "";
                    for (int i = 0; i < row; i++)
                    {
                        abc = abc + "<option>" + b.ds.Tables[0].Rows[i][0].ToString().Trim() + "[" + b.ds.Tables[0].Rows[i][1].ToString().Trim() + "]" + "</option>";
                    }
                    datalist.InnerHtml = abc;
                }
                
            }
            else if (Session["Message"].ToString() == "Agent")
            {
                txtFrom.Text = Session["AgentName"].ToString() + "[" + Session["Agent"] + "]";
                if (Request.QueryString["id"] != null)
                {
                    txtbox.Value = Request.QueryString["id"];
                    txtbox.Disabled = true;
                }
                b.ExcecuteQuery("select distinct t1.D_name,t1.CIF from DepositorPtable t1 inner join DepositorAtable t2 on t1.CIF=t2.CIF where D_agentid='" + Session["Agent"] + "'");
                int row = b.ds.Tables[0].Rows.Count;
                string abc = "";
                for (int i = 0; i < row; i++)
                {
                    abc = abc + "<option>" + b.ds.Tables[0].Rows[i][0].ToString().Trim() + "[" + b.ds.Tables[0].Rows[i][1].ToString().Trim() + "]" + "</option>";
                }
                abc = abc + "<option>" + "Admin" + "</option>";
                datalist.InnerHtml = abc;
            }
            else if (Session["Message"].ToString() == "Depositor")
            {
                txtFrom.Text = Session["DepositorName"].ToString() + "[" + Session["Depositor"] + "]";
                if (Request.QueryString["id"] != null)
                {
                    txtbox.Value = Request.QueryString["id"];
                    txtbox.Disabled = true;
                }
                b.ExcecuteQuery("select distinct A_name,D_agentid from DepositorAtable t1 inner join AgentTable t2 on t1.D_agentid=t2.Agent_id where CIF='" + Session["Depositor"] + "'");
                int row = b.ds.Tables[0].Rows.Count;
                string abc = "";
                for (int i = 0; i < row; i++)
                {
                    abc = abc + "<option>" + b.ds.Tables[0].Rows[i][0].ToString().Trim() + "[" + b.ds.Tables[0].Rows[i][1].ToString().Trim() + "]" + "</option>";
                }
                abc = abc + "<option>" + "Admin" + "</option>";
                datalist.InnerHtml = abc;
            }
            
        }
        protected void btnSend_Click1(object sender, EventArgs e)
        {
            c.ExcecuteNonQuery("Insert into MessageTable([From],[to],message,flag,date) values('" + txtFrom.Text + "','" + txtbox.Value + "','" + txtCompose.Text + "','false','" + DateTime.Now.ToString("dd-MM-yyyy hh:mm tt") + "')");
            txtCompose.Text = "";
        }
    }
}