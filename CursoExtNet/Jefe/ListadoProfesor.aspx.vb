Public Class ListadoProfesor
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Actualizar()
            stCalendario.Reload()
        End If
    End Sub

    Private Sub stCalendario_ReadData(sender As Object, e As Ext.Net.StoreReadDataEventArgs) Handles stCalendario.ReadData
        stCalendario.DataSource = clsCalendario.List()
        stCalendario.DataBind()
        cboCalendario.Value = clsCalendario.GetActual().ID
    End Sub

    <Ext.Net.DirectMethod()>
    Public Sub Actualizar()
        stListadoProfe.DataSource = clsProfesor.List(
                                                        VariablesSesion.Codigo,
                                                        If(String.IsNullOrEmpty(cboCalendario.Value), clsCalendario.GetActual().ID, cboCalendario.Value)
                                                    )
    End Sub

End Class