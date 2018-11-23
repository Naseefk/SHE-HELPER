using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SHe_Helper
{
    public class message
    {
        string from;
        string to;
        string text;
        bool flag = true;
        string id;
        DBCON a = new DBCON();

        public void sendMessage(string id,string to,string text) 
        {
            a.ExcecuteNonQuery("Insert into MessageTable values('"+id+"','" + to + "','" + text + "','true')");
        }

        public void readMessage()
        {
            flag = false;
            a.ExcecuteNonQuery("update MessageTable(flag) values('" + flag + "') where M_id='"+id+"'");
        }

        public void retieveMessage(string id)
        {
            a.ExcecuteQuery("Select * from MessageTable where [to]='" + id + "'");
            this.from = a.DT.Rows[0][0].ToString();
            this.to = a.DT.Rows[0][1].ToString();
            this.text = a.DT.Rows[0][2].ToString();
            this.flag = Convert.ToBoolean(a.DT.Rows[0][3].ToString());
            this.id = a.DT.Rows[0][4].ToString();

        }
    }
}