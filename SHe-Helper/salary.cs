using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SHe_Helper
{

    public class salary
    {
        public double allowance;
        public double tax;
        public double commission;
        public double interest;
        public double limit;
        DBCON a = new DBCON();

        public void retrieve()
        {
            a.ExcecuteQuery("select * from AdminTable ");

            allowance = Convert.ToDouble(a.DT.Rows[0][0]);
            tax = Convert.ToDouble(a.DT.Rows[0][1]);
            commission = Convert.ToDouble(a.DT.Rows[0][2]);
            interest = Convert.ToDouble(a.DT.Rows[0][4]);
            limit = Convert.ToDouble(a.DT.Rows[0][3]);

        }
        public void update(double allowance, double tax, double commission, double interest, double limit)
        {
            a.ExcecuteNonQuery("update AdminTable set allowance=" + allowance + ", tax=" + tax + ", commission=" + commission + ", interest=" + interest + ", limit=" + limit + " ");
        }

    }
}