<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master.Master" CodeBehind="DetalleSeccion.aspx.vb" Inherits="CursoExtNet.DetalleSeccion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .x-form-readonly input.x-form-field
        {
            color: Gray;
            opacity: 0.5;
        }
        
        .readonly-class input, .readonly-class textarea {
            color: Gray;
            opacity: 0.5;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <ext:Viewport runat="server" Layout="FitLayout">
        <Content>
            <ext:Panel ID="pnlAlumnos" runat="server" Title="Listado de Alumnos" TitleAlign="Center" Layout="FitLayout">
                <TopBar>
                    <ext:Toolbar runat="server">
                        <Items>
                            <ext:Hidden    ID="hdSeccion"       runat="server" />
                            <ext:TextField ID="txtCalendario"   runat="server" FieldLabel="Calendario"  Margin="5" Flex="1" ReadOnly="true"/>
                            <ext:TextField ID="txtNRC"          runat="server" FieldLabel="NRC"         Margin="5" Flex="1" ReadOnly="true"/>
                            <ext:TextField ID="txtSeccion"      runat="server" FieldLabel="Sección"     Margin="5" Flex="1" ReadOnly="true"/>
                            <ext:TextField ID="txtMateria"      runat="server" FieldLabel="Materia"     Margin="5" Flex="2" ReadOnly="true"/>
                        </Items>
                    </ext:Toolbar>
                </TopBar>
                <Loader runat="server" AutoLoad="true" Mode="Frame" Scripts="true" DisableCaching="true" Url="../Profesores/Alumnos.aspx?Coordi=1&ID=">
                    <LoadMask ShowMask="true" Msg="Cargando..." />
                </Loader>
                <Buttons>
                    <ext:Button ID="btnRegresar" runat="server" Text="Regresar" Icon="DoorOut" Margin="5">
                        <DirectEvents>
                            <Click OnEvent="btnRegresar_Click" />
                        </DirectEvents>
                    </ext:Button>
                </Buttons>
            </ext:Panel>
        </Content>
    </ext:Viewport>
</asp:Content>
