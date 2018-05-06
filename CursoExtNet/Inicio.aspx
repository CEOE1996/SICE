<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Inicio.aspx.vb" Inherits="CursoExtNet.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <ext:ResourceManager runat="server" />
        <ext:Window ID="wdwLogIn" runat="server" Modal="true" Title="Iniciar Sesión" TitleAlign="Center" Width="410px" Height="300px" Layout="FitLayout">
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
                <ext:Button ID="btnIngresar" runat="server" Text="Ingresar" Margin="5" Icon="Accept" >
                    <DirectEvents>
                        <Click OnEvent="btnIngresar_Click" />
                    </DirectEvents>
                </ext:Button>
            </Buttons>
        </ext:Window>
    </div>
    </form>
</body>
</html>
