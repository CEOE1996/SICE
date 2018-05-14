Public Class clsTipoCalificacion
    Public Property ID As Integer
    Public Property Tipo As String

    Public Shared Function List() As List(Of clsTipoCalificacion)
        Return clsSQL.List("SPQ_TipoCalificacion", CommandType.StoredProcedure, "ConnectionStringCentro").toList(Of clsTipoCalificacion)()
    End Function

    Public Shared Function ListSeccion(Seccion As Integer) As List(Of clsTipoCalificacion)
        clsSQL.AddParameter("@Seccion", Seccion)
        Return clsSQL.List("SPQ_TipoSeccion", CommandType.StoredProcedure, "ConnectionStringCentro").toList(Of clsTipoCalificacion)()
    End Function
End Class
