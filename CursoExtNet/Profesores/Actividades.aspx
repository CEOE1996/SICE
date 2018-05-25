<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master.Master" CodeBehind="Actividades.aspx.vb" Inherits="CursoExtNet.Actividades" %>
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
                                <DirectEvents>
                                    <Click OnEvent="btnAct_Click">
                                        <ExtraParams>
                                            <ext:Parameter Name="ID"            Value="#{gpActividades}.selModel.selected.items[0].data.ID"          Mode="Raw" />
                                            <ext:Parameter Name="Descripcion"   Value="#{gpActividades}.selModel.selected.items[0].data.Descripcion" Mode="Raw" />
                                        </ExtraParams>
                                    </Click>
                                </DirectEvents>
                                <Listeners>
                                    <Click Handler="#{gpActividades}.hasSelection();" />
                                </Listeners>
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
    <ext:Window ID="wdwCalificar" runat="server" Title="Evaluar Actividades" TitleAlign="Center" Modal="true" Hidden="true" Width="600px" Height="400px" Layout="AnchorLayout">
        <TopBar>
            <ext:Toolbar runat="server">
                <Items>
                    <ext:TextField ID="txtDescripcionAl" runat="server" FieldLabel="Descripción" Flex="1" Margin="5" ReadOnly="true" />
                </Items>
            </ext:Toolbar>
        </TopBar>
        <Items>
            <ext:GridPanel ID="gpEvaluar" runat="server" Layout="FitLayout" DefaultAnchor="100%" AnchorHorizontal="100%" AnchorVertical="100%" Scroll="Both">
                <Store>
                    <ext:Store ID="stEvaluar" runat="server">
                        <Model>
                            <ext:Model ID="mdEvaluar" runat="server" IDProperty="AlumnoSeccion">
                                <Fields>
                                    <ext:ModelField Name="ID" />
                                    <ext:ModelField Name="AlumnoSeccion"    Type="Int" />
                                    <ext:ModelField Name="Codigo" />
                                    <ext:ModelField Name="Nombre" />
                                    <ext:ModelField Name="CalificacionID" />
                                    <ext:ModelField Name="Calificacion" />
                                    <ext:ModelField Name="FechaEntrega" />
                                </Fields>
                            </ext:Model>
                        </Model>
                    </ext:Store>
                </Store>
                <ColumnModel>
                    <Columns>
                        <ext:Column     runat="server" DataIndex="ID"               Text="ID"               Visible="false" />
                        <ext:Column     runat="server" DataIndex="AlumnoSeccion"    Text="AlumnoSeccion"    Visible="false"/>
                        <ext:Column     runat="server" DataIndex="CalificacionID"   Text="CalificacionID"   Visible="false"/>
                        <ext:Column     runat="server" DataIndex="Codigo"           Text="Código"           Width="125px"/>
                        <ext:Column     runat="server" DataIndex="Nombre"           Text="Nombre"           Width="200px"/>
                        <ext:Column     runat="server" DataIndex="Calificacion"     Text="Calificación"     Width="100px">
                            <Editor>
                                <ext:NumberField ID="txtCalificacion" runat="server" />
                            </Editor>
                        </ext:Column>
                        <ext:DateColumn runat="server" DataIndex="FechaEntrega"     Text="Fecha Entrega"    Width="100px"    Format="dd/MM/yyyy"/>
                    </Columns>
                </ColumnModel>
                <Plugins>
                    <ext:CellEditing runat="server" ClicksToEdit="1">
                        <Listeners>
                            <Edit Fn="edit" />
                        </Listeners>
                    </ext:CellEditing>
                    <ext:FilterHeader runat="server" />
                </Plugins>
            </ext:GridPanel>
        </Items>
        <Buttons>
            <ext:Button ID="btnGuardar" runat="server" Text="Guardar" Margin="5" Icon="Disk">
                <DirectEvents>
                    <Click OnEvent="btnGuardar_Click">
                        <EventMask ShowMask="true" />
                        <Confirmation Message="¿Deseas Guardar Nuevas Calificaciones?" Title="Guardar" ConfirmRequest="true" />
                        <ExtraParams>
                            <ext:Parameter Name="Calificacion" Value="#{stEvaluar}.getChangedData()" Mode="Raw" />                                            
                        </ExtraParams>
                    </Click>
                </DirectEvents>
            </ext:Button>
            <ext:Button ID="btnCerrar" runat="server" Text="Regresar" Margin="5" Icon="DoorOut">
                <Listeners>
                    <Click Handler="#{wdwCalificar}.close();" />
                </Listeners>
            </ext:Button>
        </Buttons>
    </ext:Window>
</asp:Content>
