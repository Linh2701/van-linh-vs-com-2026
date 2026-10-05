using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BaiTH2_asp_
{
    public partial class Trangtheloai : System.Web.UI.Page
    {
        string chuoiKetNoi = @"Data Source=DESKTOP-DH53G5E\SQLEXPRESS;Initial Catalog=QLSach2026;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTheLoai();
            }
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            if (txtTenLoai.Text.Trim() == "")
            {
                lblThongBao.Text = "Vui lòng nhập tên loại!";
                return;
            }

            using (SqlConnection conn =
                new SqlConnection(chuoiKetNoi))
            {
                string sql =
                    "INSERT INTO TheLoai (TenLoai) VALUES (@TenLoai)";

                SqlCommand cmd =
                    new SqlCommand(sql, conn);

                cmd.Parameters.AddWithValue(
                    "@TenLoai",
                    txtTenLoai.Text.Trim());

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            lblThongBao.Text = "Thêm thành công!";

            XoaTrang();
            LoadTheLoai();

        }

        protected void btnSua_Click(object sender, EventArgs e)
        {
            if (txtMaLoai.Text == "")
            {
                lblThongBao.Text = "Vui lòng chọn thể loại cần sửa!";
                return;
            }

            if (txtTenLoai.Text.Trim() == "")
            {
                lblThongBao.Text = "Vui lòng nhập tên loại!";
                return;
            }

            using (SqlConnection conn =
                new SqlConnection(chuoiKetNoi))
            {
                string sql =
                    "UPDATE TheLoai SET TenLoai = @TenLoai " +
                    "WHERE MaLoai = @MaLoai";

                SqlCommand cmd =
                    new SqlCommand(sql, conn);

                cmd.Parameters.AddWithValue(
                    "@TenLoai",
                    txtTenLoai.Text.Trim());

                cmd.Parameters.AddWithValue(
                    "@MaLoai",
                    txtMaLoai.Text);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            lblThongBao.Text = "Sửa thành công!";

            XoaTrang();
            LoadTheLoai();
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
    if (txtMaLoai.Text == "")
    {
        lblThongBao.Text = "Vui lòng chọn thể loại cần xóa!";
        return;
    }

    try
    {
        using (SqlConnection conn =
            new SqlConnection(chuoiKetNoi))
        {
            string sql =
                "DELETE FROM TheLoai WHERE MaLoai = @MaLoai";

            SqlCommand cmd =
                new SqlCommand(sql, conn);

            cmd.Parameters.AddWithValue(
                "@MaLoai",
                txtMaLoai.Text);

            conn.Open();
            cmd.ExecuteNonQuery();
        }

        lblThongBao.Text = "Xóa thành công!";

        XoaTrang();
        LoadTheLoai();
    }
    catch
    {
        lblThongBao.Text =
            "Không thể xóa thể loại vì đang có sách thuộc thể loại này!";
    }
}

        protected void btnHuy_Click(object sender, EventArgs e)
        {

        }

        protected void gvTheLoai_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    void XoaTrang()
        {
        txtMaLoai.Text = "";
        txtTenLoai.Text = "";
        }
void LoadTheLoai()
{
    using (SqlConnection conn =
        new SqlConnection(chuoiKetNoi))
    {
        string sql = "SELECT * FROM TheLoai";

        SqlDataAdapter da =
            new SqlDataAdapter(sql, conn);

        DataTable dt = new DataTable();

        da.Fill(dt);

        gvTheLoai.DataSource = dt;
        gvTheLoai.DataBind();
    }
}
    }
}