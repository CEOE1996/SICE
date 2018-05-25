Public Class Asistencias
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            stAsistencias.DataSource = clsAlumnoClase.ListBySeccion(Request.QueryString("ID"), clsAlumnoSeccion.GetID(Request.QueryString("ID"), VariablesSesion.Codigo))
            stAsistencias.DataBind()
        End If
    End Sub


        
End Class