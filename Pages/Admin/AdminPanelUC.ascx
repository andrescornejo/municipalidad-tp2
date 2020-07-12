<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminPanelUC.ascx.cs" Inherits="Muni.Pages.Admin.AdminPanelUC" %>

<link href="../../Content/bootstrap.css" rel="stylesheet" />
<link href="../../Content/dashboard.css" rel="stylesheet" />


<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

<div class="container">
  <nav class="navbar navbar-dark bg-dark fixed-top flex-md-nowrap p-2 shadow">
    <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">Panel de administrador</a>
    <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
            <asp:Button ID="logoutBtn" runat="server" Text="Cerrar sesión" OnClick="logoutBtn_Click" CssClass="btn btn-outline-danger my-2 my-sm-0" type="submit"/>
        </li>
    </ul>
  </nav>
</div>
<div class="py-5"></div>

<script src="../../Scripts/jquery-3.5.1.min.js"></script>
<script src="../../Scripts/popper.min.js"></script>
<script src="../../Scripts/bootstrap.min.js"></script>
