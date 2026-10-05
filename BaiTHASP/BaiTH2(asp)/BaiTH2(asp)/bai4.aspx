<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="bai4.aspx.cs" Inherits="BaiTH2_asp_.bai4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .student-container {
            width: 90%;
            margin: 30px auto;
        }

        .student-container h1 {
            color: #12345b;
            margin-bottom: 20px;
        }

        .form-student {
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 5px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .txt-student {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .btn {
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 5px;
        }

        .btn-add {
            background-color: #28a745;
        }

        .btn-add:hover {
            background-color: #218838;
        }

        .btn-edit {
            background-color: #f0ad4e;
        }

        .btn-edit:hover {
            background-color: #ec971f;
        }

        .btn-delete {
            background-color: #dc3545;
        }

        .btn-delete:hover {
            background-color: #c82333;
        }

        .btn-search {
            background-color: #1266c9;
        }

        .thongbao {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }

        .title-list {
            color: #12345b;
            margin-top: 30px;
            margin-bottom: 10px;
        }

        .gridview {
            width: 100%;
            border-collapse: collapse;
        }

        .gridview th {
            background-color: #1266c9;
            color: white;
            padding: 10px;
        }

        .gridview td {
            padding: 10px;
            border: 1px solid #ddd;
        }

        .gridview tr:not(:first-child):hover {
            background-color: #eaf3ff;
        }

        .anh-sinh-vien {
            width: 60px;
            height: 70px;
            object-fit: cover;
        }

        .tim-kiem {
            margin-top: 20px;
            margin-bottom: 15px;
        }
        .gridview tr:not(:first-child) {
    cursor: pointer;
    transition: 0.2s;
}

.gridview tr:not(:first-child):hover {
    background-color: #eaf3ff;
}
    .gridview th:first-child,
.gridview td:first-child {
    display: none;
}
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="student-container">

        <h1>Quản lý sinh viên</h1>

        <!-- Form nhập sinh viên -->
        <div class="form-student">

            <div class="form-group">
                <label>Họ tên</label>

                <asp:TextBox ID="txtHoTen"
                    runat="server"
                    CssClass="txt-student"
                    placeholder="Nhập họ tên sinh viên">
                </asp:TextBox>
            </div>


            <div class="form-group">
                <label>Email</label>

                <asp:TextBox ID="txtEmail"
                    runat="server"
                    CssClass="txt-student"
                    placeholder="Nhập email">
                </asp:TextBox>
            </div>


            <div class="form-group">
                <label>Ảnh đại diện</label>

                <asp:FileUpload ID="fuAnh"
                    runat="server" />
            </div>


            <asp:Button ID="btnThem"
                runat="server"
                Text="Thêm sinh viên"
                CssClass="btn btn-add"
                OnClick="btnThem_Click" />

            <asp:Button ID="btnSua"
                runat="server"
                Text="Cập nhật"
                CssClass="btn btn-edit"
                OnClick="btnSua_Click" />

            <asp:Button ID="btnXoa"
                runat="server"
                Text="Xóa"
                CssClass="btn btn-delete"
                OnClick="btnXoa_Click" />

            <asp:Label ID="lblThongBao"
                runat="server"
                CssClass="thongbao">
            </asp:Label>

        </div>


        <!-- Tìm kiếm -->
        <div class="tim-kiem">

            <asp:TextBox ID="txtTimKiem"
                runat="server"
                CssClass="txt-student"
                placeholder="Nhập tên hoặc email cần tìm">
            </asp:TextBox>

            <br /><br />

            <asp:Button ID="btnTimKiem"
                runat="server"
                Text="Tìm kiếm"
                CssClass="btn btn-search"
                OnClick="btnTimKiem_Click" />

            <asp:Button ID="btnHienTatCa"
                runat="server"
                Text="Hiển thị tất cả"
                CssClass="btn btn-search"
                OnClick="btnHienTatCa_Click" />

        </div>


        <!-- Danh sách -->
        <h2 class="title-list">Danh sách sinh viên</h2>

     <asp:GridView ID="gvSinhVien"
    runat="server"
    CssClass="gridview"
    AutoGenerateColumns="false"
    DataKeyNames="StudentID"
    OnSelectedIndexChanged="gvSinhVien_SelectedIndexChanged"
    OnRowDataBound="gvSinhVien_RowDataBound">

    <Columns>

        <asp:TemplateField HeaderText="">
            <ItemTemplate>
                <asp:LinkButton ID="btnChon"
                    runat="server"
                    CommandName="Select"
                    Style="display:none;">
                </asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:BoundField
            DataField="StudentID"
            HeaderText="Mã SV" />

        <asp:BoundField
            DataField="FullName"
            HeaderText="Họ tên" />

        <asp:BoundField
            DataField="Email"
            HeaderText="Email" />

        <asp:ImageField
            DataImageUrlField="ImagePath"
            HeaderText="Ảnh đại diện"
            ControlStyle-CssClass="anh-sinh-vien" />

    </Columns>

</asp:GridView>

    </div>

</asp:Content>
