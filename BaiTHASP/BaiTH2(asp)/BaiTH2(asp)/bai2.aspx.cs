using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BaiTH2_asp_
{
    public partial class bai2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (!fuHinh.HasFile)
            {
                lblThongBao.Text = "Vui lòng chọn ảnh!";
                lblThongBao.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Lấy phần mở rộng của file
            string duoiFile = Path.GetExtension(fuHinh.FileName).ToLower();

            // Các định dạng ảnh được phép
            string[] fileHopLe = { ".jpg", ".jpeg", ".png", ".gif" };

            // Kiểm tra định dạng
            if (Array.IndexOf(fileHopLe, duoiFile) == -1)
            {
                lblThongBao.Text = "Chỉ được upload file .jpg, .jpeg, .png, .gif";
                lblThongBao.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Đường dẫn thư mục Images
            string thuMuc = Server.MapPath("~/Images/");

            // Tạo thư mục nếu chưa có
            if (!Directory.Exists(thuMuc))
            {
                Directory.CreateDirectory(thuMuc);
            }

            // Đường dẫn lưu file
            string tenFile = Path.GetFileName(fuHinh.FileName);
            string duongDan = Path.Combine(thuMuc, tenFile);

            // Lưu ảnh vào thư mục Images
            fuHinh.SaveAs(duongDan);

            // Hiển thị ảnh
            imgHinh.ImageUrl = "~/Images/" + tenFile;
            imgHinh.Visible = true;

            // Thông báo thành công
            lblThongBao.Text = "Upload thành công!";
            lblThongBao.ForeColor = System.Drawing.Color.Green;
        
    }
    }
}