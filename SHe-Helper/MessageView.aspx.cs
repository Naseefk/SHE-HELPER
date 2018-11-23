using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SHe_Helper
{
    public partial class MessageView : System.Web.UI.Page
    {
        DBCON a = new DBCON();
        DBCON b = new DBCON();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                a.ExcecuteQuery("select * from MessageTable where M_id='" + Request.QueryString["id"] + "'");
                b.ExcecuteNonQuery("update MessageTable set flag='true' where M_id='" + Request.QueryString["id"] + "'");
            }
            lblFrom.Text = a.DT.Rows[0][0].ToString();
            lblDate.Text = Convert.ToDateTime(a.DT.Rows[0][5]).ToString("dd-MM-yyyy hh:mm tt");
            txtMessage.Text = a.DT.Rows[0][2].ToString();
        }
    }
}