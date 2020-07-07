<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="Muni.MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
</head>
<body style="background-color:#2c3d63">
    <form id="MainForm" runat="server">
        <div style="text-align:center">
            <asp:Label ID="muniLbl" runat="server" Font-Names="Bahnschrift" Font-Size="150px" ForeColor="White" Text="Municipalidad"></asp:Label>       
        </div>
        <div style="text-align:center;margin-top:20px">
            <asp:Label ID="usernameLbl" runat="server" Text="Username" Font-Names="Bahnschrift" ForeColor="White" style="margin-top:10px" Font-Size="30px"></asp:Label>
            <br/>
            <asp:TextBox ID="usernameTb" runat="server" style="margin-top:10px;margin-bottom:10px" Font-Names="Bahnschrift" Width="200px" Font-Size="20px"></asp:TextBox>
            <br />
            <asp:Label ID="passwordLbl" runat="server" Text="Password" Font-Names="Bahnschrift" ForeColor="White" style="margin-top:10px" Font-Size="30px"></asp:Label>
            <br />
            <asp:TextBox ID="passwordTb" runat="server" style="margin-top:10px;margin-bottom:10px" Font-Names="Bahnschrift" Width="200px" Font-Size="20px" TextMode="Password"></asp:TextBox>
            <br />
            <asp:Button ID="loginBtn" runat="server" Text="Login" Width="200px" BorderWidth="0px" Font-Bold="True" Font-Names="Bahnschrift" Font-Size="40px" ForeColor="White" style="margin-top:30px ;background-color:#ff6f5e" OnClick="loginBtn_Click"/>
        </div>
    </form>
</body>
</html>
