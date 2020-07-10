<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClientPanel.aspx.cs" Inherits="Muni.Pages.Client.ClientPanel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <link href="../../Content/bootstrap.css" rel="stylesheet" />
    <link href="../../Content/dashboard.css" rel="stylesheet" />

    <title>Panel de cliente</title>
</head>
<body>
    <form id="loginForm" runat="server">
    <div class="container">
        <nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-2 shadow">
            <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">Panel de cliente</a>
            <ul class="navbar-nav px-3">
                <li class="nav-item text-nowrap">
                    <asp:Button ID="logoutBtn" runat="server" Text="Logout" OnClick="logoutBtn_Click" CssClass="btn btn-outline-danger my-2 my-sm-0" type="submit"/>
                </li>
            </ul>
        </nav>
    </div>
    <hr class="my-5"/>
    <div class="container">
        <div class="jumbotron">
            <asp:Label ID="welcomeLbl" CssClass="display-4" runat="server" Text="Placeholder text"></asp:Label>
            <br />
            <p class="lead">Por favor ingrese un número de propiedad.</p>
            <asp:TextBox ID="propidTB" runat="server" CssClass="form-control input-sm" TextMode="Number"></asp:TextBox>
            <br/>
            <asp:Button ID="verRecPen1Btn" runat="server" Text="Ver recibos pendientes" CssClass="btn btn-primary btn-lg" OnClick="verRecPen1Btn_Click"/>
            
            <hr class="my-4"/>
            <asp:GridView ID="gridView" runat="server" CssClass="table table-hover table-dark" AutoGenerateColumns="false" OnSelectedIndexChanged = "OnSelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="# Propiedad" HeaderText="# Propiedad" />
                    <asp:BoundField DataField="Valor" HeaderText="Valor" />
                    <asp:BoundField DataField="Direccion" HeaderText="Dirección" />
                    <asp:ButtonField Text="Seleccionar Propiedad" CommandName="Select" ItemStyle-Width="100"/>
                </Columns>
            </asp:GridView>

        </div>
    </div>
    
    </form>

    <%-- jQuery ,popper.js ,bootstrap.js --%>
    <script src="../Scripts/jquery-3.5.1.min.js"></script>
    <script src="../Scripts/popper.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
</body>
</html>
