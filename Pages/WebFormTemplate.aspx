<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormTemplate.aspx.cs" Inherits="Muni.Pages.WebFormTemplate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:#2c3d63">
    <form id="form1" runat="server">
        <div style="text-align:center">
            <asp:Label ID="catergoryLbl" runat="server" Font-Names="Bahnschrift" Font-Size="150px" ForeColor="White" Text="[Category Here]"></asp:Label>       
        </div>
        <div style="margin-left:auto;margin-right:auto">
            <asp:GridView ID="gridView" runat="server" HorizontalAlign="Center" GridLines="Horizontal"></asp:GridView>
        </div>
    </form>
</body>
</html>
