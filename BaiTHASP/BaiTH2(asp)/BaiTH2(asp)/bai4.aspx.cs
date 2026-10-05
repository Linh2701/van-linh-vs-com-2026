using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BaiTH2_asp_
{
    public partial class bai4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Student> danhSach = new List<Student>();

                ViewState["DanhSach"] = danhSach;

                HienThiSinhVien(danhSach);
            }
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            if (txtHoTen.Text.Trim() == "")
            {
                lblThongBao.Text = "Vui lòng nhập họ tên!";
                lblThongBao.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (txtEmail.Text.Trim() == "")
            {
                lblThongBao.Text = "Vui lòng nhập email!";
                lblThongBao.ForeColor = System.Drawing.Color.Red;
                return;
            }

            if (!fuAnh.HasFile)
            {
                lblThongBao.Text = "Vui lòng chọn ảnh!";
                lblThongBao.ForeColor = System.Drawing.Color.Red;
                return;
            }


            // Lấy danh sách từ ViewState
            List<Student> danhSach =
                (List<Student>)ViewState["DanhSach"];


            // Tạo mã sinh viên
            int maSV = danhSach.Count + 1;


            // Tạo thư mục lưu ảnh
            string thuMuc = Server.MapPath("~/Images/Students/");

            if (!Directory.Exists(thuMuc))
            {
                Directory.CreateDirectory(thuMuc);
            }


            // Lấy tên file
            string tenFile = Path.GetFileName(fuAnh.FileName);


            // Đường dẫn lưu ảnh
            string duongDan = Path.Combine(thuMuc, tenFile);


            // Lưu ảnh
            fuAnh.SaveAs(duongDan);


            // Tạo đối tượng Student
            Student sinhVien = new Student();

            sinhVien.StudentID = maSV;
            sinhVien.FullName = txtHoTen.Text;
            sinhVien.Email = txtEmail.Text;
            sinhVien.ImagePath = "~/Images/Students/" + tenFile;


            // Thêm vào danh sách
            danhSach.Add(sinhVien);


            // Lưu lại ViewState
            ViewState["DanhSach"] = danhSach;


            // Hiển thị danh sách
            HienThiSinhVien(danhSach);


            // Thông báo
            lblThongBao.Text = "Thêm sinh viên thành công!";
            lblThongBao.ForeColor = System.Drawing.Color.Green;


            // Xóa ô nhập
            XoaForm();
        }

        protected void btnSua_Click(object sender, EventArgs e)
        {
            if (gvSinhVien.SelectedIndex == -1)
            {
                lblThongBao.Text =
                    "Vui lòng chọn sinh viên cần sửa!";

                lblThongBao.ForeColor =
                    System.Drawing.Color.Red;

                return;
            }


            if (txtHoTen.Text.Trim() == "")
            {
                lblThongBao.Text =
                    "Vui lòng nhập họ tên!";

                lblThongBao.ForeColor =
                    System.Drawing.Color.Red;

                return;
            }


            if (txtEmail.Text.Trim() == "")
            {
                lblThongBao.Text =
                    "Vui lòng nhập email!";

                lblThongBao.ForeColor =
                    System.Drawing.Color.Red;

                return;
            }


            // Lấy mã sinh viên
            int maSV = Convert.ToInt32(
                gvSinhVien.DataKeys[gvSinhVien.SelectedIndex].Value
            );


            // Lấy danh sách
            List<Student> danhSach =
                (List<Student>)ViewState["DanhSach"];


            // Tìm sinh viên
            Student sinhVien =
                danhSach.Find(s => s.StudentID == maSV);


            if (sinhVien != null)
            {
                // Cập nhật họ tên
                sinhVien.FullName = txtHoTen.Text;

                // Cập nhật email
                sinhVien.Email = txtEmail.Text;


                // Nếu chọn ảnh mới
                if (fuAnh.HasFile)
                {
                    string thuMuc =
                        Server.MapPath("~/Images/Students/");

                    if (!Directory.Exists(thuMuc))
                    {
                        Directory.CreateDirectory(thuMuc);
                    }


                    string tenFile =
                        Path.GetFileName(fuAnh.FileName);


                    string duongDan =
                        Path.Combine(thuMuc, tenFile);


                    fuAnh.SaveAs(duongDan);


                    sinhVien.ImagePath =
                        "~/Images/Students/" + tenFile;
                }
            }


            // Lưu ViewState
            ViewState["DanhSach"] = danhSach;


            // Hiển thị lại
            HienThiSinhVien(danhSach);


            lblThongBao.Text =
                "Cập nhật sinh viên thành công!";

            lblThongBao.ForeColor =
                System.Drawing.Color.Green;


            XoaForm();

            gvSinhVien.SelectedIndex = -1;
        }

        protected void btnHienTatCa_Click(object sender, EventArgs e)
        {
            List<Student> danhSach =
               (List<Student>)ViewState["DanhSach"];

            HienThiSinhVien(danhSach);

            txtTimKiem.Text = "";

            lblThongBao.Text = "";
        }

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            string tuKhoa =
                txtTimKiem.Text.Trim().ToLower();


            List<Student> danhSach =
                (List<Student>)ViewState["DanhSach"];


            List<Student> ketQua =
                danhSach.FindAll(s =>
                    s.FullName.ToLower().Contains(tuKhoa)
                    ||
                    s.Email.ToLower().Contains(tuKhoa)
                );


            HienThiSinhVien(ketQua);


            lblThongBao.Text =
                "Tìm thấy " + ketQua.Count + " sinh viên.";

            lblThongBao.ForeColor =
                System.Drawing.Color.Blue;
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            if (gvSinhVien.SelectedIndex == -1)
            {
                lblThongBao.Text =
                    "Vui lòng chọn sinh viên cần xóa!";

                lblThongBao.ForeColor =
                    System.Drawing.Color.Red;

                return;
            }


            // Lấy mã sinh viên
            int maSV = Convert.ToInt32(
                gvSinhVien.DataKeys[gvSinhVien.SelectedIndex].Value
            );


            // Lấy danh sách
            List<Student> danhSach =
                (List<Student>)ViewState["DanhSach"];


            // Tìm sinh viên
            Student sinhVien =
                danhSach.Find(s => s.StudentID == maSV);


            if (sinhVien != null)
            {
                danhSach.Remove(sinhVien);
            }


            // Lưu lại ViewState
            ViewState["DanhSach"] = danhSach;


            // Hiển thị lại
            HienThiSinhVien(danhSach);


            lblThongBao.Text =
                "Xóa sinh viên thành công!";

            lblThongBao.ForeColor =
                System.Drawing.Color.Green;


            XoaForm();

            gvSinhVien.SelectedIndex = -1;
        }
        private void HienThiSinhVien(List<Student> danhSach)
        {
            gvSinhVien.DataSource = danhSach;
            gvSinhVien.DataBind();
        }
        private void XoaForm()
        {
            txtHoTen.Text = "";
            txtEmail.Text = "";
        }

        protected void gvSinhVien_SelectedIndexChanged(object sender, EventArgs e)
        {
            int maSV = Convert.ToInt32(
        gvSinhVien.DataKeys[gvSinhVien.SelectedIndex].Value
    );

            List<Student> danhSach =
                (List<Student>)ViewState["DanhSach"];

            Student sinhVien =
                danhSach.Find(s => s.StudentID == maSV);

            if (sinhVien != null)
            {
                txtHoTen.Text = sinhVien.FullName;
                txtEmail.Text = sinhVien.Email;

                lblThongBao.Text =
                    "Đã chọn sinh viên: " + sinhVien.FullName;

                lblThongBao.ForeColor =
                    System.Drawing.Color.Blue;
            }
        }
        protected void gvSinhVien_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton btnChon =
                    (LinkButton)e.Row.FindControl("btnChon");

                if (btnChon != null)
                {
                    e.Row.Attributes["onclick"] =
                        "document.getElementById('" +
                        btnChon.ClientID +
                        "').click();";

                    e.Row.Style["cursor"] = "pointer";
                }
            }
        }
    }
}