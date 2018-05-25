Public Class clsAlumnoCarrera
    Public Property ID As Integer
    Public Property Codigo As String
    Public Property Nombre As String
    Public Property Estatus As String
    Public Property Carrera As String

    Public Shared Function ListByCoordi(Coordinador As Integer, Calendario As Integer) As List(Of clsAlumnoCarrera)
        clsSQL.AddParameter("@Coordinador", Coordinador)
        clsSQL.AddParameter("@Calendario", Calendario)
        Return clsSQL.List("SPQ_AlumnoCarreraCoordi", CommandType.StoredProcedure, "ConnectionString").toList(Of clsAlumnoCarrera)()
    End Function

End Class
