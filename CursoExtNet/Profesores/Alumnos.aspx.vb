Public Class Alumnos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            hdID.Value = CInt(Request.QueryString("ID"))
            hdCoordi.Value = CInt(Request.QueryString("Coordi"))
            stAlumnos.Reload()
            stJustificarAsis.Reload()
        End If
    End Sub

    Private Sub stAlumnos_ReadData(sender As Object, e As Ext.Net.StoreReadDataEventArgs) Handles stAlumnos.ReadData
        stAlumnos.DataSource = clsAlumnoSeccion.List(hdID.Value)
        stAlumnos.DataBind()
    End Sub

    Public Sub btnAsistencias_Click(sender As Object, e As Ext.Net.DirectEventArgs)
        stAsistencias.DataSource = clsAlumnoClase.ListBySeccion(hdID.Value, e.ExtraParams("ID"))
        stAsistencias.DataBind()
        txtCodigo.Text = e.ExtraParams("Codigo")
        txtNombre.Text = e.ExtraParams("Nombre")
        wdwAsistencias.Show()
    End Sub

    Private Sub stJustificarAsis_ReadData(sender As Object, e As Ext.Net.StoreReadDataEventArgs) Handles stJustificarAsis.ReadData
        stJustificarAsis.DataSource = clsTipoAsistencia.List()
        stJustificarAsis.DataBind()
    End Sub

    <Ext.Net.DirectMethod()>
    Public Sub Justificar(ID As Integer, NewVal As clsAlumnoClase)
        Try
            If Not IsNumeric(NewVal.Asistencia) Then
                Ext.Net.X.Msg.Alert("Error", "Favor de Introducir un Valor Valido").Show()
                Return
            End If

            Dim r As String = clsAlumnoClase.InsertUpdate(NewVal.ID, NewVal.Clase, hdCoordi.Value, NewVal.AlumnoSeccion, NewVal.Asistencia)

            If r <> "" Then
                Ext.Net.X.Msg.Alert("Error", r).Show()
            End If

            stAsistencias.DataSource = clsAlumnoClase.ListBySeccion(hdID.Value, NewVal.AlumnoSeccion)
            stAsistencias.DataBind()

        Catch ex As Exception
            Ext.Net.X.Msg.Alert("Error", ex.Message).Show()
        End Try
    End Sub

End Class