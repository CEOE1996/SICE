Public Class clsActividadSeccion
    Public Property ID As Integer
    Public Property Tipo As String
    Public Property Descripcion As String
    Public Property FechaAlta As Nullable(Of DateTime)

    Public Shared Function List(Seccion As Integer) As List(Of clsActividadSeccion)
        clsSQL.AddParameter("@Seccion", Seccion)
        Return clsSQL.List("SPQ_ActividadSeccion", CommandType.StoredProcedure, "ConnectionStringCentro").toList(Of clsActividadSeccion)()
    End Function

End Class
