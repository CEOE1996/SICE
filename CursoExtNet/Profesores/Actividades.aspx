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
                            <ext:Button ID="btnAdd" runat="server" Text="Agregar" Icon="Add" Margin="5">
                                <Listeners>
                                    <Click Handler="App.direct.ClearFields();
                                                    #{wdwAdd}.show();" />
                                </Listeners>
                            </ext:Button>
                            <ext:Button ID="btAct"  runat="server" Text="Calificar Actividad" Icon="BookEdit" Margin="5">

                            </ext:Button>
                            <ext:Button ID="btnDelete" runat="server" Text="Eliminar" Icon="Delete" Margin="5">
                                <DirectEvents>
                                    <Click OnEvent="btnDelete_Click">
                                        <EventMask ShowMask="true" />
                                        <Confirmation Title="Eliminar Actividad" Message="¿Deseas Eliminar esta Actividad?" ConfirmRequest="true" />
                                        <ExtraParams>
                                            <ext:Parameter Name="ID" Value="#{gpActividades}.selModel.selected.items[0].data.ID" Mode="Raw" />
                                        </ExtraParams>
                                    </Click>
                                </DirectEvents>
                                <Listeners>
                                    <Click Handler="return #{gpActividades}.hasSelection();" />
                                </Listeners>
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
                <Plugins>
                    <ext:FilterHeader runat="server" />
                </Plugins>
            </ext:GridPanel>
        </Content>
    </ext:Viewport>
    <ext:Window ID="wdwAdd" runat="server" Title="Agregar" TitleAlign="Center" Modal="true" Hidden="true" Layout="AnchorLayout" Width="400px" Height="250px">
        <Items>
            <ext:FormPanel runat="server" Layout="AnchorLayout" DefaultAnchor="100%" AnchorHorizontal="100%" AnchorVertical="100%" Margin="5" BodyPadding="5">
                <Items>
                    <ext:ComboBox ID="cboTipo" runat="server" FieldLabel="Tipo Actividad" Margin="5" ValueField="ID" DisplayField="Tipo" Flex="1" ForceSelection="true">
                        <Store>
                            <ext:Store ID="stTipo" runat="server">
                                <Model>
                                    <ext:Model ID="mdTipo" runat="server">
                                        <Fields>
                                            <ext:ModelField Name="ID" />
                                            <ext:ModelField Name="Tipo" />
                                        </Fields>
                                    </ext:Model>
                                </Model>
                            </ext:Store>
                        </Store>
                    </ext:ComboBox>
                    <ext:TextArea ID="txtDescripcion" runat="server" FieldLabel="Descripción" Margin="5" Flex="1" MaxLength="254" />
                </Items>
            </ext:FormPanel>
        </Items>
        <Buttons>
            <ext:Button ID="btnAgregar" runat="server" Margin="5" Text="Agregar" Icon="Accept">
                <DirectEvents>
                    <Click OnEvent="btnAgregar_Click">
                        <EventMask ShowMask="true" />
                        <Confirmation Title="Agregar Actividad" Message="¿Deseas Agregar esta Actividad?" ConfirmRequest="true" />
                    </Click>
                </DirectEvents>
            </ext:Button>
            <ext:Button ID="btnCancel" runat="server" Margin="5" Text="Cancelar" Icon="Cancel">
                <Listeners>
                    <Click Handler="#{wdwAdd}.close();" />
                </Listeners>
            </ext:Button>
        </Buttons>
    </ext:Window>
</asp:Content>
