<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master.Master" CodeBehind="Encuadre.aspx.vb" Inherits="CursoExtNet.Encuadre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <ext:Viewport runat="server" Layout="FitLayout">
        <Content>
            <ext:Hidden ID="hdID" runat="server" />
            <ext:GridPanel ID="gpEncuadre" runat="server" Layout="FitLayout" AnchorHorizontal="100%" AnchorVertical="70%" DefaultAnchor="100%">
                <TopBar>
                    <ext:Toolbar runat="server">
                        <Items>
                            <ext:ToolbarFill runat="server" />
                            <ext:Button ID="btnAdd" runat="server" Text="Agregar" Icon="Add">

                            </ext:Button>
                            <ext:Button ID="btnDelete" runat="server" Text="Eliminar" Icon="Delete">

                            </ext:Button>
                        </Items>
                    </ext:Toolbar>
                </TopBar>
                <Store>
                    <ext:Store ID="stEncuadre" runat="server">
                        <Model>
                            <ext:Model ID="mdEncuadre" runat="server">
                                <Fields>
                                    <ext:ModelField Name="ID" />
                                    <ext:ModelField Name="IDTipo" />
                                    <ext:ModelField Name="TipoCalificacion" />
                                    <ext:ModelField Name="Porcentaje" />
                                </Fields>
                            </ext:Model>
                        </Model>
                    </ext:Store>
                </Store>
                <ColumnModel>
                    <Columns>
                        <ext:Column runat="server" DataIndex="ID" Text="ID" Visible="false" />
                        <ext:Column runat="server" DataIndex="IDTipo" Text="IDTipo" Visible="false" />
                        <ext:Column runat="server" DataIndex="TipoCalificacion" Text="TipoCalificacion" Flex="2" />
                        <ext:Column runat="server" DataIndex="Porcentaje" Text="Porcentaje" Flex="1" />
                    </Columns>
                </ColumnModel>
            </ext:GridPanel>
        </Content>
    </ext:Viewport>
</asp:Content>
