using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace SHe_Helper
{
    public partial class DepositorDetails : System.Web.UI.Page
    {
        DBCON a = new DBCON();
        DBCON b = new DBCON();
        DBCON c = new DBCON();
        DBCON d = new DBCON();
        DBCON f = new DBCON();
        DBCON g = new DBCON();
        DBCON h = new DBCON();
        DBCON i = new DBCON();
        DBCON j = new DBCON();
        DBCON k = new DBCON();
        public DateTime now = DateTime.Now;
        public DateTime duedt;
        bool status;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["cif"] != null)
                {
                    a.ExcecuteQuery("select * from DepositorPtable where CIF='" + Request.QueryString["cif"].ToString() + "'");
                    c.ExcecuteQuery("select D_accno from DepositorAtable where CIF='" + Request.QueryString["cif"].ToString() + "'");
                    

                    ddlAccNo.DataSource = c.DT;
                    ddlAccNo.DataBind();
                    ddlAccNo.DataTextField = "D_accno";
                    ddlAccNo.DataBind();
                    
                    txtCIF.Text = a.DT.Rows[0][0].ToString();
                    txtName.Text = a.DT.Rows[0][1].ToString();
                    txtAddress.Text = a.DT.Rows[0][2].ToString() + "\n" + a.DT.Rows[0][3].ToString()+ "\n" + a.DT.Rows[0][4].ToString() + ",\n" + a.DT.Rows[0][5].ToString();
                    txtDb.Text = Convert.ToDateTime(a.DT.Rows[0][6].ToString()).Date.ToString("dd-MM-yyyy");
                    txtAadhar.Text = a.DT.Rows[0][7].ToString();
                    txtPhone.Text = a.DT.Rows[0][8].ToString();
                    txtPan.Text = a.DT.Rows[0][9].ToString();
                    status = Convert.ToBoolean(a.DT.Rows[0][10].ToString());
                }
                else if (Request.QueryString["id"] != null)
                {
                    a.ExcecuteQuery("select * from DepositorPtable where CIF='" + Request.QueryString["id"].ToString() + "'");
                    c.ExcecuteQuery("select D_accno from DepositorAtable where CIF='" + Request.QueryString["id"].ToString() + "'");
                    j.ExcecuteQuery("select password from UserTable where CIF='" + Request.QueryString["id"].ToString() + "'");
                    ddlAccNo.DataSource = c.DT;
                    ddlAccNo.DataBind();
                    ddlAccNo.DataTextField = "D_accno";
                    ddlAccNo.DataBind();

                    txtPassword.Visible = true;
                    lblPassword.Visible = true;
                    txtPassword.Text = j.DT.Rows[0][0].ToString();
                    txtCIF.Text = a.DT.Rows[0][0].ToString();
                    txtName.Text = a.DT.Rows[0][1].ToString();
                    txtAddress.Text = a.DT.Rows[0][2].ToString() + ",\n" + a.DT.Rows[0][3].ToString() + ",\n" + a.DT.Rows[0][4].ToString() + ",\n" + a.DT.Rows[0][5].ToString();
                    txtDb.Text = Convert.ToDateTime(a.DT.Rows[0][6].ToString()).Date.ToString("dd-MM-yyyy");
                    txtAadhar.Text = a.DT.Rows[0][7].ToString();
                    txtPhone.Text = a.DT.Rows[0][8].ToString();
                    txtPan.Text = a.DT.Rows[0][9].ToString();
                    status = Convert.ToBoolean(a.DT.Rows[0][10].ToString());

                    btnApprove.Visible = false;
                    btnReject.Visible = false;
                }
                else if (Request.QueryString["accno"] != null)
                {
                    a.ExcecuteQuery("select * from DepositorAtable where D_accno='" + Request.QueryString["accno"].ToString() + "'");
                    lblPersonalInfmn.Visible = false;
                    lblAccInfmn.Visible = false;
                    ddlAccNo.Visible = false;
                    lblName.Visible = false;
                    txtName.Visible = false;
                    lblAddress.Visible = false;
                    txtAddress.Visible = false;
                    lblContact.Visible = false;
                    txtPhone.Visible = false;
                    lblDob.Visible = false;
                    txtDb.Visible = false;
                    lblAadhar.Visible = false;
                    txtAadhar.Visible = false;
                    lblPan.Visible = false;
                    txtPan.Visible = false;
                    btnSelect.Visible = false;
                    txtAccNo.Visible = true;

                    txtCIF.Text= a.DT.Rows[0][0].ToString();
                    txtAccNo.Text= a.DT.Rows[0][3].ToString();
                    txtAgentId.Text= a.DT.Rows[0][14].ToString();
                    txtNominee.Text = a.DT.Rows[0][8].ToString();
                    txtRelation.Text = a.DT.Rows[0][9].ToString();
                    txtDenomination.Text= a.DT.Rows[0][1].ToString();
                    txtLastpay.Text= a.DT.Rows[0][4].ToString();
                    txtLastPayDate.Text= Convert.ToDateTime(a.DT.Rows[0][6].ToString()).Date.ToString("yyyy-MM-dd");
                    txtDopen.Text = Convert.ToDateTime(a.DT.Rows[0][2].ToString()).Date.ToString("yyyy-MM-dd");
                    txtMaDate.Text = Convert.ToDateTime(a.DT.Rows[0][7].ToString()).Date.ToString("yyyy-MM-dd");
                    txtTotAmount.Text= a.DT.Rows[0][10].ToString();
                    txtNumberofpay.Text= a.DT.Rows[0][13].ToString();
                    txtDuePay.Text= a.DT.Rows[0][11].ToString();
                    txtDueDate.Text= Convert.ToDateTime(a.DT.Rows[0][12].ToString()).Date.ToString("yyyy-MM-dd");

                    btnApprove.Visible = false;
                    btnReject.Visible = false;
                }
                if (status)
                {
                    btnApprove.Visible = false;
                    btnReject.Visible = false;
                }
            }
            
        }
        public int RandomNumber(int min, int max)
        {
            Random random = new Random();
            return random.Next(min, max);
        }
        public string RandomString(int size, bool lowerCase)
        {
            StringBuilder builder = new StringBuilder();
            Random random = new Random();
            char ch;
            for (int i = 0; i < size; i++)
            {
                ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
                builder.Append(ch);
            }
            if (lowerCase)
                return builder.ToString().ToLower();
            return builder.ToString();
        }
        public string RandomPassword()
        {
            StringBuilder builder = new StringBuilder();
            builder.Append(RandomString(4, true));
            builder.Append(RandomNumber(1000, 9999));
            builder.Append(RandomString(2, false));
            return builder.ToString();
        }
        protected void btnApprove_Click(object sender, EventArgs e)
        {
            DateTime MatYear = DateTime.Now.AddYears(5);
            if (now.Day <= 15)
            {
                duedt = now.AddMonths(1);
                duedt = new DateTime(duedt.Year, duedt.Month, 15);
            }
            else
            {
                duedt = now.AddMonths(1);
                duedt = new DateTime(duedt.Year, duedt.Month, 30);
            }

            b.ExcecuteNonQuery("update DepositorPtable set D_status='true' where CIF='" + txtCIF.Text + "'");
            k.ExcecuteNonQuery("update DepositorAtable set D_doj='" + DateTime.Now.ToString("yyyy-MM-dd") + "',D_matdate='" + MatYear.Date.ToString("yyyy-MM-dd") + "',D_duedate='" + duedt.Date.ToString("yyyy-MM-dd") + "',D_lpdate='" + now.Date.ToString("yyyy-MM-dd") + "',D_lastpay='" + txtDenomination.Text + "',D_totamount='" + txtDenomination.Text + "',D_noOfpay='1',D_duepay='" + txtDenomination.Text + "' where CIF='" + txtCIF.Text + "'");
            i.ExcecuteNonQuery("Insert into UserTable(CIF,usrname,password) values('" + txtCIF.Text + "','" + txtName.Text + "','" + RandomPassword() + "')");
            btnApprove.Visible = false;
            btnReject.Visible = false;


        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            d.ExcecuteQuery("select * from DepositorAtable where D_accno='" + ddlAccNo.Text + "'");
            if (d.DT.Rows[0][6].ToString().Length !=0)
            {
                txtLastPayDate.Text = Convert.ToDateTime(d.DT.Rows[0][6].ToString()).Date.ToString("yyyy-MM-dd");
            }
            if (d.DT.Rows[0][12].ToString().Length !=0)
            {
                txtDueDate.Text = Convert.ToDateTime(d.DT.Rows[0][12].ToString()).Date.ToString("yyyy-MM-dd");
            }
          
            txtDenomination.Text = d.DT.Rows[0][1].ToString();
            txtDopen.Text = Convert.ToDateTime(d.DT.Rows[0][2].ToString()).Date.ToString("yyyy-MM-dd");
            //txtAccNo.Text = d.DT.Rows[0][3].ToString();
            txtLastpay.Text = d.DT.Rows[0][4].ToString();
            txtMaDate.Text = DateTime.Now.AddYears(5).ToString("yyyy - MM - dd");
            txtNominee.Text = d.DT.Rows[0][8].ToString();
            txtRelation.Text = d.DT.Rows[0][9].ToString();
            txtTotAmount.Text = d.DT.Rows[0][10].ToString();
            txtDuePay.Text = d.DT.Rows[0][11].ToString();
            txtNumberofpay.Text = d.DT.Rows[0][13].ToString();
            txtAgentId.Text = d.DT.Rows[0][14].ToString();
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            
            g.ExcecuteNonQuery("Delete from DepositorAtable where CIF='" + Request.QueryString["cif"] + "'");
            h.ExcecuteNonQuery("Delete from DepositorLtable where CIF='" + Request.QueryString["cif"] + "'");
            f.ExcecuteNonQuery("Delete from DepositorPtable where CIF='" + Request.QueryString["cif"] + "'");
            btnApprove.Visible = false;
            btnReject.Visible = false;
        }
        
    }
}