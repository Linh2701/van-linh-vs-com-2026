using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BaiTH2_asp_
{
    public partial class bai1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblKetQua.Text = "Giá trị lấy từ ViewState:";
            }
        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {
            ViewState["Ten"] = txtTen.Text;

            // Hiển thị tên từ ViewState
            lblKetQua.Text = "Giá trị lấy từ ViewState: "
                           + ViewState["Ten"].ToString();
        }

        protected void btnPostBack_Click(object sender, EventArgs e)
        {

        }
    }
}