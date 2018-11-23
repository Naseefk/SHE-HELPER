using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SHe_Helper
{
    public partial class query : System.Web.UI.Page
    {
        DBCON a = new DBCON();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    if (Request.QueryString["cif"] != null)
            //    {
            //        a.ExcecuteQuery("select * from DepositorPtable where CIF='"+ Request.QueryString["cif"].ToString() + "'");
            //        rptData.DataSource = a.DT;
            //        rptData.DataBind();
            //    }
                
            //}
        }
        protected void rptData_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Literal litStatus = new Literal();

                litStatus = e.Item.FindControl("litStatus") as Literal;

                         
            }
        }


    }
}