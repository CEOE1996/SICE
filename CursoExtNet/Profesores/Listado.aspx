<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master.Master" CodeBehind="Listado.aspx.vb" Inherits="CursoExtNet.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <ext:Viewport runat="server" Layout="FitLayout">
        <Content>
            <ext:GridPanel ID="gpListado" runat="server" Layout="FitLayout" Title="Listado de Materias" TitleAlign="Center" >
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
                            </ext:ComboBox>
                        </Items>
                    </ext:Toolbar>
                </TopBar>
                <Store>
                    <ext:Store ID="stListado" runat="server">
                        <Model>
                            <ext:Model ID="mdListado" runat="server">
                                <Fields>
                                    <ext:ModelField Name="NRC" />
                                    <ext:ModelField Name="Seccion" />
                                    <ext:ModelField Name="ClaveMateria" />
                                    <ext:ModelField Name="Materia" />
                                    <ext:ModelField Name="Aula" />
                                </Fields>
                            </ext:Model>
                        </Model>
                    </ext:Store>
                </Store>
                <ColumnModel>
                    <Columns>
                        <ext:Column runat="server" DataIndex="NRC"          Text="NRC"      Width="70px" />
                        <ext:Column runat="server" DataIndex="Seccion"      Text="Sección"  Width="70px" />
                        <ext:Column runat="server" DataIndex="ClaveMateria" Text="Clave"    Width="70px" />
                        <ext:Column runat="server" DataIndex="Materia"      Text="Materia"  Width="150px" />
                        <ext:Column runat="server" DataIndex="Aula"         Text="Aula"     Width="150px" />
                    </Columns>
                </ColumnModel>
            </ext:GridPanel>
        </Content>
    </ext:Viewport>
</asp:Content>
