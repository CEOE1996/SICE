<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master.Master" CodeBehind="ActividadesMateria.aspx.vb" Inherits="CursoExtNet.ActividadesMateria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        var edit = function (editor, e) {
            if (!(e.value === e.originalValue || (Ext.isDate(e.value) && Ext.Date.isEqual(e.value, e.originalValue)))) {
                App.direct.Edit(e.record.data.AlumnoSeccion, e.value);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <ext:Viewport runat="server" Layout="FitLayout">
        <Content>
            <ext:Hidden ID="hdID" runat="server" />
            <ext:GridPanel ID="gpActividades" runat="server" Layout="FitLayout" AnchorHorizontal="100%" AnchorVertical="70%" DefaultAnchor="100%" Scroll="Both">
                <Store>
                    <ext:Store ID="stActividades" runat="server">
                        <Model>
                            <ext:Model ID="mdActividades" runat="server">
                                <Fields>
                                    <ext:ModelField Name="ID" />
                                    <ext:ModelField Name="Tipo" />
                                    <ext:ModelField Name="Descripcion" />
                                    <ext:ModelField Name="FechaAlta" />
                                    <ext:ModelField Name="Calificacion" />
                                </Fields>
                            </ext:Model>
                        </Model>
                    </ext:Store>
                </Store>
                <ColumnModel>
                    <Columns>
                        <ext:Column     runat="server" DataIndex="ID"               Text="ID"               Visible="false" />
                        <ext:Column     runat="server" DataIndex="Tipo"             Text="Tipo"             Flex="1" />
                        <ext:Column     runat="server" DataIndex="Descripcion"      Text="Descripción"      Flex="2" />
                        <ext:DateColumn runat="server" DataIndex="FechaAlta"        Text="Fecha Alta"       Width="175px" Format="dd/MM/yyyy" />
                        <ext:Column     runat="server" DataIndex="Calificacion"     Text="Calificación"     Flex="1" />
                    </Columns>
                </ColumnModel>
                <Plugins>
                    <ext:FilterHeader runat="server" />
                </Plugins>
            </ext:GridPanel>
        </Content>
    </ext:Viewport>
</asp:Content>
