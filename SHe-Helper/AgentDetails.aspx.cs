using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SHe_Helper
{
    public partial class AgentDetails : System.Web.UI.Page
    {
        DBCON a = new DBCON();
        DBCON b = new DBCON();
        DBCON c = new DBCON();
        string usrname;
        bool status;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    a.ExcecuteQuery("select * from AgentTable where Agent_id='" + Request.QueryString["id"].ToString() + "'");

                    usrname = a.DT.Rows[0][13].ToString();
                    txtId.Text = a.DT.Rows[0][0].ToString();
                    txtName.Text = a.DT.Rows[0][1].ToString();
                    txtAddress.Text = a.DT.Rows[0][2].ToString() + ",\n" + a.DT.Rows[0][14].ToString() + ",\n" + a.DT.Rows[0][15].ToString() + ",\n" + a.DT.Rows[0][16].ToString();
                    txtPhone.Text = a.DT.Rows[0][3].ToString();
                    txtDb.Text = Convert.ToDateTime(a.DT.Rows[0][4].ToString()).Date.ToString("yyyy-MM-dd");
                    if (a.DT.Rows[0][5].ToString() == "True")
                    {
                        txtMs.Text = "Married";
                    }
                    else
                    {
                        txtMs.Text = "Single";
                    }


                    txtEmail.Text = a.DT.Rows[0][6].ToString();
                    txtPost.Text = a.DT.Rows[0][7].ToString();
                    txtBlock.Text = a.DT.Rows[0][8].ToString();
                    textDist.Text = a.DT.Rows[0][11].ToString();
                    textEQ.Text = a.DT.Rows[0][12].ToString();
                    status = Convert.ToBoolean(a.DT.Rows[0][10].ToString());

                    if (status)
                    {
                        btnApprove.Visible = false;
                        btnReject.Visible = false;
                    }
                }
                if (Session["Depositor"] != null)
                {
                    btnApprove.Visible = false;
                    btnReject.Visible = false;
                }

            }
            
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            b.ExcecuteNonQuery("update AgentTable set A_status='true' where Agent_id='" + Request.QueryString["id"] + "' ");
            btnApprove.Visible = false;
            btnReject.Visible = false;


        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            c.ExcecuteNonQuery("delete from AgentTable where Agent_id='" + Request.QueryString["id"] + "' ");
            Response.Write("<script>window.close();</" + "script>");
            Response.End();
        }
    }
}