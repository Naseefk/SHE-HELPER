using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SHe_Helper
{
    public partial class Password : System.Web.UI.Page
    {
        DBCON a = new DBCON();
        DBCON b = new DBCON();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void txtCurrentPassword_TextChanged(object sender, EventArgs e)
        {
            if (Session["Message"].ToString()=="Agent")
            {
                a.ExcecuteQuery("Select password from UserTable where Agent_id='" + Session["Agent"] + "'");
            }
            else if(Session["Message"].ToString() == "Depositor")
            {
                a.ExcecuteQuery("Select password from UserTable where CIF='" + Session["Depositor"] + "'");
            }
            if (a.DT.Rows[0][0].ToString().Trim() == txtCurrentPassword.Text)
            {
                Panel1.Enabled = true;
                txtCurrentPassword.BorderColor = System.Drawing.Color.LightGray;
            }
            else
            {
                txtCurrentPassword.Text = "";
                txtCurrentPassword.BorderColor = System.Drawing.Color.Red;
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtNewPassword.Text == txtReEnter.Text)
            {
                if (Session["Message"].ToString() == "Agent")
                {
                    b.ExcecuteNonQuery("Update UserTable set password='" + txtNewPassword.Text + "' where Agent_id='" + Session["Agent"] + "'");
                }
                else if (Session["Message"].ToString() == "Depositor")
                {
                    b.ExcecuteNonQuery("Update UserTable set password='" + txtNewPassword.Text + "' where CIF='" + Session["Depositor"] + "'");
                }
                
                lblPassword.Attributes["style"] = "color:Green";
                lblPassword.Text = "Password changed successfully...";
                
            }
            else
            {
                lblPassword.Text = "Password mismatch...!";
            }

        }
    }

}