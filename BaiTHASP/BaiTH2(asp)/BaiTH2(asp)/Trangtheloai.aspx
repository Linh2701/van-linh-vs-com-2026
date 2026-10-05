<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Trangtheloai.aspx.cs" Inherits="BaiTH2_asp_.Trangtheloai" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style>
        .tieude {
            text-align: center;
            margin: 20px;
        }

        .form-theloai {
            width: 500px;
            margin: auto;
        }

        .form-theloai label {
            font-weight: bold;
        }

        .form-theloai input {
            width: 100%;
            padding: 8px;
            margin: 8px 0 15px 0;
            box-sizing: border-box;
        }

       .nut {
    padding: 7px 16px;
    margin-right: 6px;
    border: none;
    border-radius: 5px;
    font-size: 14px;
    cursor: pointer;
    color: white;
}

.btn-them {
    background-color: #198754;
}

.btn-sua {
    background-color: #0d6efd;
}

.btn-xoa {
    background-color: #dc3545;
}

.btn-huy {
    background-color: #6c757d;
}

.nut:hover {
    opacity: 0.85;
}

        .bang {
            width: 80%;
            margin: 30px auto;
            border-collapse: collapse;
        }

        .bang th {
            background-color: #006699;
            color: white;
            padding: 10px;
        }

        .bang td {
            padding: 8px;
            border: 1px solid #ccc;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <h2 class="tieude">QUẢN LÝ THỂ LOẠI</h2>

    <div class="form-theloai">

        <asp:Label ID="lblMaLoai"
            runat="server"
            Text="Mã loại:">
        </asp:Label>

        <asp:TextBox ID="txtMaLoai"
            runat="server"
            ReadOnly="true">
        </asp:TextBox>


        <asp:Label ID="lblTenLoai"
            runat="server"
            Text="Tên loại:">
        </asp:Label>

        <asp:TextBox ID="txtTenLoai"
            runat="server">
        </asp:TextBox>


        <asp:Button ID="btnThem"
    runat="server"
    Text="Thêm"
    CssClass="nut btn-them"
    OnClick="btnThem_Click" />

<asp:Button ID="btnSua"
    runat="server"
    Text="Sửa"
    CssClass="nut btn-sua"
    OnClick="btnSua_Click" />

<asp:Button ID="btnXoa"
    runat="server"
    Text="Xóa"
    CssClass="nut btn-xoa"
    OnClick="btnXoa_Click" />

<asp:Button ID="btnHuy"
    runat="server"
    Text="Hủy"
    CssClass="nut btn-huy"
    OnClick="btnHuy_Click" />

        <br /><br />

        <asp:Label ID="lblThongBao"
            runat="server"
            ForeColor="Red">
        </asp:Label>

    </div>


    <asp:GridView ID="gvTheLoai"
        runat="server"
        AutoGenerateColumns="False"
        CssClass="bang"
        OnSelectedIndexChanged="gvTheLoai_SelectedIndexChanged">

        <Columns>

            <asp:BoundField
                DataField="MaLoai"
                HeaderText="Mã loại" />

            <asp:BoundField
                DataField="TenLoai"
                HeaderText="Tên loại" />

            <asp:CommandField
                ShowSelectButton="True"
                SelectText="Chọn" />

        </Columns>

    </asp:GridView>
</asp:Content>
