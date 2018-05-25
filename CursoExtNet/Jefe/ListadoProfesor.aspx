<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master.Master" CodeBehind="ListadoProfesor.aspx.vb" Inherits="CursoExtNet.ListadoProfesor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <ext:Viewport runat="server" Layout="FitLayout">
        <Items>
            <ext:GridPanel ID="gpListadoProfe" runat="server" Layout="FitLayout" Title="Listado Profesores" TitleAlign="Center" Scroll="Both">
                <TopBar>
                    <ext:Toolbar runat="server">
                        <Items>
                            <ext:ComboBox ID="cboCalendario" runat="server" FieldLabel="Calendario" Margin="5" ValueField="ID" DisplayField="Calendario" Enabled="false">
                                <Store>
                                    <ext:Store ID="stCalendario" runat="server">
                                        <Model>
                                            <ext:Model ID="mdCalendario" runat="server">
                                                <Fields>
                                                    <ext:ModelField Name="ID" />
                                                    <ext:ModelField Name="Calendario" />
                                                </Fields>
                                            </ext:Model>
                                        </Model>
                                    </ext:Store>
                                </Store>
                                <Listeners>
                                    <Select Handler="App.direct.Actualizar();" />
                                </Listeners>
                            </ext:ComboBox>
                            <ext:ToolbarFill runat="server" />
                        </Items>
                    </ext:Toolbar>
                </TopBar>
                <Store>
                    <ext:Store ID="stListadoProfe" runat="server">
                        <Model>
                            <ext:Model ID="mdListadoProfe" runat="server">
                                <Fields>
                                    <ext:ModelField Name="Codigo" />
                                    <ext:ModelField Name="Nombre" />
                                </Fields>
                            </ext:Model>
                        </Model>
                    </ext:Store>
                </Store>
                <ColumnModel>
                    <Columns>
                        <ext:Column runat="server" DataIndex="Codigo" Text="Codigo" Flex="1" />
                        <ext:Column runat="server" DataIndex="Nombre" Text="Nombre" Flex="2" />
                    </Columns>
                </ColumnModel>
            </ext:GridPanel>
        </Items>
    </ext:Viewport>
</asp:Content>
