<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Master.Master" CodeBehind="login.aspx.vb" Inherits="CursoExtNet.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <ext:Window ID="wdwLogIn" runat="server" Modal="true" Title="Iniciar Sesión" TitleAlign="Center" Width="400px" Height="300px" Layout="FitLayout">
        <Content>
            <ext:FormPanel runat="server" Margin="5" BodyPadding="5" Layout="AnchorLayout" AnchorHorizontal="100%" AnchorVertical="100%" DefaultAnchor="100%">
                <Items>
                    <ext:Image runat="server" ImageUrl="~/Imagenes/UDG2.png" Margin="5" AnchorHorizontal="100%" AnchorVertical="75%" DefaultAnchor="50%" />
                    <ext:TextField ID="txtUser" runat="server" Flex="1" FieldLabel="Usuario" AnchorHorizontal="100%" Margin="5" />
                    <ext:TextField ID="txtPass" runat="server" Flex="1" FieldLabel="Contraseña" AnchorHorizontal="100%"  Margin="5"/>
                </Items>
            </ext:FormPanel>
        </Content>
        <Buttons>
            <ext:Button ID="btnIngresar" runat="server" Text="Ingresar" Margin="5" Icon="Accept" />
        </Buttons>
    </ext:Window>
</asp:Content>
