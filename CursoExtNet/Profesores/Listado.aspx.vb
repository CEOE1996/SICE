Public Class WebForm1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            stListado.Reload()
        End If
    End Sub

    Private Sub stListado_ReadData(sender As Object, e As Ext.Net.StoreReadDataEventArgs) Handles stListado.ReadData
        stListado.DataSource = clsListadoProfesor.List(VariablesSesion.Codigo)
        stListado.DataBind()
    End Sub

    Private Sub stCalendario_ReadData(sender As Object, e As Ext.Net.StoreReadDataEventArgs) Handles stCalendario.ReadData
        stCalendario.DataSource = clsCalendario.List()
        stCalendario.DataBind()
        cboCalendario.Value = clsCalendario.GetActual().ID
    End Sub
End Class