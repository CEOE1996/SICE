Public Class Inicio
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            clsSQL.List("SELECT * FROM Alumno", CommandType.Text, "ConnectionString")
        End If
    End Sub

    Public Function ValidaUsuario() As Boolean
        Try
            If String.IsNullOrEmpty(txtUser.Text) OrElse
                String.IsNullOrEmpty(txtUser.Text) _
            Then
                Ext.Net.X.Msg.Alert("Error", "Favor de Llenar los Campos").Show()
                Return False
            End If

            clsSQL.AddParameter("@Codigo", txtUser.Text)
            clsSQL.AddParameter("@Contraseña", txtPass.Text)

            Dim lp_dt As DataTable = clsSQL.List("SPQ_ValidaUsuario")
            If lp_dt.Rows.Count > 0 Then
                VariablesSesion.NombreUsuario = lp_dt(0)("Nombre")
                VariablesSesion.Codigo = lp_dt(0)("Codigo")

                Return True
            Else
                Ext.Net.X.Msg.Alert("Error", "Usuario o Contraseña Invalido.<BR/> Vuelve a Intentarlo").Show()
                Return False
            End If
        Catch ex As Exception
            Ext.Net.X.Msg.Alert("Error", ex.Message).Show()
            Return False
        End Try
    End Function

    Public Sub btnIngresar_Click(sender As Object, e As Ext.Net.DirectEventArgs)
        If ValidaUsuario() Then Response.Redirect(ResolveUrl("Principal.aspx"))
    End Sub

End Class