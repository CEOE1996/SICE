Public Class AjusteHorario
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            stCalendario.Reload()
            Actualizar()
        End If
    End Sub

    <Ext.Net.DirectMethod()>
    Public Sub Actualizar()
        stAjuste.DataSource = clsAlumnoCarrera.ListByCoordi(
                                                            VariablesSesion.Codigo,
                                                            If(String.IsNullOrEmpty(cboCalendario.Value), clsCalendario.GetActual().ID, cboCalendario.Value)
                                                          )
        stAjuste.DataBind()
    End Sub

    Private Sub stCalendario_ReadData(sender As Object, e As Ext.Net.StoreReadDataEventArgs) Handles stCalendario.ReadData
        stCalendario.DataSource = clsCalendario.List()
        stCalendario.DataBind()
        cboCalendario.Value = clsCalendario.GetActual().ID
    End Sub

    Public Sub btnHorario_Click(sender As Object, e As Ext.Net.DirectEventArgs)
        ActualizaHorario(e.ExtraParams("ID"))
        hdID.Value = e.ExtraParams("ID")
        txtCodigo.Text = e.ExtraParams("Codigo")
        txtNombre.Text = e.ExtraParams("Nombre")
        wdwHorario.Show()
    End Sub

    Public Sub btnAdd_Click(sender As Object, e As Ext.Net.DirectEventArgs)
        ClearFields()
        stNRC.DataSource = clsSeccion.ListByAlumnoCarrera(hdID.Value, cboCalendario.Value)
        stNRC.DataBind()
        wdwAdd.Show()
    End Sub

    Private Sub ActualizaHorario(ID As Integer)
        stHorario.DataSource = clsSeccion.ListByAlumno(ID, cboCalendario.Value)
        stHorario.DataBind()
    End Sub

    Private Sub ClearFields()
        cboNRC.Clear()
        txtMateria.Clear()
        txtProfesor.Clear()
        txtSeccion.Clear()
        txtClave.Clear()
        txtAula.Clear()
    End Sub

    Public Sub btnDelete_Click(sender As Object, e As Ext.Net.DirectEventArgs)
        Try
            Dim R As String = clsAlumnoSeccion.Delete(e.ExtraParams("ID"))

            If R <> "" Then
                Ext.Net.X.Msg.Alert("Error", R).Show()
                Return
            End If
            ActualizaHorario(hdID.Value)
            Ext.Net.X.Msg.Notify("Eliminar Materia", "Materia Eliminada Satisfactoriamente").Show()

        Catch ex As Exception
            Ext.Net.X.Msg.Alert("Error", ex.Message).Show()
        End Try
    End Sub

    Public Sub btnAgregar_Click(sender As Object, e As Ext.Net.DirectEventArgs)
        Try
            Dim R As String = clsAlumnoSeccion.Add(hdID.Value, cboNRC.Value)

            If R <> "" Then
                Ext.Net.X.Msg.Alert("Error", R).Show()
                Return
            End If
            ActualizaHorario(hdID.Value)
            Ext.Net.X.Msg.Notify("Agregar Materia", "Se ha Agregado la Materia Satisfactoriamente").Show()
            wdwAdd.Close()

        Catch ex As Exception
            Ext.Net.X.Msg.Alert("Error", ex.Message).Show()

        End Try
    End Sub

End Class