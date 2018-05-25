Public Class Actividades
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            hdID.Value = Request.QueryString("ID")
            stActividades.Reload()
            stTipo.Reload()
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

    Public Sub FillEvaluar(CalificacionID As Integer)
        Dim EvaluarList = From A In clsAlumnoSeccion.List(hdID.Value)
                          Group Join E In clsAlumnoCalificacion.ListByCalificacionID(CalificacionID)
                            On A.ID Equals E.AlumnoSeccion Into eGroup = Group
                            From E In eGroup.DefaultIfEmpty()
                            Select New clsEvaluarAct With {
                                .ID = If(E Is Nothing, -1, E.ID),
                                .AlumnoSeccion = A.ID,
                                .Codigo = A.Codigo,
                                .Nombre = A.Nombre,
                                .Calificacion = If(E Is Nothing, "Sin Entregar", E.Calificacion),
                                .CalificacionID = CalificacionID,
                                .FechaEntrega = If(E Is Nothing, Nothing, E.FechaEntrega)
                            }

        stEvaluar.DataSource = EvaluarList
        stEvaluar.DataBind()
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

    Public Sub btnAct_Click(sender As Object, e As Ext.Net.DirectEventArgs)
        txtDescripcionAl.Text = e.ExtraParams("Descripcion")
        FillEvaluar(e.ExtraParams("ID"))
        wdwCalificar.Show()
    End Sub

    <Ext.Net.DirectMethod()>
    Public Sub Edit(Alumno As Integer, NewVal As String)
        If Not IsNumeric(NewVal) Then
            Ext.Net.X.Msg.Alert("Error", "Favor de Introducir un Valor").Show()
            gpEvaluar.GetStore().GetById(Alumno).Reject()
            Return
        End If

        If CDec(NewVal) < 0 OrElse CDec(NewVal) >= 100 Then
            Ext.Net.X.Msg.Alert("Error", "Favor de Introducir un Valor Entre 0 y 100").Show()
            gpEvaluar.GetStore().GetById(Alumno).Reject()
            Return
        End If
    End Sub

    Public Sub btnGuardar_Click(sender As Object, e As Ext.Net.DirectEventArgs)
        Try
            Dim Evaluar As Ext.Net.ChangeRecords(Of clsEvaluarAct) = New Ext.Net.StoreDataHandler(e.ExtraParams("Calificacion")).BatchObjectData(Of clsEvaluarAct)()
            Dim Res As String
            For Each i In Evaluar.Updated
                Res = clsAlumnoCalificacion.InsertUpdate(i.ID, i.AlumnoSeccion, i.CalificacionID, i.Calificacion)
                If Res <> "" Then
                    Ext.Net.X.Msg.Alert("Error", "Error al Actualizar Alumno " & i.Nombre & "<BR/>" & Res).Show()
                    Return
                End If
            Next

            Ext.Net.X.Msg.Notify("Guardar", "Se han guardado Calificaciones Satisfactoriamente").Show()
            wdwCalificar.Close()
        Catch ex As Exception
            Ext.Net.X.Msg.Alert("Error", ex.Message)
        End Try

    End Sub

End Class