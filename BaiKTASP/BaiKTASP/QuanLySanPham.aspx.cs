using System;
using System.Data;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BaiKTASP
{
    public partial class QuanLySanPham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadLoai();
                load();
            }
        }

        public void LoadLoai()
        {
            kn db = new kn();
            db.open();

            ddlLoai.DataSource = db.GetTable("SELECT * FROM TheLoai");
            ddlLoai.DataTextField = "TenLoai";
            ddlLoai.DataValueField = "Maloai";
            ddlLoai.DataBind();

            ddlTimLoai.DataSource = db.GetTable("SELECT * FROM TheLoai");
            ddlTimLoai.DataTextField = "TenLoai";
            ddlTimLoai.DataValueField = "Maloai";
            ddlTimLoai.DataBind();
            ddlTimLoai.Items.Insert(0, new ListItem("Tất cả thể loại", ""));

            db.close();
        }

        public void load()
        {
            string tim = txtTim.Text.Trim().Replace("'", "''");
            string loai = ddlTimLoai.SelectedValue.Replace("'", "''");

            string sql = "SELECT S.Masp, S.Tensp, S.Ngaynhap, S.Dongia, S.Anh, S.MaLoai, T.TenLoai " +
                         "FROM SanPham S INNER JOIN TheLoai T ON S.MaLoai = T.Maloai " +
                         "WHERE (S.Masp LIKE N'%" + tim + "%' OR S.Tensp LIKE N'%" + tim + "%') " +
                         "AND ('" + loai + "' = '' OR S.MaLoai = '" + loai + "') " +
                         "ORDER BY S.Masp";

            kn db = new kn();
            db.open();

            DataTable data = db.GetTable(sql);
            gvSanPham.DataSource = data;
            gvSanPham.DataBind();

            // Sau khi xóa, trang hiện tại có thể vượt quá số trang còn lại
            if (gvSanPham.PageCount > 0 && gvSanPham.PageIndex >= gvSanPham.PageCount)
            {
                gvSanPham.PageIndex = gvSanPham.PageCount - 1;
                gvSanPham.DataBind();
            }

            DataTable dt = db.GetTable("SELECT COUNT(*) AS Tong FROM SanPham");
            lblTongSo.Text = "Tổng số sản phẩm: " + dt.Rows[0]["Tong"].ToString();

            int tongTrang = gvSanPham.PageCount;
            if (tongTrang == 0)
                tongTrang = 1;

            lblSoTrang.Text = "Trang " + (gvSanPham.PageIndex + 1) + "/" + tongTrang;

            btnDau.Enabled = gvSanPham.PageIndex > 0;
            btnTruoc.Enabled = gvSanPham.PageIndex > 0;
            btnSau.Enabled = gvSanPham.PageIndex < gvSanPham.PageCount - 1;
            btnCuoi.Enabled = gvSanPham.PageIndex < gvSanPham.PageCount - 1;

            db.close();
        }

        protected void btnTim_Click(object sender, EventArgs e)
        {
            gvSanPham.PageIndex = 0;
            load();
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            XoaForm();

            lblTieuDe.Text = "Thêm sản phẩm";
            pnForm.Visible = true;

            kn db = new kn();
            db.open();

            DataTable dt = db.GetTable(
                "SELECT ISNULL(MAX(CAST(SUBSTRING(Masp, 3, 10) AS INT)), 0) + 1 AS MaMoi " +
                "FROM SanPham WHERE Masp LIKE 'SP%'");

            txtMasp.Text = "SP" + Convert.ToInt32(dt.Rows[0]["MaMoi"]).ToString("D3");

            db.close();
        }

        protected void gvSanPham_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string ma = e.CommandArgument.ToString().Replace("'", "''");

            if (e.CommandName == "Sua")
            {
                kn db = new kn();
                db.open();

                DataTable dt = db.GetTable(
                    "SELECT * FROM SanPham WHERE Masp = '" + ma + "'");

                if (dt.Rows.Count > 0)
                {
                    txtMasp.Text = dt.Rows[0]["Masp"].ToString();
                    txtTensp.Text = dt.Rows[0]["Tensp"].ToString();

                    if (dt.Rows[0]["Ngaynhap"] != DBNull.Value)
                    {
                        txtNgaynhap.Text = Convert.ToDateTime(
                            dt.Rows[0]["Ngaynhap"]).ToString("yyyy-MM-dd");
                    }
                    else
                    {
                        txtNgaynhap.Text = "";
                    }

                    txtDongia.Text = dt.Rows[0]["Dongia"].ToString();
                    ddlLoai.SelectedValue = dt.Rows[0]["MaLoai"].ToString();

                    lblTieuDe.Text = "Sửa sản phẩm";
                    lblThongBao.Text = "";
                    pnForm.Visible = true;
                }

                db.close();
            }
            else if (e.CommandName == "Xoa")
            {
                kn db = new kn();
                db.open();

                db.Execute("DELETE FROM SanPham WHERE Masp = '" + ma + "'");

                db.close();

                load();
            }
        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {
            string ma = txtMasp.Text.Trim().Replace("'", "''");
            string ten = txtTensp.Text.Trim().Replace("'", "''");
            string ngay = txtNgaynhap.Text.Trim();
            string dongiaText = txtDongia.Text.Trim();
            string maloai = ddlLoai.SelectedValue.Replace("'", "''");
            string anh = "";

            if (ten == "" || ngay == "" || dongiaText == "" || maloai == "")
            {
                lblThongBao.Text = "Vui lòng nhập đầy đủ thông tin.";
                return;
            }

            int dongia;
            if (!int.TryParse(dongiaText, out dongia) || dongia < 0)
            {
                lblThongBao.Text = "Đơn giá phải là số nguyên không âm.";
                return;
            }

            DateTime ngayNhap;
            if (!DateTime.TryParse(ngay, out ngayNhap))
            {
                lblThongBao.Text = "Ngày nhập không hợp lệ.";
                return;
            }
            string ngaySql = ngayNhap.ToString("yyyy-MM-dd");

            if (fileAnh.HasFile)
            {
                anh = Path.GetFileName(fileAnh.FileName);

                string duongDan = Server.MapPath("~/Images/");

                if (!Directory.Exists(duongDan))
                {
                    Directory.CreateDirectory(duongDan);
                }

                fileAnh.SaveAs(Path.Combine(duongDan, anh));
            }

            kn db = new kn();
            db.open();

            if (lblTieuDe.Text == "Thêm sản phẩm")
            {
                string sql = "INSERT INTO SanPham(Masp, Tensp, Ngaynhap, Dongia, Anh, MaLoai) VALUES(" +
                             "'" + ma + "', N'" + ten + "', '" + ngaySql + "', " +
                             dongia + ", '" + anh.Replace("'", "''") + "', '" + maloai + "')";

                db.Execute(sql);
            }
            else
            {
                string sql;

                if (anh != "")
                {
                    sql = "UPDATE SanPham SET Tensp = N'" + ten +
                          "', Ngaynhap = '" + ngaySql +
                          "', Dongia = " + dongia +
                          ", Anh = '" + anh.Replace("'", "''") +
                          "', MaLoai = '" + maloai +
                          "' WHERE Masp = '" + ma + "'";
                }
                else
                {
                    sql = "UPDATE SanPham SET Tensp = N'" + ten +
                          "', Ngaynhap = '" + ngaySql +
                          "', Dongia = " + dongia +
                          ", MaLoai = '" + maloai +
                          "' WHERE Masp = '" + ma + "'";
                }

                db.Execute(sql);
            }

            db.close();

            pnForm.Visible = false;
            gvSanPham.PageIndex = 0;
            load();
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            pnForm.Visible = false;
            XoaForm();
        }

        public void XoaForm()
        {
            txtMasp.Text = "";
            txtTensp.Text = "";
            txtNgaynhap.Text = "";
            txtDongia.Text = "";
            lblThongBao.Text = "";
        }

        protected void gvSanPham_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSanPham.PageIndex = e.NewPageIndex;
            load();
        }

        protected void btnDau_Click(object sender, EventArgs e)
        {
            gvSanPham.PageIndex = 0;
            load();
        }

        protected void btnTruoc_Click(object sender, EventArgs e)
        {
            if (gvSanPham.PageIndex > 0)
                gvSanPham.PageIndex--;

            load();
        }

        protected void btnSau_Click(object sender, EventArgs e)
        {
            if (gvSanPham.PageIndex < gvSanPham.PageCount - 1)
                gvSanPham.PageIndex++;

            load();
        }

        protected void btnCuoi_Click(object sender, EventArgs e)
        {
            gvSanPham.PageIndex = gvSanPham.PageCount - 1;

            if (gvSanPham.PageIndex < 0)
                gvSanPham.PageIndex = 0;

            load();
        }
    }
}