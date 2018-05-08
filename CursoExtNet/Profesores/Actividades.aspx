<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master.Master" CodeBehind="Actividades.aspx.vb" Inherits="CursoExtNet.Actividades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <ext:Viewport runat="server" Layout="FitLayout">
        <Content>
            <ext:Hidden ID="hdID" runat="server" />
            <ext:GridPanel ID="gpActividades" runat="server" Layout="FitLayout" AnchorHorizontal="100%" AnchorVertical="70%" DefaultAnchor="100%">
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
                    <ext:Store ID="stActividades" runat="server">
                        <Model>
                            <ext:Model ID="mdActividades" runat="server">
                                <Fields>
                                    <ext:ModelField Name="ID" />
                                    <ext:ModelField Name="Tipo" />
                                    <ext:ModelField Name="Descripcion" />
                                    <ext:ModelField Name="FechaAlta" />
                                </Fields>
                            </ext:Model>
                        </Model>
                    </ext:Store>
                </Store>
                <ColumnModel>
                    <Columns>
                        <ext:Column runat="server" DataIndex="ID"               Text="ID"           Visible="false" />
                        <ext:Column runat="server" DataIndex="Tipo"             Text="Tipo"         Flex="1" />
                        <ext:Column runat="server" DataIndex="Descripcion"      Text="Descripción"  Flex="2" />
                        <ext:DateColumn runat="server" DataIndex="FechaAlta"    Text="Fecha Alta"   Width="200px" Format="dd/MM/yyyy" />
                    </Columns>
                </ColumnModel>
            </ext:GridPanel>
        </Content>
    </ext:Viewport>
</asp:Content>
