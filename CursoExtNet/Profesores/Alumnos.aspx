<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master.Master" CodeBehind="Alumnos.aspx.vb" Inherits="CursoExtNet.Alumnos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <ext:Viewport runat="server" Layout="FitLayout">
        <Content>
            <ext:Hidden ID="hdID" runat="server" />
            <ext:GridPanel ID="gpAlumnos" runat="server" Layout="FitLayout" AnchorHorizontal="100%" AnchorVertical="70%" DefaultAnchor="100%">
                <TopBar>
                    <ext:Toolbar runat="server">
                        <Items>
                            <ext:ToolbarFill runat="server" />
                            
                        </Items>
                    </ext:Toolbar>
                </TopBar>
                <Store>
                    <ext:Store ID="stAlumnos" runat="server">
                        <Model>
                            <ext:Model ID="mdAlumnos" runat="server">
                                <Fields>
                                    <ext:ModelField Name="ID" />
                                    <ext:ModelField Name="Codigo" />
                                    <ext:ModelField Name="Nombre" />
                                    <ext:ModelField Name="Carrera" />
                                </Fields>
                            </ext:Model>
                        </Model>
                    </ext:Store>
                </Store>
                <ColumnModel>
                    <Columns>
                        <ext:Column runat="server" DataIndex="ID"               Text="ID"           Visible="false" />
                        <ext:Column runat="server" DataIndex="Codigo"           Text="Código"       Width="125px" />
                        <ext:Column runat="server" DataIndex="Nombre"           Text="Nombre"       Flex="1" />
                        <ext:Column runat="server" DataIndex="Carrera"          Text="Carrera"      Width="200px" />
                    </Columns>
                </ColumnModel>
            </ext:GridPanel>
        </Content>
    </ext:Viewport>
</asp:Content>
