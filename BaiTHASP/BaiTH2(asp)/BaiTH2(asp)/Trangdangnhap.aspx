<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Trangdangnhap.aspx.cs" Inherits="BaiTH2_asp_.Trangdangnhap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .login-box {
            width: 400px;
            margin: 60px auto;
            padding: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }

        .login-title {
            text-align: center;
            margin-bottom: 25px;
        }

        .login-label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        .login-input {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        .login-button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }

        .login-button:hover {
            background-color: #0056b3;
        }

        .thongbao {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: red;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="login-box">

        <h2 class="login-title">ĐĂNG NHẬP</h2>

        <asp:Label
            ID="Label1"
            runat="server"
            Text="Tên đăng nhập:"
            CssClass="login-label">
        </asp:Label>

        <asp:TextBox
            ID="txtTenDangNhap"
            runat="server"
            CssClass="login-input">
        </asp:TextBox>


        <asp:Label
            ID="Label2"
            runat="server"
            Text="Mật khẩu:"
            CssClass="login-label">
        </asp:Label>

        <asp:TextBox
            ID="txtMatKhau"
            runat="server"
            TextMode="Password"
            CssClass="login-input">
        </asp:TextBox>

        <asp:Button
            ID="btnDangNhap"
            runat="server"
            Text="Đăng nhập"
            CssClass="login-button"
            OnClick="btnDangNhap_Click" />

        <asp:Label
            ID="lblThongBao"
            runat="server"
            CssClass="thongbao">
        </asp:Label>

    </div>
</asp:Content>
