using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace template
{
    public partial class page : System.Web.UI.Page
    {
        DBCON a = new DBCON();
        DBCON b = new DBCON();
        DBCON c = new DBCON();
        DBCON d = new DBCON();
        DBCON f = new DBCON();
        bool ValidLogin = false;
        string cif;
        string agentid;
        bool agentIschecked = false;

        private void loadcheck()
        {
            if (rbtnAgent.Checked == true && rbtnDepositor.Checked == false)
            {
                lblusername.Text = "Agent ID";
                txtUsername.Attributes.Add("placeholder", "Enter Agent ID");
                agentIschecked = true;

            }

            else
            {
                lblusername.Text = "CIF Number";
                txtUsername.Attributes.Add("placeholder", "Enter CIF Number");
                agentIschecked = false;

            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Error"] != null)
            {
                if (Session["Error"].ToString() == "unauthorised")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You do not have permission to access this page. ')", true);
                    Session["Error"] = null;
                }
            }
            loadcheck();

        }

        protected void rbtnDepositor_CheckedChanged(object sender, EventArgs e)
        {
            loadcheck();

        }

        protected void rbtnAgent_CheckedChanged(object sender, EventArgs e)
        {
            loadcheck();

        }
        protected void btnAdminlogin_clicked(object sender, EventArgs e)
        {
            string uname = txtadminUsername.Text;
            string pass = txtAdminpass.Text;
          
            b.ExcecuteQuery("Select * from UserTable where usrname ='" + uname + "' and password='" + pass + "'");

            if (b.DT.Rows.Count == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Incorrect Credentials')", true);
            }else
            {
                if(uname =="admin" && pass=="admin")
                {
                    Session["Admin"] = "IsAdmin";
                    Response.Redirect("Admin.aspx");
                }
            }


        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtpassword.Text.Trim();
            
            a.ExcecuteQuery("Select * from UserTable where usrname='" + username + "' AND password='" + password + "'");
            if (a.DT.Rows.Count == 1)
            {
                ValidLogin = true;
                a.DT.Clear();
                a.ds.Clear();
                if (agentIschecked == true)
                {
                    c.ExcecuteQuery("select Agent_id from UserTable where usrname='" + username + "' AND password='" + password + "'");
                    agentid = c.DT.Rows[0][0].ToString();
                }
                else
                {
                    c.ExcecuteQuery("select CIF from UserTable where usrname='" + username + "' AND password='" + password + "'");
                    cif= c.DT.Rows[0][0].ToString();
                }
                c.DT.Clear();
                c.ds.Clear();

            }
            else
            {
                
                if (agentIschecked == true)
                {
                    d.ExcecuteQuery("Select * from UserTable where Agent_id='" + txtUsername.Text.Trim() + "' AND password='" + password + "'");
                }
                else
                {
                    d.ExcecuteQuery("Select * from UserTable where CIF='" + txtUsername.Text.Trim() + "' AND password='" + password + "'");
                }
                if(d.DT.Rows.Count == 1)
                {
                    ValidLogin = true;
                    cif = d.DT.Rows[0][0].ToString();
                    agentid = d.DT.Rows[0][1].ToString();
                    d.DT.Clear();
                    d.ds.Clear();
                }
            }

            if (ValidLogin == true)
            {
                if (agentIschecked ==true)
                {
                    f.ExcecuteQuery("Select A_status from AgentTable where Agent_id='" + agentid +"'");

                    if (Convert.ToBoolean(f.DT.Rows[0][0]) == true)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Signed in successfully')", true);
                        Session["Agent"] = agentid;
                        Response.Redirect("Agent.aspx");
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You are not a approved agent')", true);
                        txtUsername.Text = "";
                        txtpassword.Text = "";
                    }
                    
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Signed in successfully')", true);
                    Session["Depositor"] = cif;
                    Response.Redirect("Depositor.aspx");
                }
                
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error signing in')", true);
                txtUsername.Text = "";
                txtpassword.Text = "";
            }
        }
    }
}