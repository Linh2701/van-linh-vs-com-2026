using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BaiTH2_asp_
{
    public partial class bai3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Tạo danh sách sản phẩm
                List<Product> danhSach = new List<Product>();

                // Lưu vào ViewState
                ViewState["DanhSach"] = danhSach;

                // Hiển thị danh sách
                HienThiSanPham();
            }
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            if (txtTenSP.Text.Trim() == "")
            {
                lblThongBao.Text = "Vui lòng nhập tên sản phẩm!";
                lblThongBao.ForeColor = System.Drawing.Color.Red;
                return;
            }

            decimal gia;

            if (!decimal.TryParse(txtGia.Text, out gia))
            {
                lblThongBao.Text = "Giá sản phẩm không hợp lệ!";
                lblThongBao.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (txtDanhMuc.Text.Trim() == "")
            {
                lblThongBao.Text = "Vui lòng nhập danh mục!";
                lblThongBao.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Lấy danh sách từ ViewState
            List<Product> danhSach =
                (List<Product>)ViewState["DanhSach"];

            // Tạo mã sản phẩm
            int maSP = danhSach.Count + 1;

            // Tạo sản phẩm
            Product sanPham = new Product();

            sanPham.ProductID = maSP;
            sanPham.ProductName = txtTenSP.Text;
            sanPham.Price = gia;
            sanPham.Category = txtDanhMuc.Text;

            // Thêm vào danh sách
            danhSach.Add(sanPham);

            // Lưu lại ViewState
            ViewState["DanhSach"] = danhSach;

            // Hiển thị lại GridView
            HienThiSanPham();

            // Thông báo
            lblThongBao.Text = "Thêm sản phẩm thành công!";
            lblThongBao.ForeColor = System.Drawing.Color.Green;

            // Xóa ô nhập
            txtTenSP.Text = "";
            txtGia.Text = "";
            txtDanhMuc.Text = "";
        }


        private void HienThiSanPham()
        {
            List<Product> danhSach =
                (List<Product>)ViewState["DanhSach"];

            gvSanPham.DataSource = danhSach;
            gvSanPham.DataBind();
        }


        protected void btnSua_Click(object sender, EventArgs e)
        {
            if (gvSanPham.SelectedIndex == -1)
            {
                lblThongBao.Text = "Vui lòng chọn sản phẩm cần sửa!";
                lblThongBao.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Kiểm tra tên
            if (txtTenSP.Text.Trim() == "")
            {
                lblThongBao.Text = "Vui lòng nhập tên sản phẩm!";
                lblThongBao.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Kiểm tra giá
            decimal gia;

            if (!decimal.TryParse(txtGia.Text, out gia))
            {
                lblThongBao.Text = "Giá sản phẩm không hợp lệ!";
                lblThongBao.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Kiểm tra danh mục
            if (txtDanhMuc.Text.Trim() == "")
            {
                lblThongBao.Text = "Vui lòng nhập danh mục!";
                lblThongBao.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Lấy mã sản phẩm đang chọn
            int maSP = Convert.ToInt32(
                gvSanPham.DataKeys[gvSanPham.SelectedIndex].Value
            );

            // Lấy danh sách
            List<Product> danhSach =
                (List<Product>)ViewState["DanhSach"];

            // Tìm sản phẩm
            Product sanPham =
                danhSach.Find(p => p.ProductID == maSP);

            // Cập nhật
            if (sanPham != null)
            {
                sanPham.ProductName = txtTenSP.Text;
                sanPham.Price = gia;
                sanPham.Category = txtDanhMuc.Text;
            }

            // Lưu lại ViewState
            ViewState["DanhSach"] = danhSach;

            // Hiển thị lại
            HienThiSanPham();

            // Thông báo
            lblThongBao.Text = "Cập nhật sản phẩm thành công!";
            lblThongBao.ForeColor = System.Drawing.Color.Green;

            // Xóa ô nhập
            txtTenSP.Text = "";
            txtGia.Text = "";
            txtDanhMuc.Text = "";

            // Bỏ chọn dòng
            gvSanPham.SelectedIndex = -1;
        }


        protected void gvSanPham_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Lấy mã sản phẩm đang chọn
            int maSP = Convert.ToInt32(
                gvSanPham.DataKeys[gvSanPham.SelectedIndex].Value
            );

            // Lấy danh sách từ ViewState
            List<Product> danhSach =
                (List<Product>)ViewState["DanhSach"];

            // Tìm sản phẩm
            Product sanPham =
                danhSach.Find(p => p.ProductID == maSP);

            // Hiển thị thông tin lên TextBox
            if (sanPham != null)
            {
                txtTenSP.Text = sanPham.ProductName;
                txtGia.Text = sanPham.Price.ToString();
                txtDanhMuc.Text = sanPham.Category;
            }
        }


        // THÊM MỚI: Cho phép click trực tiếp vào dòng
        protected void gvSanPham_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] =
                    Page.ClientScript.GetPostBackClientHyperlink(
                        gvSanPham,
                        "Select$" + e.Row.RowIndex);

                e.Row.Style["cursor"] = "pointer";
            }
        }

        protected override void Render(HtmlTextWriter writer)
        {
            for (int i = 0; i < gvSanPham.Rows.Count; i++)
            {
                Page.ClientScript.RegisterForEventValidation(
                    gvSanPham.UniqueID,
                    "Select$" + i);
            }

            base.Render(writer);
        }
    }
}