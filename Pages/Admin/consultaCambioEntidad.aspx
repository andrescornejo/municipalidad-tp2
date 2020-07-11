<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="consultaCambioEntidad.aspx.cs" Inherits="Muni.Pages.Admin.consultaCambioEntidad" %>

<%@ Register Src="~/Pages/Admin/AdminPanelUC.ascx" TagPrefix="uc1" TagName="AdminPanelUC" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <link href="../../Content/bootstrap-datepicker.standalone.css" rel="stylesheet" />
    <title>Consulta de cambios</title>
</head>
<body>
    <form id="consultaCambiosForm" runat="server">
        <uc1:AdminPanelUC runat="server" ID="AdminPanelUC" />
        <div class="container">
            <div class="jumbotron">
                <asp:Label ID="welcomeLbl" CssClass="display-4 mb-4" runat="server" Text="Placeholder text"></asp:Label>
                <br />
                <p class="lead">Por favor ingrese un número de propiedad.</p>
                <div class="form-group row px-3 pb-4">
                    <div class="col-cs-2">
                        <p class="lead">Tipo de entidad</p>
                        <asp:DropDownList ID="dropTipoEntidad" CssClass="btn btn-secondary dropdown-toggle" runat="server">
                            <asp:ListItem>Propiedad</asp:ListItem>
                            <asp:ListItem>Propietario</asp:ListItem>
                            <asp:ListItem>Usuario</asp:ListItem>
                            <asp:ListItem>PropiedadVsPropietario</asp:ListItem>
                            <asp:ListItem>PropiedadVsUsuario</asp:ListItem>
                            <asp:ListItem>PropiedadJuridico</asp:ListItem>
                            <asp:ListItem>ConceptoCobro</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-xs-2 mx-3">
                        <p class="lead">Fecha inicio</p>
                        <asp:TextBox ID="tb_FormerDate" runat="server" CssClass="form-control" data-date-autoclose="true" data-date-format="yyyy-mm-dd" data-provide="datepicker" TextMode="DateTimeLocal"></asp:TextBox>
                    </div>
                    <div class="col-xs-2">
                        <p class="lead">Fecha fin</p>
                        <asp:TextBox ID="tb_LatterDate" runat="server" CssClass="form-control" data-date-autoclose="true" data-date-format="yyyy-mm-dd" data-provide="datepicker" TextMode="DateTimeLocal"></asp:TextBox>
                    </div>
                </div>
                <asp:Button ID="verCambiosBtn" runat="server" Text="Ver cambios realizados" CssClass="btn btn-primary btn-lg" OnClick="verCambiosBtn_Click"/>

                <hr class="my-4"/>
                <asp:GridView ID="gridView" runat="server" CssClass="table table-hover table-dark" AutoGenerateColumns="false" OnSelectedIndexChanged = "gridLink_Clicked">
                    <Columns>
                        <asp:BoundField DataField="# Propiedad" HeaderText="# Propiedad" />
                        <asp:BoundField DataField="Valor" HeaderText="Valor" />
                        <asp:BoundField DataField="Direccion" HeaderText="Dirección" />
                        <asp:ButtonField Text="Seleccionar Propiedad" CommandName="Select" ItemStyle-Width="100"/>
                    </Columns>
                </asp:GridView>
            </div>
        </div>


        <script src="../../Scripts/bootstrap-datepicker.min.js"></script>
    </form>
</body>
</html>
