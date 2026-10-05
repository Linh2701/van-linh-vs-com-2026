<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="bai2.aspx.cs" Inherits="BaiTH2_asp_.bai2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style>
        .upload-container {
            width: 90%;
            margin: 30px auto;
        }

        .upload-container h1 {
            color: #12345b;
            margin-bottom: 20px;
        }

        .file-upload {
            margin-bottom: 15px;
        }

        .btn-upload {
            background-color: #1266c9;
            color: white;
            border: none;
            padding: 8px 20px;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn-upload:hover {
            background-color: #0d4f9b;
        }

        .thongbao {
            display: block;
            margin-top: 10px;
            color: green;
            font-weight: bold;
        }

        .anh-upload {
            margin-top: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            width: 300px;
            height: 220px;
            object-fit: contain;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="upload-container">

        <h1>Thực hành Upload Hình Ảnh</h1>

        <asp:FileUpload ID="fuHinh" runat="server"
            CssClass="file-upload" />

        <br />

        <asp:Button ID="btnUpload" runat="server"
            Text="Upload Ảnh"
            CssClass="btn-upload"
            OnClick="btnUpload_Click" />

        <asp:Label ID="lblThongBao" runat="server"
            CssClass="thongbao">
        </asp:Label>

        <br />

        <asp:Image ID="imgHinh" runat="server"
            CssClass="anh-upload"
            Visible="false" />

    </div>

</asp:Content>
