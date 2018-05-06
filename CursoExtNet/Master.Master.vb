Public Class Master
    Inherits System.Web.UI.MasterPage

    Private Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        If Not VariablesSesion.ExistenVariables Then
            Response.Redirect(ResolveUrl("Inicio.aspx"))
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

End Class