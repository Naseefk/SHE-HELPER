using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SHe_Helper
{
    public partial class Agent1 : System.Web.UI.Page
    {
        DBCON a = new DBCON();
        DBCON b = new DBCON();
        DBCON c = new DBCON();
        DBCON d = new DBCON();
        DBCON f = new DBCON();
        public string count;
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
                Session["Message"] = "Agent";
                a.ExcecuteQuery("select * from DepositorPtable t1 inner join DepositorAtable t2 on t1.CIF=t2.CIF where t2.D_agentid ='" + Session["Agent"] + "' and t1.D_status = 'true'");
              
                    rptData.DataSource = a.DT;
                    rptData.DataBind();
                
                b.ExcecuteQuery("select * from AgentTable where Agent_id='" + Session["Agent"] + "'");
                if (b.DT.Rows.Count != 0)
                {
                    txtAgentId.Text = b.DT.Rows[0][0].ToString();
                    txtName.Text = b.DT.Rows[0][1].ToString();
                    txtAddress.Text = b.DT.Rows[0][2].ToString() +",\n" + b.DT.Rows[0][14].ToString() +",\n" + b.DT.Rows[0][15].ToString() +",\n" + b.DT.Rows[0][16].ToString();
                    txtPhone.Text = b.DT.Rows[0][3].ToString();
                    txtDob.Text = Convert.ToDateTime(b.DT.Rows[0][4].ToString()).Date.ToString("dd-MM-yyyy");
                    txtBlock.Text = b.DT.Rows[0][8].ToString();
                    txtpostOffice.Text = b.DT.Rows[0][7].ToString();
                    txtDoj.Text = Convert.ToDateTime(b.DT.Rows[0][9].ToString()).Date.ToString("dd-MM-yyyy");

                }
                Session["AgentName"] = txtName.Text;
                c.ExcecuteQuery("select COUNT(*) from MessageTable where flag='false' and [to]='" + Session["AgentName"] + "[" + Session["Agent"] + "]" + "'");
                count = c.DT.Rows[0][0].ToString();
                Session["MessageCount"] = count;
                
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