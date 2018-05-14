<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master.Master" CodeBehind="Encuadre.aspx.vb" Inherits="CursoExtNet.Encuadre" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .task .x-grid-cell-inner {
            padding-left: 15px;
        }

        .x-grid-row-summary .x-grid-cell-inner {
            font-weight: bold;
            font-size: 11px;
            background-color : #f1f2f4;
        }
        
        .total-field{
            background-color : #fff;
            padding          : 0px 1px 1px 1px;
            margin-right     : 1px;
            position: absolute;
        }

    </style>
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
                                <Listeners>
                                    <Click Handler="App.direct.ClearFields();
                                                    #{wdwAdd}.show();" />
                                </Listeners>
                            </ext:Button>
                            <ext:Button ID="btnDelete" runat="server" Text="Eliminar" Icon="Delete">
                                <DirectEvents>
                                    <Click OnEvent="btnDelete_Click">
                                        <EventMask ShowMask="true" />
                                        <Confirmation Title="Eliminar Encuadre" Message="¿Deseas Eliminar esta Actividad del Encuadre?" ConfirmRequest="true" />
                                        <ExtraParams>
                                            <ext:Parameter Name="ID" Value="#{gpEncuadre}.selModel.selected.items[0].data.ID" Mode="Raw" />
                                        </ExtraParams>
                                    </Click>
                                </DirectEvents>
                                <Listeners>
                                    <Click Handler="return #{gpEncuadre}.hasSelection();" />
                                </Listeners>
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
                        <ext:Column runat="server" DataIndex="TipoCalificacion" Text="TipoCalificacion" Flex="2" >
                                <SummaryRenderer Handler="return 'Total: '" />
                        </ext:Column>
                        <ext:Column runat="server" DataIndex="Porcentaje" Text="Porcentaje" Flex="1" SummaryType="Sum" >
                            <SummaryRenderer Fn="Ext.util.Format.numberRenderer('0,000,000,000')" />
                        </ext:Column>
                    </Columns>
                </ColumnModel>
                <View>
                    <ext:GridView runat="server" StripeRows="true" MarkDirty="false" />
                </View>
                <Features>
                    <ext:Summary runat="server" />
                </Features>
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
                    <ext:NumberField ID="txtPorcentaje" runat="server" FieldLabel="Porcentaje" Margin="5" AllowDecimals="false" />
                </Items>
            </ext:FormPanel>
        </Items>
        <Buttons>
            <ext:Button ID="btnAgregar" runat="server" Margin="5" Text="Agregar" Icon="Accept">
                <DirectEvents>
                    <Click OnEvent="btnAgregar_Click">
                        <EventMask ShowMask="true" />
                        <Confirmation Title="Agregar Encuadre" Message="¿Deseas Agregar esta Actividad al Encuadre?" ConfirmRequest="true" />
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
