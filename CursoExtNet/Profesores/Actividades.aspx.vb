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

    Private Sub stTipo_ReadData(sender As Object, e As Ext.Net.StoreReadDataEventArgs) Handles stTipo.ReadData
        stTipo.DataSource = clsTipoCalificacion.ListSeccion(hdID.Value)
        stTipo.DataBind()
    End Sub

    <Ext.Net.DirectMethod()>
    Public Sub ClearFields()
        cboTipo.Clear()
        txtDescripcion.Clear()
    End Sub

    Public Sub btnAgregar_Click(sender As Object, e As Ext.Net.DirectEventArgs)
        Try
            If String.IsNullOrEmpty(cboTipo.Text) OrElse
                String.IsNullOrEmpty(txtDescripcion.Text) _
            Then
                Ext.Net.X.Msg.Alert("Error", "Favor de Llenar todos los Campos").Show()
                Return
            End If

            Dim Resultado As String = clsActividadSeccion.Add(hdID.Value, cboTipo.Value, txtDescripcion.Value)

            If Resultado <> "" Then
                Ext.Net.X.Msg.Alert("Error", Resultado).Show()
                Return
            End If

            stActividades.Reload()
            Ext.Net.X.Msg.Notify("Agregar", "Se ha Agregado Actividad Satisfactoriamente").Show()
            wdwAdd.Close()
        Catch ex As Exception
            Ext.Net.X.Msg.Alert("Error", ex.Message).Show()
        End Try
    End Sub

    Public Sub btnDelete_Click(sender As Object, e As Ext.Net.DirectEventArgs)
        Try
            Dim Resultado As String = clsActividadSeccion.Delete(e.ExtraParams("ID"))

            If Resultado <> "" Then
                Ext.Net.X.Msg.Alert("Error", Resultado).Show()
                Return
            End If

            stActividades.Reload()
            Ext.Net.X.Msg.Notify("Eliminar", "Se ha Eliminado Actividad Satisfactoriamente").Show()
            wdwAdd.Close()
        Catch ex As Exception
            Ext.Net.X.Msg.Alert("Error", ex.Message).Show()
        End Try
    End Sub

End Class