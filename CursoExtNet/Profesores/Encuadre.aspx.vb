Public Class Encuadre
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            hdID.Value = CInt(Request.QueryString("ID"))
            If Request.QueryString("Editar") = 0 Then
                btnAdd.Hidden = True
                btnDelete.Hidden = True
            End If
            stEncuadre.Reload()
            stTipo.Reload()
        End If
    End Sub

    Private Sub stEncuadre_ReadData(sender As Object, e As Ext.Net.StoreReadDataEventArgs) Handles stEncuadre.ReadData
        stEncuadre.DataSource = clsEncuadre.List(hdID.value)
        stEncuadre.DataBind()
    End Sub

    Private Sub stTipo_ReadData(sender As Object, e As Ext.Net.StoreReadDataEventArgs) Handles stTipo.ReadData
        stTipo.DataSource = clsTipoCalificacion.List()
        stTipo.DataBind()
    End Sub

    <Ext.Net.DirectMethod()>
    Public Sub ClearFields()
        cboTipo.Clear()
        txtPorcentaje.Clear()
    End Sub

    Public Sub btnAgregar_Click(sender As Object, e As Ext.Net.DirectEventArgs)
        Try
            If String.IsNullOrEmpty(cboTipo.Text) OrElse
                String.IsNullOrEmpty(txtPorcentaje.Text) _
            Then
                Ext.Net.X.Msg.Alert("Error", "Favor de Llenar todos los Campos").Show()
                Return
            End If

            If txtPorcentaje.Value > 100 OrElse
                txtPorcentaje.Value <= 0 Then
                Ext.Net.X.Msg.Alert("Error", "Porcentaje Inválido").Show()
                Return
            End If

            Dim Resultado As String = clsEncuadre.Add(hdID.Value, cboTipo.Value, txtPorcentaje.Value)

            If Resultado <> "" Then
                Ext.Net.X.Msg.Alert("Error", Resultado).Show()
                Return
            End If

            stEncuadre.Reload()
            Ext.Net.X.Msg.Notify("Agregar", "Se ha Agregado Actividad Satisfactoriamente").Show()
            wdwAdd.Close()
        Catch ex As Exception
            Ext.Net.X.Msg.Alert("Error", ex.Message).Show()
        End Try
    End Sub

    Public Sub btnDelete_Click(sender As Object, e As Ext.Net.DirectEventArgs)
        Try
            Dim r As String = clsEncuadre.Delete(e.ExtraParams("ID"))

            If r <> "" Then
                Ext.Net.X.Msg.Notify("Error", r).Show()
                Return
            End If

            stEncuadre.Reload()
            Ext.Net.X.Msg.Notify("Eliminar", "Se ha Eliminado Actividad Satisfactoriamente").Show()
            wdwAdd.Close()
        Catch ex As Exception
            Ext.Net.X.Msg.Alert("Error", ex.Message).Show()
        End Try
    End Sub

End Class