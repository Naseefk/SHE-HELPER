using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SHe_Helper
{
    public class Loans
    {


        DBCON a = new DBCON();
        DBCON b = new DBCON();
        public string CIF;
        public string name;
        public string denomination;
        public DateTime doj;
        public DateTime lpdate;
        public string totalamount;
        public void retrieve(string accno)
        {
            a.ExcecuteQuery("select * from DepositorAtable where D_accno='" + accno + "' ");

            //CIF = a.DT.Rows[0][0].ToString();
             denomination = a.DT.Rows[0][1].ToString();
            //doj = Convert.ToDateTime(a.DT.Rows[0][2].ToString());
            //lpdate = Convert.ToDateTime(a.DT.Rows[0][5].ToString());
            //totalamount = a.DT.Rows[0][7].ToString();

            //b.ExcecuteQuery("select D_name from DepositorPtable where CIF='" + CIF + "' ");
            //name = b.DT.Rows[0][0].ToString();
        }
        public bool isEligible()
        {
            double temp1;
            temp1 = Convert.ToDouble(denomination) * 12;
            if (temp1 >= Convert.ToDouble(totalamount))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

    }
}