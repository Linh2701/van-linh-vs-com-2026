<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Quanlysach.aspx.cs" Inherits="BaiTH2_asp_.Quanlysach" ValidateRequest="false" %>

<%@ Register Src="~/Ckeditor.ascx" TagPrefix="uc1" TagName="Ckeditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet"
      href="CKEditor/ckeditor5/ckeditor5.css" />
     <style>
        .qlsach {
            padding: 15px;
        }

        .qlsach h2 {
            text-align: center;
            color: #0066cc;
        }

        .form-sach {
            width: 100%;
        }

        .form-sach td {
            padding: 6px;
        }

        .form-sach .label {
            width: 120px;
            font-weight: bold;
        }

        .form-sach input[type=text],
        .form-sach input[type=number],
        .form-sach textarea,
        .form-sach select {
            width: 250px;
            padding: 5px;
        }

        .btn {
            padding: 6px 15px;
            margin-right: 5px;
        }

        .grid {
            width: 100%;
            margin-top: 20px;
        }

        .grid th {
            background-color: #0066a1;
            color: white;
            padding: 7px;
        }

        .grid td {
            padding: 6px;
        }
        .ck-editor {
    width: 500px !important;
}

.ck-editor__editable {
    height: 100px !important;
    max-height: 100px !important;
    overflow-y: auto !important;
    overflow-x: hidden !important;
    overflow-wrap: anywhere;
}

        .mo-ta-ngan {
    max-width: 400px;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
}

.mo-ta-ngan.mo-ta-day-du {
    display: block;
    overflow: visible;
}

.btn-xem-them {
    border: none;
    background: none;
    color: #0d6efd;
    cursor: pointer;
    padding: 3px 0;
    font-size: 14px;
}

.btn-xem-them:hover {
    text-decoration: underline;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="qlsach">

        <h2>QUẢN LÝ SÁCH</h2>

        <table class="form-sach">
            <tr>
    <td class="label">Mã sách:</td>
    <td>
        <asp:TextBox ID="txtMaSach" runat="server" ReadOnly="true"></asp:TextBox>
    </td>
</tr>
            <tr>
                <td class="label">Tên sách:</td>
                <td>
                    <asp:TextBox ID="txtTenSach" runat="server"></asp:TextBox>
                </td>

                <td class="label">Tác giả:</td>
                <td>
                    <asp:TextBox ID="txtTacGia" runat="server"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td class="label">Giá:</td>
                <td>
                    <asp:TextBox ID="txtGia" runat="server"></asp:TextBox>
                </td>

                <td class="label">Số lượng:</td>
                <td>
                    <asp:TextBox ID="txtSoLuong" runat="server"></asp:TextBox>
                </td>
            </tr>

          <tr>
    <td class="label">Mô tả:</td>
    <td>
     <uc1:Ckeditor runat="server" ID="Ckeditor" />
    </td>
   

    <td class="label">Ảnh sách:</td>
   <td>
    <asp:FileUpload ID="fuAnh" runat="server" />
    <br /><br />

    <asp:Button ID="btnUpload" runat="server"
        Text="Upload ảnh"
        CssClass="btn"
        OnClick="btnUpload_Click" />

    <br /><br />

    <asp:Label ID="lblAnh" runat="server"
        ForeColor="Green"></asp:Label>

    <br />

    <asp:Image ID="imgAnh" runat="server"
        Width="120px"
        Height="150px"
        Visible="false" />
</td>
</tr>


            <tr>
                <td class="label">Mã loại:</td>
                <td>
                    <asp:DropDownList ID="ddlMaLoai" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td></td>
                <td colspan="3">

                    <asp:Button ID="btnThem" runat="server"
                        Text="Thêm"
                        CssClass="btn"
                        OnClick="btnThem_Click" />

                    <asp:Button ID="btnSua" runat="server"
                        Text="Sửa"
                        CssClass="btn"
                        OnClick="btnSua_Click" />

                    <asp:Button ID="btnXoa" runat="server"
                        Text="Xóa"
                        CssClass="btn"
                        OnClick="btnXoa_Click" />

                    <asp:Button ID="btnHuy" runat="server"
                        Text="Hủy"
                        CssClass="btn"
                        OnClick="btnHuy_Click" />

                </td>
            </tr>

        </table>


        <asp:GridView ID="gvSach" runat="server"
            CssClass="grid"
            AutoGenerateColumns="False"
            DataKeyNames="MaSach"
            OnSelectedIndexChanged="gvSach_SelectedIndexChanged" AllowPaging="True" PageSize="5" OnPageIndexChanging="gvSach_PageIndexChanging">

            <Columns>

                <asp:BoundField DataField="MaSach"
                    HeaderText="Mã sách" />

                <asp:BoundField DataField="TenSach"
                    HeaderText="Tên sách" />

                <asp:BoundField DataField="TacGia"
                    HeaderText="Tác giả" />

                <asp:BoundField DataField="Gia"
                    HeaderText="Giá" />

                <asp:BoundField DataField="SoLuong"
                    HeaderText="Số lượng" />

             <asp:TemplateField HeaderText="Mô tả">
            <ItemTemplate>
        <div class="mo-ta-ngan">
            <asp:Literal ID="litMoTa" runat="server"
                Text='<%# Eval("MoTa") %>'
                Mode="PassThrough">
            </asp:Literal>
            </div>

        <button type="button"
                class="btn-xem-them"
                onclick="xemThem(this)">
            Xem thêm
        </button>
    </ItemTemplate>
</asp:TemplateField>

                <asp:BoundField DataField="TenFileAnh"
                    HeaderText="Tên file ảnh" />

                <asp:BoundField DataField="MaLoai"
                    HeaderText="Mã loại" />

                <asp:CommandField ShowSelectButton="true"
                    SelectText="Chọn" />

            </Columns>

        </asp:GridView>

    </div>
    <script>
        function xemThem(button) {
            var moTa = button.previousElementSibling;

            if (moTa.classList.contains("mo-ta-day-du")) {
                moTa.classList.remove("mo-ta-day-du");
                button.innerText = "Xem thêm";
            } else {
                moTa.classList.add("mo-ta-day-du");
                button.innerText = "Thu gọn";
            }
        }
    </script>
</asp:Content>

