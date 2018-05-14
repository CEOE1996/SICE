Public Class clsEncuadre
    Public Property ID As Integer
    Public Property IDTipo As Integer
    Public Property TipoCalificacion As String
    Public Property Porcentaje As Nullable(Of Integer)

    Public Shared Function List(Seccion As Integer) As List(Of clsEncuadre)
        clsSQL.AddParameter("@Seccion", Seccion)
        Return clsSQL.List("SPQ_EncuadreSeccion", CommandType.StoredProcedure, "ConnectionStringCentro").toList(Of clsEncuadre)()
    End Function

    Public Shared Function Add(Seccion As Integer, Tipo As Integer, Porcentaje As Integer) As String
        clsSQL.AddParameter("@Seccion", Seccion)
        clsSQL.AddParameter("@Tipo", Tipo)
        clsSQL.AddParameter("@Porcentaje", Porcentaje)
        Return clsSQL.ExecScalar("SPI_EncuadreSeccion", CommandType.StoredProcedure, "ConnectionStringCentro")
    End Function

    Public Shared Sub Delete(ID As Integer)
        clsSQL.AddParameter("@ID", ID)
        clsSQL.ExecNonQuery("SPD_EncuadreSeccion", CommandType.StoredProcedure, "ConnectionStringCentro")
    End Sub

End Class
