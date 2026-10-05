using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BaiTH2_asp_
{
    public partial class Trangdangnhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
            string tenDangNhap = txtTenDangNhap.Text.Trim();
            string matKhau = txtMatKhau.Text.Trim();

            string chuoiKetNoi =
                @"Data Source=DESKTOP-DH53G5E\SQLEXPRESS;
                  Initial Catalog=QLSach2026;
                  Integrated Security=True";

            using (SqlConnection conn =
                new SqlConnection(chuoiKetNoi))
            {
                string sql = @"SELECT COUNT(*)
                               FROM TaiKhoan
                               WHERE TenDangNhap = @TenDangNhap
                               AND MatKhau = @MatKhau";

                SqlCommand cmd = new SqlCommand(sql, conn);

                cmd.Parameters.AddWithValue(
                    "@TenDangNhap", tenDangNhap);

                cmd.Parameters.AddWithValue(
                    "@MatKhau", matKhau);

                conn.Open();

                int ketqua = (int)cmd.ExecuteScalar();

                if (ketqua > 0)
                {
                    Session["TenDangNhap"] = tenDangNhap;

                    Response.Redirect("Quanlysach.aspx");
                }
                else
                {
                    lblThongBao.Text =
                        "Tên đăng nhập hoặc mật khẩu không đúng!";
                }
            }
        }
    }
}