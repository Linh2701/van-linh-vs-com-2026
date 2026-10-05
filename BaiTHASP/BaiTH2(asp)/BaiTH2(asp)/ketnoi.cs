using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace BaiTH2_asp_
{
    public class ketnoi
    {
        public SqlConnection con;
        public SqlCommand cmd;
        public SqlDataAdapter da;
        public string chuoikn = @"Data Source=DESKTOP-DH53G5E\SQLEXPRESS;Initial Catalog=QLSach2026;Integrated Security=True";

        public void open()
        {
            con = new SqlConnection(chuoikn);
            con.Open();
        }

        public void close()
        {
            con.Close();
        }

       public DataTable GetTable(string sql)
        {
            cmd = new SqlCommand(sql, con);
            da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        public void Execute(string sql)
        {
            cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
        }


    }
}