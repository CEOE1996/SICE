Public Class clsAlumnoCalificacion
    Public Property ID As Nullable(Of Integer)
    Public Property AlumnoSeccion As Nullable(Of Integer)
    Public Property CalificacionID As Nullable(Of Integer)
    Public Property Calificacion As String = ""
    Public Property FechaEntrega As Nullable(Of DateTime)

    Public Shared Function ListByCalificacionID(ID As Integer) As List(Of clsAlumnoCalificacion)
        clsSQL.AddParameter("@CalificacionID", ID)
        Return clsSQL.List("SPQ_AlumnoCalificacion", CommandType.StoredProcedure, "ConnectionStringCentro").toList(Of clsAlumnoCalificacion)()
    End Function

    Public Shared Function InsertUpdate(ID As Integer, AlumnoSeccion As Integer, CalificacionID As Integer, Calificacion As Decimal)
        clsSQL.AddParameter("@ID", ID)
        clsSQL.AddParameter("@AlumnoSeccion", AlumnoSeccion)
        clsSQL.AddParameter("@CalificacionID", CalificacionID)
        clsSQL.AddParameter("@Calificacion", Calificacion)
        Return clsSQL.ExecScalar("SPIU_AlumnoCalificacion", CommandType.StoredProcedure, "ConnectionStringCentro")
    End Function

End Class
