<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master.Master" CodeBehind="Asistencias.aspx.vb" Inherits="CursoExtNet.Asistencias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <ext:Viewport runat="server" Layout="FitLayout">
        <Content>
            <ext:GridPanel ID="gpAsistencias" runat="server" Layout="FitLayout" AnchorHorizontal="100%" AnchorVertical="100%" DefaultAnchor="100%" >
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
                        <ext:Column     runat="server" DataIndex="Asistencia"       Text="Asistencia"       Flex="2"      />
                    </Columns>
                </ColumnModel>
                <Plugins>
                    <ext:FilterHeader runat="server" />
                </Plugins>
            </ext:GridPanel>
        </Content> 
    </ext:Viewport>
</asp:Content>
