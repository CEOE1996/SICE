Public Class clsTipoAsistencia
    Public Property ID As Integer
    Public Property Descripcion As String

    Public Shared Function List() As List(Of clsTipoAsistencia)
        Return clsSQL.List("SPQ_TipoAsistencia", CommandType.StoredProcedure, "ConnectionStringCentro").toList(Of clsTipoAsistencia)()
    End Function

End Class
