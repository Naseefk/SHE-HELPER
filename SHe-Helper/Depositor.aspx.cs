using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SHe_Helper
{
    public partial class Depositor1 : System.Web.UI.Page
    {
        DBCON a = new DBCON();
        DBCON b = new DBCON();
        DBCON c = new DBCON();
        Depositor depositor = new Depositor();
        string cif;
        protected void Page_Init(object sender, EventArgs e)
        {

            if (Session["Depositor"] == null)
            {
                Session["Error"] = "unauthorised";
                Response.Redirect("home.aspx");

            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["Message"] = "Depositor";
                cif = Session["Depositor"].ToString();
                depositor.LoadDepositor(cif);
                a.ExcecuteQuery("select * from DepositorATable where CIF='" + cif + "' ");
                rptData.DataSource = a.DT;
                rptData.DataBind();

                b.ExcecuteQuery("select * from DepositorLtable where CIF='" + cif + "' and D_loaneligible='true'");
                rptData2.DataSource = b.DT;
                rptData2.DataBind();

                Session["DepositorName"] = depositor.name;
                c.ExcecuteQuery("select COUNT(*) from MessageTable where flag='false' and [to]='" + Session["DepositorName"] + "[" + Session["Depositor"] + "]" + "'");
                Session["MessageCount"] = c.DT.Rows[0][0].ToString();

                txtName.Text = depositor.name;
                txtCif.Text = depositor.CIF;
                txtAddress.Text = depositor.housename +",\n"+ depositor.place +",\n"+ depositor.post;
                txtAadhar.Text = depositor.aadhar;
                txtDob.Text = Convert.ToDateTime(depositor.dob).Date.ToString("dd-MM-yyyy");
                txtPan.Text = depositor.pan;
                txtPhone.Text = depositor.phone;

                
            }
        }
        protected void logout(object sender, EventArgs e)
        {
            Session["Depositor"] = null;
            Session["DepositorName"] = null;
            Response.Redirect("home.aspx");
        }
    }
}