Public Class clsEncuadre
    Public Property ID As Integer
    Public Property IDTipo As Integer
    Public Property TipoCalificacion As String
    Public Property Porcentaje As Nullable(Of Decimal)

    Public Shared Function List(Seccion As Integer) As List(Of clsEncuadre)
        clsSQL.AddParameter("@Seccion", Seccion)
        Return clsSQL.List("SPQ_EncuadreSeccion", CommandType.StoredProcedure, "ConnectionStringCentro").toList(Of clsEncuadre)()
    End Function

End Class
