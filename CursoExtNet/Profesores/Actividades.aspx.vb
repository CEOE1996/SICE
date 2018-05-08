Public Class Actividades
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            hdID.Value = Request.QueryString("ID")
            stActividades.Reload()
        End If
    End Sub

    Private Sub stActividades_ReadData(sender As Object, e As Ext.Net.StoreReadDataEventArgs) Handles stActividades.ReadData
        stActividades.DataSource = clsActividadSeccion.List(hdID.Value)
        stActividades.DataBind()
    End Sub
End Class