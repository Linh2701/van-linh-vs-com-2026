using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BaiTH2_asp_
{
    public partial class Quanlysach : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                load();
            }
        }
        public void load()
        {
            ketnoi kn = new ketnoi();
            kn.open();
            gvSach.DataSource = kn.GetTable("select * from Sach");
            gvSach.DataBind();
            ddlMaLoai.DataSource = kn.GetTable("select * from TheLoai");
            ddlMaLoai.DataTextField = "TenLoai";
            ddlMaLoai.DataValueField = "MaLoai";
            ddlMaLoai.DataBind();
            kn.close();

        }

        protected void btnThem_Click(object sender, EventArgs e)
        {

            ketnoi kn = new ketnoi();
            kn.open();

            DataTable dt = kn.GetTable("select isnull(max(MaSach), 0) + 1 as MaMoi from Sach");
            int maSach = Convert.ToInt32(dt.Rows[0]["MaMoi"]);

            string sql = "insert into Sach values(" +
                         maSach + ",N'" +
                         txtTenSach.Text + "','" +
                         txtTacGia.Text + "','" +
                         txtGia.Text + "','" +
                         txtSoLuong.Text + "',N'" +
                         Ckeditor.Value + "',N'" +
                         lblAnh.Text + "','" +
                         ddlMaLoai.SelectedValue + "')";

            kn.Execute(sql);
            kn.close();

            load();
        }

        protected void gvSach_SelectedIndexChanged(object sender, EventArgs e)
        {
            int t = gvSach.SelectedIndex;
            txtMaSach.Text = gvSach.Rows[t].Cells[0].Text;
            txtTenSach.Text =HttpUtility.HtmlDecode(gvSach.Rows[t].Cells[1].Text);
            txtTacGia.Text = gvSach.Rows[t].Cells[2].Text;
            txtGia.Text = gvSach.Rows[t].Cells[3].Text;
            txtSoLuong.Text = gvSach.Rows[t].Cells[4].Text;
            Ckeditor.Value = HttpUtility.HtmlDecode(gvSach.Rows[t].Cells[5].Text);
            lblAnh.Text = gvSach.Rows[t].Cells[6].Text;
            ddlMaLoai.SelectedValue = gvSach.Rows[t].Cells[7].Text;

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (fuAnh.HasFile)
            {
                string tenfile = Path.GetFileName(fuAnh.FileName);

                string duongdan = Server.MapPath("~/Images/" + tenfile);

                fuAnh.SaveAs(duongdan);

                lblAnh.Text = tenfile;

                imgAnh.ImageUrl = "~/Images/" + tenfile;
                imgAnh.Visible = true;
            }
            else
            {
                lblAnh.Text = "Vui lòng chọn ảnh!";
                imgAnh.Visible = false;
            }
        }

        protected void btnSua_Click(object sender, EventArgs e)
        {

            string sql = "update Sach set " +
                 "TenSach=N'" + txtTenSach.Text + "'," +
                 "TacGia=N'" + txtTacGia.Text + "'," +
                 "Gia='" + txtGia.Text + "'," +
                 "SoLuong='" + txtSoLuong.Text + "'," +
                 "MoTa=N'" + Ckeditor.Value + "'," +
                 "TenFileAnh=N'" + lblAnh.Text + "'," +
                 "MaLoai='" + ddlMaLoai.SelectedValue + "' " +
                 "where MaSach=" + txtMaSach.Text;

            ketnoi kn = new ketnoi();
            kn.open();
            kn.Execute(sql);
            kn.close();

            load();
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            string sql = "delete from Sach where MaSach=" + txtMaSach.Text;

            ketnoi kn = new ketnoi();
            kn.open();
            kn.Execute(sql);
            kn.close();

            load();

            txtMaSach.Text = "";
            txtTenSach.Text = "";
            txtTacGia.Text = "";
            txtGia.Text = "";
            txtSoLuong.Text = "";
            Ckeditor.Value = "";
            lblAnh.Text = "";
            imgAnh.Visible = false;
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {

        }

        protected void gvSach_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSach.PageIndex = e.NewPageIndex;
            load();
        }
    }
}