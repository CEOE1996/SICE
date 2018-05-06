<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Principal.aspx.vb" Inherits="CursoExtNet.Principal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Precios CML</title>
    <link href="Css/Style.css" rel="stylesheet" />

    <script type="text/javascript">
        var onTreeItemClick = function (record, e) {
            if (record.isLeaf()) {
                e.stopEvent();
                App.pnlPagina.load({ url: record.get('url') });
            } else {
                record[record.isExpanded() ? 'collapse' : 'expand']();
            }
        };
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <ext:ResourceManager runat="server" />

        <ext:Viewport runat="server" Layout="BorderLayout">
            <Items>
                <ext:Panel runat="server" ID="pnlSuperior" Region="North" Height="114" MarginSpec="2 2 0 2" MinWidth="800">
                    <Content>
                        <table style="width:100%; margin:0 0 0 0; border-spacing:0; border-collapse:collapse;">
                            <tr>
                                <td class="titulo" style="width:240px;">
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Imagenes/UDG2.png" Height="85"/>
                                </td>
                                <td class="titulo" style="padding-right:240px; text-align:center">
                                    Sistema de Control Escolar
                                </td>
                            </tr>
                             <tr>
                                <td colspan="2" class="tituloBienvenida">
                                    Bienvenido(a): 
                                    <asp:Label ID="lblCodigo" runat="server" Text=""></asp:Label>
                                    &nbsp;&nbsp;/&nbsp;&nbsp;
                                    <asp:Label ID="lblNombre" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </Content>
                </ext:Panel>
                <ext:Panel runat="server" IDMode="Static" ID="pnlMenu" Width="200" Region="West" Collapsible="true" MinWidth="175" MarginSpec="0 0 2 2" Title="Menu"
                    Split="true" MaxWidth="400" Collapsed="false" Layout="AccordionLayout" Header="false">
                    <Items>
                        <ext:TreePanel ID="TreePanel1" runat="server" Lines="false" UseArrows="true" Animate="true"
                            Header="true" Title="Menu" HideCollapseTool="true" Cls="Titulo" >
                            <Fields>
                                <ext:ModelField Name="url" />
                            </Fields>
                            <Listeners>
                                <ItemClick Handler="onTreeItemClick(record, e);" />
                            </Listeners>
                        </ext:TreePanel>
                    </Items>
                </ext:Panel>
                <ext:Panel runat="server" ID="pnlPagina" Region="Center" ActiveIndex="0" MarginSpec="0 2 2 0">
                    <Loader ID="Loader1" runat="server" AutoLoad="false" Mode="Frame" Scripts="true" DisableCaching="true"  >
                        <LoadMask ShowMask="true" Msg="Cargando..." />
                    </Loader> 
                </ext:Panel>
            </Items>
        </ext:Viewport>
    </div>
    </form>
</body>
</html>