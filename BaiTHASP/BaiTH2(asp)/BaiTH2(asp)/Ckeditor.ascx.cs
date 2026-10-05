using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BaiTH2_asp_
{
    public partial class Ckeditor : System.Web.UI.UserControl
    {
        public string Value
        {
            get
            {
                return txtMoTa.Text;
            }
            set
            {
                txtMoTa.Text = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtMoTa_TextChanged(object sender, EventArgs e)
        {

        }
    }
}