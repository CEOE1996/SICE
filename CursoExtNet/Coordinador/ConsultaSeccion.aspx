<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master.Master" CodeBehind="ConsultaSeccion.aspx.vb" Inherits="CursoExtNet.ConsultaSeccion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <ext:Viewport runat="server" Layout="FitLayout">
        <Items>
            <ext:GridPanel ID="gpSeccion" runat="server" Title="Consulta Secciones" TitleAlign="Center" Layout="FitLayout" Scroll="Both">
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
                            <ext:Button ID="btnEncuadre" runat="server" Icon="BookEdit" Margin="5" Text="Detalle Materia">
                                <DirectEvents>
                                    <Click OnEvent="btnEncuadre_Click">
                                        <EventMask ShowMask="true" />
                                        <ExtraParams>
                                            <ext:Parameter Name="ID"      Value="#{gpSeccion}.selModel.selected.items[0].data.ID"       Mode="Raw" />
                                            <ext:Parameter Name="NRC"     Value="#{gpSeccion}.selModel.selected.items[0].data.NRC"      Mode="Raw" />
                                            <ext:Parameter Name="Seccion" Value="#{gpSeccion}.selModel.selected.items[0].data.Seccion"  Mode="Raw" />
                                            <ext:Parameter Name="Materia" Value="#{gpSeccion}.selModel.selected.items[0].data.Materia"  Mode="Raw" />
                                        </ExtraParams>
                                    </Click>
                                </DirectEvents>
                                <Listeners>
                                    <Click Handler="return #{gpSeccion}.hasSelection();" />
                                </Listeners>
                            </ext:Button> 
                        </Items>    
                    </ext:Toolbar>
                </TopBar>
                <Store>
                    <ext:Store ID="stSeccion" runat="server" GroupField="Materia">
                        <Model>
                            <ext:Model ID="mdSeccion" runat="server">
                                <Fields>
                                    <ext:ModelField Name="ID" />
                                    <ext:ModelField Name="NRC" />
                                    <ext:ModelField Name="Seccion" />
                                    <ext:ModelField Name="Profesor" />
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
                        <ext:Column runat="server" DataIndex="ID"           Text="ID"       Visible="false" />
                        <ext:Column runat="server" DataIndex="NRC"          Text="NRC"      Width="75px" />
                        <ext:Column runat="server" DataIndex="Seccion"      Text="Sección"  Width="75px" />
                        <ext:Column runat="server" DataIndex="Profesor"     Text="Profesor" Flex="1" />
                        <ext:Column runat="server" DataIndex="ClaveMateria" Text="Clave"    Width="75px" />
                        <ext:Column runat="server" DataIndex="Materia"      Text="Materia"  Flex="1" />
                        <ext:Column runat="server" DataIndex="Aula"         Text="Aula"     Width="100px" />
                    </Columns>
                </ColumnModel>
                <Plugins>
                    <ext:FilterHeader runat="server" />
                </Plugins>
                <View>
                    <ext:GridView runat="server" StripeRows="true" MarkDirty="false" />
                </View>
                <Features>
                    <ext:Grouping ID="Grouping1" runat="server" StartCollapsed="true" ShowGroupsText="" />
                </Features> 
            </ext:GridPanel>
        </Items>
    </ext:Viewport>
</asp:Content>
