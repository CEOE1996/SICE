<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master.Master" CodeBehind="Alumnos.aspx.vb" Inherits="CursoExtNet.Alumnos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
    var Justificar = function (editor, e) {
            if (!(e.value === e.originalValue || (Ext.isDate(e.value) && Ext.Date.isEqual(e.value, e.originalValue)))) {
                App.direct.Justificar(e.record.data.ID, e.record.data);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <ext:Viewport runat="server" Layout="FitLayout">
        <Content>
            <ext:Hidden ID="hdID" runat="server" />
            <ext:Hidden ID="hdCoordi" runat="server" />
            <ext:GridPanel ID="gpAlumnos" runat="server" Layout="FitLayout" AnchorHorizontal="100%" AnchorVertical="70%" DefaultAnchor="100%" Scroll="Both">
                <TopBar>
                    <ext:Toolbar runat="server">
                        <Items>
                            <ext:ToolbarFill runat="server" />
                            <ext:Button ID="btnAsistencias" runat="server" Margin="5" Text="Ver Asistencias" Icon="BookMagnify">
                                <DirectEvents>
                                    <Click OnEvent="btnAsistencias_Click">
                                        <EventMask ShowMask="true" />
                                        <ExtraParams>
                                            <ext:Parameter Name="ID"     Value="#{gpAlumnos}.selModel.selected.items[0].data.ID"     Mode="Raw" />
                                            <ext:Parameter Name="Codigo" Value="#{gpAlumnos}.selModel.selected.items[0].data.Codigo" Mode="Raw" />
                                            <ext:Parameter Name="Nombre" Value="#{gpAlumnos}.selModel.selected.items[0].data.Nombre" Mode="Raw" />
                                        </ExtraParams>
                                    </Click>
                                </DirectEvents>
                                <Listeners>
                                    <Click Handler="#{gpAlumnos}.hasSelection();" />
                                </Listeners>
                            </ext:Button>
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
                        <ext:Column runat="server" DataIndex="Codigo"           Text="Código"       Width="150px" />
                        <ext:Column runat="server" DataIndex="Nombre"           Text="Nombre"       Flex="1" />
                        <ext:Column runat="server" DataIndex="Carrera"          Text="Carrera"      Width="250px" />
                    </Columns>
                </ColumnModel>
                <Plugins>
                    <ext:FilterHeader runat="server" />
                </Plugins>
            </ext:GridPanel>
        </Content>
    </ext:Viewport>
    <ext:Window ID="wdwAsistencias" runat="server" Title="Asistencias" TitleAlign="Center" Modal="true" Hidden="true" Width="550px" Height="400px" Layout="FitLayout">
        <TopBar>
            <ext:Toolbar runat="server">
                <Items>
                    <ext:TextField ID="txtCodigo" runat="server" FieldLabel="Código" Margin="5" ReadOnly="true" Flex="1" LabelWidth="70" />
                    <ext:TextField ID="txtNombre" runat="server" FieldLabel="Nombre" Margin="5" ReadOnly="true" Flex="2" LabelWidth="70" />
                </Items>
            </ext:Toolbar>
        </TopBar>
        <Items>
            <ext:GridPanel ID="gpAsistencias" runat="server" Layout="FitLayout" AnchorHorizontal="100%" AnchorVertical="100%" DefaultAnchor="100%" Margin="5">
                <Store>
                    <ext:Store ID="stAsistencias" runat="server">
                        <Model>
                            <ext:Model ID="mdAsistencias" runat="server">
                                <Fields>
                                    <ext:ModelField Name="ID" />
                                    <ext:ModelField Name="AlumnoSeccion" />
                                    <ext:ModelField Name="Clase" />
                                    <ext:ModelField Name="Fecha" />
                                    <ext:ModelField Name="Asistencia" />
                                </Fields>
                            </ext:Model>
                        </Model>
                    </ext:Store>
                </Store>
                <ColumnModel>
                    <Columns>
                        <ext:Column     runat="server" DataIndex="ID"               Text="ID"               Visible="false" />
                        <ext:Column     runat="server" DataIndex="AlumnoSeccion"    Text="AlumnoSeccion"    Visible="false" />
                        <ext:Column     runat="server" DataIndex="Clase"            Text="Clase"            Visible="false" />
                        <ext:DateColumn runat="server" DataIndex="Fecha"            Text="Fecha"            Flex="1"        Format="dd/MM/yyyy"/>
                        <ext:Column runat="server" DataIndex="Asistencia"       Text="Asistencia"       Flex="2"      >
                            <Editor>
                                <ext:ComboBox ID="cboJustificarAsis" runat="server" ValueField="ID" DisplayField="Descripcion" Editable="false"> 
                                    <Store>
                                        <ext:Store ID="stJustificarAsis" runat="server">
                                            <Model>
                                                <ext:Model ID="mdJustificarAsis" runat="server">
                                                    <Fields>
                                                        <ext:ModelField Name="ID" />
                                                        <ext:ModelField Name="Descripcion" />
                                                    </Fields>
                                                </ext:Model>
                                            </Model>
                                        </ext:Store>
                                    </Store>
                                </ext:ComboBox>
                            </Editor>
                        </ext:Column>
                    </Columns>
                </ColumnModel>
                <Plugins>
                    <ext:FilterHeader runat="server" />
                    <ext:CellEditing runat="server" ClicksToEdit="1">
                        <Listeners>
                            <Edit Fn="Justificar" />
                        </Listeners>
                    </ext:CellEditing>
                </Plugins>
            </ext:GridPanel>
        </Items>
        <Buttons>
            <ext:Button ID="btnRegresar" runat="server" Text="Regresar" Margin="5" Icon="DoorOut">
                <Listeners>
                    <Click Handler="#{wdwAsistencias}.close();" />
                </Listeners>
            </ext:Button>
        </Buttons>
    </ext:Window>
</asp:Content>
