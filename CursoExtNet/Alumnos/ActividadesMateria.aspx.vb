Public Class ActividadesMateria
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            stActividades.DataSource = clsActividadSeccion.ListByAlumno(Request.QueryString("ID"), clsAlumnoSeccion.GetID(Request.QueryString("ID"), VariablesSesion.Codigo))
            stActividades.DataBind()
        End If
    End Sub
    
End Class