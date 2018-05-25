<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master.Master" CodeBehind="AjusteHorario.aspx.vb" Inherits="CursoExtNet.AjusteHorario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        var cboNRC_Select = function (item, records) {
            if (records.length > 0) {
                App.txtMateria.setValue(records[0].data.Materia);
                App.txtClave.setValue(records[0].data.ClaveMateria);
                App.txtProfesor.setValue(records[0].data.Profesor);
                App.txtSeccion.setValue(records[0].data.Seccion);
                App.txtAula.setValue(records[0].data.Aula);
            }
            else {
                Ext.Msg.alert("Error", "NRC Inválido");
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <ext:Viewport runat="server" Layout="FitLayout">
        <Content>
            <ext:GridPanel ID="gpAjuste" runat="server" Title="Ajuste Horarios" TitleAlign="Center" Layout="FitLayout" Scroll="Both">
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
                            <ext:Button ID="btnHorario" runat="server" Text="Consultar Horario" Margin="5" Icon="CalendarEdit">
                                <DirectEvents>
                                    <Click OnEvent="btnHorario_Click">
                                        <EventMask ShowMask="true" />
                                        <ExtraParams>
                                            <ext:Parameter Name="ID"        Value="#{gpAjuste}.selModel.selected.items[0].data.ID"      Mode="Raw" />
                                            <ext:Parameter Name="Codigo"    Value="#{gpAjuste}.selModel.selected.items[0].data.Codigo"  Mode="Raw" />
                                            <ext:Parameter Name="Nombre"    Value="#{gpAjuste}.selModel.selected.items[0].data.Nombre"  Mode="Raw" />
                                        </ExtraParams>
                                    </Click>
                                </DirectEvents>
                                <Listeners>
                                    <Click Handler="#{gpAjuste}.hasSelection();" />
                                </Listeners>
                            </ext:Button>
                        </Items>
                    </ext:Toolbar>
                </TopBar>
                <Store>
                    <ext:Store ID="stAjuste" runat="server">
                        <Model>
                            <ext:Model ID="mdAjuste" runat="server">
                                <Fields>
                                    <ext:ModelField Name="ID" />
                                    <ext:ModelField Name="Codigo" />
                                    <ext:ModelField Name="Nombre" />
                                    <ext:ModelField Name="Estatus" />
                                    <ext:ModelField Name="Carrera" />
                                </Fields>
                            </ext:Model>
                        </Model>
                    </ext:Store>
                </Store>
                <ColumnModel>
                    <Columns>
                        <ext:Column runat="server" DataIndex="ID"       Text="ID"       Visible="false"/>
                        <ext:Column runat="server" DataIndex="Codigo"   Text="Código"   Width="150px"/>
                        <ext:Column runat="server" DataIndex="Nombre"   Text="Nombre"   Flex="1"/>
                        <ext:Column runat="server" DataIndex="Estatus"  Text="Estatus"  Width="100px"/>
                        <ext:Column runat="server" DataIndex="Carrera"  Text="Carrera"  Width="200px"/>
                    </Columns>
                </ColumnModel>
            </ext:GridPanel>
        </Content>
    </ext:Viewport>
    <ext:Window ID="wdwHorario" runat="server" Title="Horario Alumno" TitleAlign="Center" Modal="true" Hidden="true" Width="700px" Height="500px" Layout="FitLayout">
        <TopBar>
            <ext:Toolbar runat="server">
                <Items>
                    <ext:TextField ID="txtCodigo" runat="server" FieldLabel="Código" Margin="5" ReadOnly="true" Flex="1" LabelWidth="70" />
                    <ext:TextField ID="txtNombre" runat="server" FieldLabel="Nombre" Margin="5" ReadOnly="true" Flex="2" LabelWidth="70" />
                </Items>
            </ext:Toolbar>
        </TopBar>
        <Items>
            <ext:Hidden ID="hdID" runat="server" />
            <ext:GridPanel ID="gpHorario" runat="server" Layout="FitLayout" Margin="5" DefaultAnchor="100%" AnchorHorizontal="100%" AnchorVertical="100%">
                <Store>
                    <ext:Store ID="stHorario" runat="server">
                        <Model>
                            <ext:Model ID="mdHorario" runat="server">
                                <Fields>
                                    <ext:ModelField Name="ID" />
                                    <ext:ModelField Name="NRC" />
                                    <ext:ModelField Name="Seccion" />
                                    <ext:ModelField Name="ClaveMateria" />
                                    <ext:ModelField Name="Materia" />
                                    <ext:ModelField Name="Profesor" />
                                    <ext:ModelField Name="Aula" />
                                </Fields>
                            </ext:Model>
                        </Model>
                    </ext:Store>
                </Store>
                <ColumnModel>
                    <Columns>
                        <ext:Column runat="server" DataIndex="ID"           Text="ID"           Visible="false" />
                        <ext:Column runat="server" DataIndex="NRC"          Text="NRC"          Width="50px"/>
                        <ext:Column runat="server" DataIndex="Seccion"      Text="Seccion"      Width="60px"/>
                        <ext:Column runat="server" DataIndex="ClaveMateria" Text="ClaveMateria" Width="70px" />
                        <ext:Column runat="server" DataIndex="Materia"      Text="Materia"      Flex="1" />
                        <ext:Column runat="server" DataIndex="Profesor"     Text="Profesor"     Flex="1" />
                        <ext:Column runat="server" DataIndex="Aula"         Text="Aula"         Width="75px" />
                    </Columns>
                </ColumnModel>
                <Plugins>
                    <ext:FilterHeader runat="server" />
                </Plugins>
            </ext:GridPanel>
        </Items>
        <Buttons>
            <ext:Button ID="btnAdd" runat="server" Text="Agregar" Margin="5" Icon="Add">
                <DirectEvents>
                    <Click OnEvent="btnAdd_Click">
                        <EventMask ShowMask="true" />
                    </Click>
                </DirectEvents>
            </ext:Button>
            <ext:Button ID="btnDelete" runat="server" Text="Eliminar" Margin="5" Icon="Delete">
                <DirectEvents>
                    <Click OnEvent="btnDelete_Click">
                        <EventMask ShowMask="true" />
                        <Confirmation Message="¿Deseas Eliminar esta Materia del Horario del Alumno?" Title="Eliminar Materia" ConfirmRequest="true" />
                        <ExtraParams>
                            <ext:Parameter Name="ID" Value="#{gpHorario}.selModel.selected.items[0].data.ID" Mode="Raw" />
                        </ExtraParams>
                    </Click>
                </DirectEvents>
                <Listeners>
                    <Click Handler="#{gpHorario}.hasSelection();" />
                </Listeners>
            </ext:Button>
            <ext:Button ID="btnCerrar" runat="server" Text="Regresar" Margin="5" Icon="DoorOut">
                <Listeners>
                    <Click Handler="#{wdwHorario}.close();" />
                </Listeners>
            </ext:Button>
        </Buttons>
    </ext:Window>
    <ext:Window ID="wdwAdd" runat="server" Title="Agregar Clase" TitleAlign="Center" Layout="AnchorLayout" Modal="true" Hidden="true" Width="500px" Height="250px">
        <Items>
            <ext:FormPanel runat="server" Layout="AnchorLayout" AnchorHorizontal="100%" AnchorVertical="100%" DefaultAnchor="100%" Margin="5" BodyPadding="5"  >
                <Items>
                    <ext:ComboBox ID="cboNRC" runat="server" FieldLabel="NRC" Flex="1" ValueField="ID" DisplayField="NRC" QueryMode="Local" ForceSelection="true">
                        <Store>
                            <ext:Store ID="stNRC" runat="server">
                                <Model>
                                    <ext:Model ID="mdNRC" runat="server">
                                        <Fields>
                                            <ext:ModelField Name="ID" />
                                            <ext:ModelField Name="NRC" />
                                            <ext:ModelField Name="Seccion" />
                                            <ext:ModelField Name="ClaveMateria" />
                                            <ext:ModelField Name="Materia" />
                                            <ext:ModelField Name="Profesor" />
                                            <ext:ModelField Name="Aula" />
                                        </Fields>
                                    </ext:Model>
                                </Model>
                            </ext:Store>
                        </Store>
                        <ListConfig>
                            <ItemTpl runat="server">
                                <Html>
                                    <div style="font-size: 7pt; font-family: Tahoma">
                                        <b>{NRC}</b><BR />
                                        <span>{Clave} - {Materia}</span>
                                    </div>
                                </Html>
                            </ItemTpl>
                        </ListConfig>
                        <Listeners>
                            <Select Fn="cboNRC_Select" />
                        </Listeners>
                    </ext:ComboBox>
                    <ext:TextField ID="txtSeccion"  runat="server" FieldLabel="Seccion"  Flex="1" ReadOnly="true" IDMode="Static" />
                    <ext:TextField ID="txtClave"    runat="server" FieldLabel="Clave"    Flex="1" ReadOnly="true" IDMode="Static" />
                    <ext:TextField ID="txtMateria"  runat="server" FieldLabel="Materia"  Flex="1" ReadOnly="true" IDMode="Static" />
                    <ext:TextField ID="txtProfesor" runat="server" FieldLabel="Profesor" Flex="1" ReadOnly="true" IDMode="Static" />
                    <ext:TextField ID="txtAula"     runat="server" FieldLabel="Aula"     Flex="1" ReadOnly="true" IDMode="Static" />
                </Items>
            </ext:FormPanel>
        </Items>
        <Buttons>
            <ext:Button ID="btnAgregar" runat="server" Icon="Accept" Text="Agregar">
                <DirectEvents>
                    <Click OnEvent="btnAgregar_Click">
                        <Confirmation Message="¿Deseas Agregar Materia al Horario del Alumno?" Title="Agregar" ConfirmRequest="true" />
                        <EventMask ShowMask="true" />
                    </Click>
                </DirectEvents>
            </ext:Button>
            <ext:Button ID="btnCancelar" runat="server" Icon="DoorOut" Text="Cancelar">
                <Listeners>
                    <Click Handler="#{wdwAdd}.close();" />
                </Listeners>
            </ext:Button>
        </Buttons>
    </ext:Window>
</asp:Content>
