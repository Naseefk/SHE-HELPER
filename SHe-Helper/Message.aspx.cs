using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SHe_Helper
{
    public partial class Message : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {

            if (Session["Admin"] == null)
            {
                Session["Error"] = "unauthorised";
                Response.Redirect("home.aspx");

            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void logout(object sender, EventArgs e)
        {

            Session["Admin"] = null;
            Response.Redirect("home.aspx");
        }
    }

}
