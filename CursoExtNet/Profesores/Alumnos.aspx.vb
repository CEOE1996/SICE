Public Class Alumnos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            hdID.Value = CInt(Request.QueryString("ID"))
            stAlumnos.Reload()
        End If
    End Sub

    Private Sub stAlumnos_ReadData(sender As Object, e As Ext.Net.StoreReadDataEventArgs) Handles stAlumnos.ReadData
        stAlumnos.DataSource = clsAlumnoSeccion.List(hdID.Value)
        stAlumnos.DataBind()
    End Sub
End Class