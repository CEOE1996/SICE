Public Class clsAlumnoClase
    Public Property ID As Nullable(Of Integer)
    Public Property AlumnoSeccion As Nullable(Of Integer)
    Public Property Clase As Nullable(Of Integer)
    Public Property Fecha As Nullable(Of DateTime)
    Public Property IDAsistencia As Nullable(Of Integer)
    Public Property Asistencia As String

    Public Shared Function ListBySeccion(Seccion As Integer, AlumnoSeccion As Integer) As List(Of clsAlumnoClase)
        clsSQL.AddParameter("@Seccion", Seccion)
        clsSQL.AddParameter("@AlumnoSeccion", AlumnoSeccion)
        Return clsSQL.List("SPQ_AlumnoClaseSeccion", CommandType.StoredProcedure, "ConnectionStringCentro").toList(Of clsAlumnoClase)()
    End Function

    Public Shared Function ListByClase(Clase As Integer) As List(Of clsAlumnoClase)
        clsSQL.AddParameter("@Clase", Clase)
        Return clsSQL.List("SPQ_AlumnoClase", CommandType.StoredProcedure, "ConnectionStringCentro").toList(Of clsAlumnoClase)()
    End Function

    Public Shared Function InsertUpdate(ID As Integer, Clase As Integer, Coordinador As Boolean, AlumnoSeccion As Integer, Asistencia As Integer) As String
        clsSQL.AddParameter("@ID", ID)
        clsSQL.AddParameter("@Clase", Clase)
        clsSQL.AddParameter("@Coordinador", Coordinador)
        clsSQL.AddParameter("@AlumnoSeccion", AlumnoSeccion)
        clsSQL.AddParameter("@Asistencia", Asistencia)
        Return clsSQL.ExecScalar("SPIU_AlumnoClase", CommandType.StoredProcedure, "ConnectionStringCentro")
    End Function

End Class
