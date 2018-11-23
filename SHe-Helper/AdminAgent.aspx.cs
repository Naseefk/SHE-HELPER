using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SHe_Helper
{
    public partial class AdminAgent : System.Web.UI.Page
    {
        DBCON a = new DBCON();
        public string status;
        protected void Page_Init(object sender, EventArgs e)
        {

            //if (Session["Admin"] == null)
            //{
            //    Session["Error"] = "unauthorised";
            //    Response.Redirect("home.aspx");

            //}
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                a.ExcecuteQuery("select * from AgentTable");
                rptData.DataSource = a.DT;
                rptData.DataBind();

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