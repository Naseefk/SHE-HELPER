using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SHe_Helper
{
    public class Depositor
    {
        DBCON a = new DBCON();
        DBCON b = new DBCON();
        DBCON c = new DBCON();
        DBCON d = new DBCON();
        DBCON e = new DBCON();
        DBCON f = new DBCON();
        DBCON g = new DBCON();
        int i;

        public string CIF;
        public string name;
        public string housename;
        public string place;
        public string post;
        public string pin;
        public string dob;
        public string aadhar;
        public string nominee;
        public string nomineerelation;
        public string phone;
        public string pan;
        public double denomination;
        public Boolean status;
        public DateTime now = DateTime.Now;
        public DateTime duedt;
        public string tempID3;

        string[] accno = new string[10];
        DateTime[] doj = new DateTime[10];
        double[] lastpay = new double[10];
        DateTime[] lpdate = new DateTime[10];
        DateTime[] matdate = new DateTime[10];
        double[] totamt = new double[10];
        DateTime[] duedate = new DateTime[10];
        double[] duepay = new double[10];
        int[] nopay = new int[10];
        string[] agentid = new string[10];
        string[] nomineee = new string[10];
        string[] relation = new string[10];

         
        public void storeDepositor(string name, string housename, string place, string post, string pin, string dob, string aadhar, string pan, string phone, double denomination, string nominee, string relation)
        {
            this.name = name;
            this.housename = housename;
            this.place = place;
            this.post = post;
            this.pin = pin;
            this.dob = dob;
            this.aadhar = aadhar;
            this.pan = pan;
            this.phone = phone;
            this.denomination = denomination;
            this.nominee = nominee;
            this.nomineerelation=relation;
            
        }
        public void accGen()
        {
            tempID3 = "";
            e.ExcecuteQuery("select isnull(max(dbo.udf_GetNumeric(D_accno)),0)+1 from DepositorATable");
            if (e.DT.Rows.Count > 0)
            {
                int tempID4 = Convert.ToInt32(e.DT.Rows[0][0].ToString());
                tempID3 = tempID4.ToString("0000000000");
            }
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

        }
        
        public void newDepositor(string agentid)
        {
            accGen();
            
            string tempID2 = "";
            d.ExcecuteQuery("select isnull(max(dbo.udf_GetNumeric(CIF)),0)+1 from DepositorPTable");
            if (d.DT.Rows.Count > 0)
            {
                int tempID = Convert.ToInt32(d.DT.Rows[0][0].ToString());
                tempID2 = tempID.ToString("0000000000");
            }
            
            

            a.ExcecuteNonQuery("Insert into DepositorPTable(CIF,D_name,D_housename,D_place,D_post,D_pin,D_dob,D_aadhar,D_phone,D_pan,D_status) values('" + tempID2 + "','" + name + "','" + housename + "','" + place + "','" + post + "','" + pin + "','" + Convert.ToDateTime(dob).Date.ToString("yyyy-MM-dd") + "','" + aadhar + "','" + phone + "','" + pan + "','False')");
            b.ExcecuteNonQuery("Insert into DepositorATable(CIF,D_denomination,D_doj,D_nominee,D_relation,D_accno,D_agentid,D_paid,D_collected,D_wallet,D_noOfpay,D_duepay,D_totamount) values('" + tempID2 + "','" + denomination + "','" + now.Date.ToString("yyyy-MM-dd") + "','" + nominee + "','" + nomineerelation + "','" + tempID3 + "','" + agentid + "','false','false','0','0','" + denomination + "','0')");
            f.ExcecuteNonQuery("Insert into DepositorLtable(CIF,D_loaneligible,D_loandate,D_loanlastpay,D_accno,D_status,D_loanreturn,D_loanbal,D_loanamt) values('" + tempID2 + "','false','" + now.Date.ToString("yyyy-MM-dd") + "' ,'0','" + tempID3 + "','true','0','0','0')");
           
        }
        public void addAccount(string agentid, string denomination, string nominee, string relation, string cif)
        {
            accGen();
            DateTime MatYear = DateTime.Now.AddYears(5);
            c.ExcecuteNonQuery("Insert into DepositorAtable(CIF,D_denomination,D_doj,D_matdate,D_nominee,D_relation,D_agentid,D_accno,D_duedate,D_paid,D_collected,D_wallet,D_noOfpay,D_duepay,D_totamount,D_lastpay,D_lpdate) values('" + cif + "','" + denomination + "','" + now.Date.ToString("yyyy-MM-dd") + "','" + Convert.ToDateTime(MatYear).Date.ToString("yyyy-MM-dd") + "','" + nominee + "','" + relation + "','" + agentid + "','" + tempID3 + "','" + duedt.Date.ToString("yyyy-MM-dd") + "','false','false','0','1','" + denomination + "','" + denomination + "','" + denomination + "','" + now.Date.ToString("yyyy-MM-dd") + "')");
            g.ExcecuteNonQuery("Insert into DepositorLtable(CIF,D_loaneligible,D_loandate,D_loanlastpay,D_accno,D_status,D_loanreturn,D_loanbal) values('" + cif + "','false','" + now.Date.ToString("yyyy-MM-dd") + "','0','" + tempID3 + "','true','0','0')");
        }
        public void LoadDepositor(string id)
        {
            a.ExcecuteQuery("Select * from DepositorPtable where CIF='" + id + "'");
            if (a.DT.Rows.Count != 0)
            {
                CIF = a.DT.Rows[0][0].ToString();
                name = a.DT.Rows[0][1].ToString();
                housename = a.DT.Rows[0][2].ToString();
                place = a.DT.Rows[0][3].ToString();
                post = a.DT.Rows[0][4].ToString();
                pin = a.DT.Rows[0][5].ToString();
                dob = Convert.ToDateTime(a.DT.Rows[0][6].ToString()).Date.ToString();
                aadhar = a.DT.Rows[0][7].ToString();
                phone = a.DT.Rows[0][8].ToString();
                pan = a.DT.Rows[0][9].ToString();
                status = Convert.ToBoolean(a.DT.Rows[0][10].ToString());

            }
           
                

            b.ExcecuteQuery("Select * from DepositorAtable where CIF='" + id + "'");
            if (b.DT.Rows.Count != 0)
            {
                for (i = 0; i < b.DT.Rows.Count; i++)
                {
                    //accno[i] = b.DT.Rows[i][3].ToString();
                    //doj[i] = Convert.ToDateTime(b.DT.Rows[i][2].ToString());
                    //lastpay[i] = Convert.ToDouble(b.DT.Rows[i][4].ToString());
                    //lpdate[i] = Convert.ToDateTime(b.DT.Rows[i][5].ToString());
                    //matdate[i] = Convert.ToDateTime(b.DT.Rows[i][6].ToString());
                    //nomineee[i] = b.DT.Rows[i][7].ToString();
                    //relation[i] = b.DT.Rows[i][8].ToString();
                    //totamt[i] = Convert.ToDouble(b.DT.Rows[i][9].ToString());
                    //duedate[i] = Convert.ToDateTime(b.DT.Rows[i][11].ToString());
                    //duepay[i] = Convert.ToDouble(b.DT.Rows[i][10].ToString());
                    //nopay[i] = Convert.ToInt32(b.DT.Rows[i][12].ToString());
                    //agentid[i] = b.DT.Rows[i][13].ToString();
                }
            }
        }
    }
}