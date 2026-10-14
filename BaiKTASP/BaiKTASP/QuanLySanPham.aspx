<%@ Page Title="Quản lý sản phẩm" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="QuanLySanPham.aspx.cs" Inherits="BaiKTASP.QuanLySanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            width: 90%;
            margin: 20px auto;
        }

        .form-group {
            margin-bottom: 12px;
        }

        .form-group label {
            display: inline-block;
            width: 120px;
        }

        .form-group input, .form-group select {
            padding: 6px;
        }

        .btn {
            padding: 7px 14px;
            margin: 4px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            color: white;
        }

        .btn-them {
            background-color: #28a745;
        }

        .btn-luu {
            background-color: #007bff;
        }

        .btn-huy {
            background-color: #6c757d;
        }

        .btn-tim {
            background-color: #17a2b8;
        }

       .btn-sua {
            display: inline-block;
            background-color: orange;
            color: white;
            padding: 6px 12px;
            border-radius: 4px;
            text-decoration: none;
            margin: 3px;
        }

        .btn-xoa {
            display: inline-block;
            background-color: red;
            color: white;
            padding: 6px 12px;
            border-radius: 4px;
            text-decoration: none;
            margin: 3px;
        }       

        .btn-sua:hover {
            background-color: #e69500;
        }

        .btn-xoa:hover {
            background-color: #c82333;
        }

        .form-box {
            border: 1px solid #ccc;
            padding: 15px;
            margin: 20px 0;
            border-radius: 5px;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        .table th, .table td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: center;
        }

        .table th {
            background-color: #e8e8e8;
        }

        .anh {
            width: 60px;
            height: 60px;
            object-fit: cover;
        }

        .phantrang {
            text-align: center;
            margin-top: 15px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2>QUẢN LÝ SẢN PHẨM</h2>

        <div>
            <asp:TextBox ID="txtTim" runat="server" placeholder="Nhập mã hoặc tên sản phẩm"></asp:TextBox>

            <asp:DropDownList ID="ddlTimLoai" runat="server"></asp:DropDownList>

            <asp:Button ID="btnTim" runat="server" Text="Tìm kiếm"
                CssClass="btn btn-tim" OnClick="btnTim_Click" />

            <asp:Button ID="btnThem" runat="server" Text="Thêm sản phẩm"
                CssClass="btn btn-them" OnClick="btnThem_Click" />
        </div>

        <asp:Panel ID="pnForm" runat="server" Visible="false" CssClass="form-box">
            <h3>
                <asp:Label ID="lblTieuDe" runat="server"></asp:Label>
            </h3>

            <div class="form-group">
                <label>Mã sản phẩm:</label>
                <asp:TextBox ID="txtMasp" runat="server" ReadOnly="true"></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Tên sản phẩm:</label>
                <asp:TextBox ID="txtTensp" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Ngày nhập:</label>
                <asp:TextBox ID="txtNgaynhap" runat="server" TextMode="Date"></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Đơn giá:</label>
                <asp:TextBox ID="txtDongia" runat="server" TextMode="Number"></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Ảnh:</label>
                <asp:FileUpload ID="fileAnh" runat="server" />
            </div>

            <div class="form-group">
                <label>Thể loại:</label>
                <asp:DropDownList ID="ddlLoai" runat="server"></asp:DropDownList>
            </div>

            <asp:Button ID="btnLuu" runat="server" Text="Lưu"
                CssClass="btn btn-luu" OnClick="btnLuu_Click" />

            <asp:Button ID="btnHuy" runat="server" Text="Hủy"
                CssClass="btn btn-huy" OnClick="btnHuy_Click" />

            <br />

            <asp:Label ID="lblThongBao" runat="server" ForeColor="Red"></asp:Label>
        </asp:Panel>

        <p>
            <asp:Label ID="lblTongSo" runat="server"></asp:Label>
        </p>

        <asp:GridView ID="gvSanPham" runat="server"
            AutoGenerateColumns="False"
            CssClass="table"
            AllowPaging="True"
            PageSize="5"
            PagerSettings-Visible="False"
            OnPageIndexChanging="gvSanPham_PageIndexChanging"
            OnRowCommand="gvSanPham_RowCommand"
            EmptyDataText="Không có sản phẩm nào.">

            <Columns>
                <asp:BoundField DataField="Masp" HeaderText="Mã sản phẩm" />

                <asp:BoundField DataField="Tensp" HeaderText="Tên sản phẩm" />

                <asp:BoundField DataField="Ngaynhap" HeaderText="Ngày nhập"
                    DataFormatString="{0:dd/MM/yyyy}" />

                <asp:BoundField DataField="Dongia" HeaderText="Đơn giá"
                    DataFormatString="{0:N0}" />

                <asp:TemplateField HeaderText="Ảnh">
                    <ItemTemplate>
                        <asp:Image ID="imgAnh" runat="server" CssClass="anh"
                            ImageUrl='<%# string.IsNullOrEmpty(Eval("Anh").ToString()) ? "" : "~/Images/" + Eval("Anh") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="TenLoai" HeaderText="Thể loại" />

                <asp:TemplateField HeaderText="Chức năng">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnSua" runat="server" Text="Sửa"
                            CssClass="btn-sua"
                            CommandName="Sua"
                            CommandArgument='<%# Eval("Masp") %>'
                            CausesValidation="false"></asp:LinkButton>

                        <asp:LinkButton ID="btnXoa" runat="server" Text="Xóa"
                            CssClass="btn-xoa"
                            CommandName="Xoa"
                            CommandArgument='<%# Eval("Masp") %>'
                            CausesValidation="false"
                            OnClientClick="return confirm('Bạn có chắc muốn xóa sản phẩm này không?');"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <div class="phantrang">
            <asp:Button ID="btnDau" runat="server" Text="Đầu"
                CssClass="btn btn-tim" OnClick="btnDau_Click" />

            <asp:Button ID="btnTruoc" runat="server" Text="Trước"
                CssClass="btn btn-tim" OnClick="btnTruoc_Click" />

            <asp:Label ID="lblSoTrang" runat="server"></asp:Label>

            <asp:Button ID="btnSau" runat="server" Text="Sau"
                CssClass="btn btn-tim" OnClick="btnSau_Click" />

            <asp:Button ID="btnCuoi" runat="server" Text="Cuối"
                CssClass="btn btn-tim" OnClick="btnCuoi_Click" />
        </div>
    </div>
</asp:Content>