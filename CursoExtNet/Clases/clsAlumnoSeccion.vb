Public Class clsAlumnoSeccion
    Public Property ID As Integer
    Public Property Codigo As String
    Public Property Nombre As String
    Public Property Carrera As String

    Public Shared Function List(Seccion As Integer) As List(Of clsAlumnoSeccion)
        clsSQL.AddParameter("@Seccion", Seccion)
        Return clsSQL.List("SPQ_AlumnoSeccion", CommandType.StoredProcedure, "ConnectionString").toList(Of clsAlumnoSeccion)()
    End Function

    Public Shared Function Delete(AlumnoSeccion As Integer) As String
        clsSQL.AddParameter("@ID", AlumnoSeccion)
        Return clsSQL.ExecScalar("SPD_AlumnoSeccion", CommandType.StoredProcedure, "ConnectionString")
    End Function

    Public Shared Function Add(AlumnoCarrera As Integer, Seccion As Integer) As String
        clsSQL.AddParameter("@AlumnoCarrera", AlumnoCarrera)
        clsSQL.AddParameter("@Seccion", Seccion)
        Return clsSQL.ExecScalar("SPI_AlumnoSeccion", CommandType.StoredProcedure, "ConnectionString")
    End Function

    Public Shared Function GetID(Seccion As Integer, Alumno As Integer) As Integer
        clsSQL.AddParameter("@Seccion", Seccion)
        clsSQL.AddParameter("@Alumno", Alumno)
        Return clsSQL.ExecScalar("SPQ_GetAlumnoSeccion", CommandType.StoredProcedure, "ConnectionString")
    End Function

End Class
