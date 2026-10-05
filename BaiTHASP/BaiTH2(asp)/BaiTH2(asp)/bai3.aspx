<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="bai3.aspx.cs" Inherits="BaiTH2_asp_.bai3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .product-container {
            width: 90%;
            margin: 30px auto;
        }

        .product-container h1 {
            color: #12345b;
            margin-bottom: 20px;
        }

        .form-product {
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

        .txt-product {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .btn-add {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn-add:hover {
            background-color: #218838;
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
    cursor: pointer;
}

.gridview tr:not(:first-child) {
    transition: 0.2s;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="product-container">

        <h1>Quản lý sản phẩm</h1>

        <!-- Form nhập sản phẩm -->
        <div class="form-product">

            <div class="form-group">
                <label>Tên sản phẩm</label>

                <asp:TextBox ID="txtTenSP"
                    runat="server"
                    CssClass="txt-product"
                    placeholder="Nhập tên sản phẩm">
                </asp:TextBox>
            </div>


            <div class="form-group">
                <label>Giá</label>

                <asp:TextBox ID="txtGia"
                    runat="server"
                    CssClass="txt-product"
                    placeholder="Nhập giá sản phẩm">
                </asp:TextBox>
            </div>


            <div class="form-group">
                <label>Danh mục</label>

                <asp:TextBox ID="txtDanhMuc"
                    runat="server"
                    CssClass="txt-product"
                    placeholder="Nhập danh mục sản phẩm">
                </asp:TextBox>
            </div>


            <asp:Button ID="btnThem"
                runat="server"
                Text="Thêm sản phẩm"
                CssClass="btn-add"
                OnClick="btnThem_Click" />
            <asp:Button ID="btnSua"
                 runat="server"
                Text="Cập nhật sản phẩm"
                CssClass="btn-add"
                OnClick="btnSua_Click" />

            <asp:Label ID="lblThongBao"
                runat="server"
                CssClass="thongbao">
            </asp:Label>

        </div>


        <!-- Danh sách sản phẩm -->
        <h2 class="title-list">Danh sách sản phẩm</h2>

        <asp:GridView ID="gvSanPham"
            runat="server"
            CssClass="gridview"
            AutoGenerateColumns="true"
            DataKeyNames="ProductID"
            OnSelectedIndexChanged="gvSanPham_SelectedIndexChanged"
            OnRowDataBound="gvSanPham_RowDataBound">
        </asp:GridView>

    </div>

</asp:Content>
