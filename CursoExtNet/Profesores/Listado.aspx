<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master.Master" CodeBehind="Listado.aspx.vb" Inherits="CursoExtNet.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <ext:Viewport runat="server" Layout="FitLayout">
        <Content>
            <ext:GridPanel ID="gpListado" runat="server" Layout="FitLayout" Title="Listado de Materias" TitleAlign="Center" >
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
                        <ext:Column runat="server" 
                    </Columns>
                </ColumnModel>
            </ext:GridPanel>
        </Content>
    </ext:Viewport>
</asp:Content>
