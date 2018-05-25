Public Class ListadoAlumno
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            stCalendario.Reload()
            Actualizar()
        End If
    End Sub

    <Ext.Net.DirectMethod()>
    Public Sub Actualizar()
        stListado.DataSource = clsSeccion.ListByAlumnoCodigo(
                                                                VariablesSesion.Codigo,
                                                                If(String.IsNullOrEmpty(cboCalendario.Value), clsCalendario.GetActual().ID, cboCalendario.Value)
                                                              )
        stListado.DataBind()
    End Sub

    Private Sub stListado_ReadData(sender As Object, e As Ext.Net.StoreReadDataEventArgs) Handles stListado.ReadData

    End Sub

    Private Sub stCalendario_ReadData(sender As Object, e As Ext.Net.StoreReadDataEventArgs) Handles stCalendario.ReadData
        stCalendario.DataSource = clsCalendario.List()
        stCalendario.DataBind()
        cboCalendario.Value = clsCalendario.GetActual().ID
    End Sub

    Public Sub btnEncuadre_Click(sender As Object, e As Ext.Net.DirectEventArgs)
        Response.Redirect(ResolveUrl(String.Format("Detalle.aspx?ID={0}&Calendario={1}&NRC={2}&Seccion={3}&Materia={4}&IDCalendario={5}",
                                                   e.ExtraParams("ID"),
                                                   cboCalendario.SelectedItem.Text,
                                                   e.ExtraParams("NRC"),
                                                   e.ExtraParams("Seccion"),
                                                   e.ExtraParams("Materia"),
                                                   cboCalendario.Value
                                                   )
                                               )
                                           )
    End Sub

End Class