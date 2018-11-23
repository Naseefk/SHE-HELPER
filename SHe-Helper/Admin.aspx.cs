using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SHe_Helper
{
    public partial class Admin : System.Web.UI.Page
    {
       public int numbr= 12;
        DBCON a = new DBCON();
        DBCON d = new DBCON();
        DBCON b = new DBCON();
        public string count;
        public string status;
        protected void Page_Init(object sender, EventArgs e)
        {
           
            if (Session["Admin"]==null)
            {
                Session["Error"] = "unauthorised";
                Response.Redirect("home.aspx");
               
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["Message"] = "Admin";
                if (Session["Admin"] != null)
                {
                    a.ExcecuteQuery("select * from AgentTable");
                    rptData.DataSource = a.DT;
                    rptData.DataBind();
                    d.ExcecuteQuery("select * from DepositorPtable");
                    Repeater2.DataSource = d.DT;
                    Repeater2.DataBind();
                    b.ExcecuteQuery("select COUNT(*) from MessageTable where flag='false' and [to]='"+Session["Message"]+"' ");
                    count = b.DT.Rows[0][0].ToString();
                    Session["MessageCount"] = count;
                }
            }
        }

        protected void rptData_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Literal litStatus = new Literal();

                litStatus = e.Item.FindControl("litStatus") as Literal;

                string A_Status = DataBinder.Eval(e.Item.DataItem, "A_status").ToString();

                if (A_Status == "True")
                {
                    litStatus.Text = "Approved";
                }
                else
                {
                    litStatus.Text = "Pending";
                }
                status = litStatus.Text;
            }
        }

      
        protected void logout(object sender, EventArgs e)
        {
            
            Session["Admin"] = null;
            Response.Redirect("home.aspx");
        }
    }
}