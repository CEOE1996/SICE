Public Class clsAlumnoSeccion
    Public Property ID As Integer
    Public Property Codigo As String
    Public Property Nombre As String
    Public Property Carrera As String

    Public Shared Function List(Seccion As Integer) As List(Of clsAlumnoSeccion)
        clsSQL.AddParameter("@Seccion", Seccion)
        Return clsSQL.List("SPQ_AlumnoSeccion", CommandType.StoredProcedure, "ConnectionString").toList(Of clsAlumnoSeccion)()
    End Function

End Class
