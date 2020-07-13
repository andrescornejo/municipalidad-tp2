<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="crudPropiedades.aspx.cs" Inherits="Muni.Pages.Admin.crudPropiedades" %>

<%@ Register Src="~/Pages/Admin/AdminPanelUC.ascx" TagPrefix="uc1" TagName="AdminPanelUC" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manejo de propiedades</title>
</head>
<body>
    <form id="crudPropiedadesForm" runat="server">
        <uc1:AdminPanelUC runat="server" ID="AdminPanelUC" />
        <div class="container">

            <div class="dropdown show pb-3">
                <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Tipo de gestión
                </a>

                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                    <a id="dropCreate" class="dropdown-item" href="#">Crear</a>
                    <a id="dropUpdate" class="dropdown-item" href="#">Actualizar</a>
                    <a id="dropDelete" class="dropdown-item" href="#">Borrar</a>
                </div>
            </div>
            <div id="jtCreate" class="jumbotron">
                <h1 class="display-4">Creación de propiedades.</h1>
                <p class="lead">Ingrese los datos de la nueva propiedad.</p>
                <hr class="my-4"/>
                <div class="form-group row px-3 pb-4">
                    <div class="col-xs-2">
                        <p class="lead">Número de propiedad</p>
                        <asp:TextBox ID="tb_CnumProp" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                    </div>
                    <div class="col-xs-2 px-3">
                        <p class="lead">Valor monetario</p>
                        <asp:TextBox ID="tb_Cvalor" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                    </div>
                    <div class="col-xs-2">
                        <p class="lead">Dirección</p>
                        <asp:TextBox ID="tb_Cdir" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <asp:Button ID="btnCreateProp" runat="server" Text="Crear propiedad" CssClass="btn btn-primary btn-lg" OnClick="btnCreateProp_Click"/>
            </div>
            <div id="jtUpdate" class="jumbotron hidden">
                <h1 class="display-4">Actualización de propiedades.</h1>
                <p class="lead">Ingrese los datos requeridos para actualizar la propiedad.</p>
                <hr class="my-4"/>

            </div>
            <div id="jtDelete" class="jumbotron hidden">
                <h1 class="display-4">Borrado de propiedades.</h1>
                <p class="lead">Seleccione la propiedad que desea borrar.</p>
                <hr class="my-4"/>
                <div class="form-group row px-3 pb-4">
                    <div class="col-xs-2">
                        <asp:Label ID="lblDelProp" CssClass="lead" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <asp:Button ID="btnDeleteProp" runat="server" Text="Borrar propiedad" CssClass="btn btn-danger btn-lg" OnClick="btnDeleteProp_Click"/>
            </div>
            <div id="jtGrid" class="jumbotron">
                <h1 class="h3">Propiedades registradas:</h1>
                <div class="my-4"></div>
                <asp:GridView ID="gridProp" runat="server" CssClass="table table-hover table-dark" AutoGenerateColumns="false" OnSelectedIndexChanged="gridProp_SelectedIndexChanged"  > <%--OnSelectedIndexChanged = "gridLink_Clicked"--%><%--CssClass="table table-hover table-dark"--%>
                    <Columns>
                        <asp:ButtonField Text="Seleccionar propiedad" CommandName="Select" ItemStyle-Width="100"/><%--onclientclick="return false;" autopostback="false"--%>
<%--                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnG" Text="Select" runat="server" CommandName="Select" CommandArgument="<%# Container.DataItemIndex %>"/>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <asp:BoundField DataField="numFin" HeaderText="Número de propiedad" />
                        <asp:BoundField DataField="val" HeaderText="Valor monetario" />
                        <asp:BoundField DataField="dir" HeaderText="Dirección" />
                        <asp:BoundField DataField="cAm3" HeaderText="Consumo acumulado en m3" />
                        <asp:BoundField DataField="uCm3" HeaderText="Último consumo en m3" />
                    </Columns>
                </asp:GridView>
<%--                <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                    <ContentTemplate>

                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="gridProp"/> 
                    </Triggers>
                </asp:UpdatePanel>--%>
            </div>
        </div>
        <%-- This will be used as a connection point between client and server to determine what panel is currently in use, 
                since i cant prevent the gridview from postbacking for some reason. --%>
        <asp:HiddenField ID="currentUseCase" runat="server"/>
    </form>
    <script src="../../Scripts/dashboard.js"></script>
</body>
</html>
