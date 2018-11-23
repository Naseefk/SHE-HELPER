using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace SHe_Helper
{
    public class Agent
    {
        public double effectiveAllowance;
        public double effectiveCommision;
        public double totalAmount;
        Random random = new Random();
        public string id;
        string name;
        string housename;
        string place;
        string post;
        string pin;
        double contact;
        DateTime dob;
        bool status;
        string email;
        string postOffice;
        string block;
        DateTime doj;

        DBCON a = new DBCON();
        DBCON b = new DBCON();
        salary objSalary = new salary();
        
      
        public bool checkUsername(string username)
        {
            a.ExcecuteQuery("Select * from UserTable where usrname='" + username + "'");
            if (a.DT.Rows.Count == 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
       

        public void addAgent(string username, string pass, string name, string housename, string place, string post, string pin, string dob, bool status, string email, string phone, string postOffice, string dist, string block, string qe)
        {
            string tempID2 = "";
            b.ExcecuteQuery("select isnull(max(dbo.udf_GetNumeric(Agent_id)),0)+1 from AgentTable");
            if (b.DT.Rows.Count > 0)
            {
                int tempID = Convert.ToInt32(b.DT.Rows[0][0].ToString());
                tempID2 = tempID.ToString("0000");
                tempID2 = "MLP-" + tempID2;
            }

            a.ExcecuteNonQuery("Insert into UserTable values('','" + tempID2 + "','" + username + "','" + pass + "')");
            a.ExcecuteNonQuery("Insert into AgentTable values('" + tempID2 + "','" + name + "','" + housename + "','" + phone + "','" + dob + "','" + status + "','" + email + "','" + postOffice + "','" + block + "','" + DateTime.Today.ToString("yyyy-MM-dd") + "','0','" + dist + "','" + qe + "','" + username + "','" + place + "','" + post + "','" + pin + "')");

        }

        public void calculateSalary(string agentid)
        {
            double temp1;
            double temp2;
            double temp3;
            double temp4;

            b.ExcecuteQuery("select sum(0+total) from ScheduleTable where agent_id='" + agentid + "'");
            totalAmount = Convert.ToDouble(b.DT.Rows[0][0]);
            objSalary.retrieve();

            double tempAmount = totalAmount;

            if (tempAmount >= objSalary.limit)
            {
                tempAmount = objSalary.limit;
            }
            temp1 = tempAmount * (objSalary.allowance / 100);
            temp2 = temp1 * (objSalary.tax / 100);
            effectiveAllowance = temp1 - temp2;

            temp3 = totalAmount * (objSalary.commission / 100);
            temp4 = temp3 * (objSalary.tax / 100);
            effectiveCommision = temp3 - temp4;

        }
        DBCON c = new DBCON();
        public void getAgent(string agentid)
        {
            c.ExcecuteQuery("select * from AgentTable where Agent_id='" + agentid + "'");
            if (c.DT.Rows.Count > 0)
            {
                name = c.DT.Rows[0][1].ToString();
                housename = c.DT.Rows[0][2].ToString();
                place = c.DT.Rows[0][14].ToString();
                post = c.DT.Rows[0][15].ToString();
                pin = c.DT.Rows[0][16].ToString();
                contact = Convert.ToDouble(c.DT.Rows[0][3].ToString());
                dob = Convert.ToDateTime(c.DT.Rows[0][4].ToString());
               
                status = Convert.ToBoolean(c.DT.Rows[0][5].ToString());
                email = c.DT.Rows[0][6].ToString();
                postOffice = c.DT.Rows[0][7].ToString();
                block = c.DT.Rows[0][8].ToString();
                doj = Convert.ToDateTime(c.DT.Rows[0][9].ToString());
            }
            else
            {
                throw new Exception("No Agent with the given agentid");
            }
        }



    }

}