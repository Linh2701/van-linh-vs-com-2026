<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="bai1.aspx.cs" Inherits="BaiTH2_asp_.bai1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .viewstate-container {
            width: 90%;
            margin: 30px auto;
        }

        .viewstate-container h1 {
            color: #12345b;
            margin-bottom: 5px;
        }

        .subtitle {
            color: #666;
            font-size: 16px;
            border-bottom: 1px solid #ddd;
            padding-bottom: 15px;
        }

        .viewstate-container label {
            font-weight: bold;
            display: block;
            margin-top: 25px;
            margin-bottom: 8px;
        }

        .txt-ten {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .btn {
            margin-top: 20px;
            padding: 10px 25px;
            border: none;
            border-radius: 4px;
            background-color: #1266c9;
            color: white;
            font-size: 16px;
            cursor: pointer;
            margin-right: 15px;
        }

        .btn:hover {
            background-color: #0d4f9b;
        }

        .ketqua {
            margin-top: 35px;
            color: #12345b;
            font-size: 22px;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="viewstate-container">

        <h1>Thực hành ViewState</h1>

        <div class="subtitle">
            ASP.NET WebForms
        </div>

        <label>Nhập tên của bạn:</label>

        <asp:TextBox ID="txtTen" runat="server"
            CssClass="txt-ten"
            placeholder="Nhập tên của bạn...">
        </asp:TextBox>

        <br />

        <asp:Button ID="btnLuu" runat="server"
            Text="Lưu vào ViewState"
            CssClass="btn"
            OnClick="btnLuu_Click" />

        <asp:Button ID="btnPostBack" runat="server"
            Text="Chỉ Postback"
            CssClass="btn"
            OnClick="btnPostBack_Click" />

        <asp:Label ID="lblKetQua" runat="server"
            CssClass="ketqua">
        </asp:Label>

    </div>
</asp:Content>
