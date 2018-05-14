Public Class clsActividadSeccion
    Public Property ID As Integer
    Public Property Tipo As String
    Public Property Descripcion As String
    Public Property FechaAlta As Nullable(Of DateTime)

    Public Shared Function List(Seccion As Integer) As List(Of clsActividadSeccion)
        clsSQL.AddParameter("@Seccion", Seccion)
        Return clsSQL.List("SPQ_ActividadSeccion", CommandType.StoredProcedure, "ConnectionStringCentro").toList(Of clsActividadSeccion)()
    End Function

    Public Shared Function Add(Seccion As Integer, Tipo As Integer, Descripcion As String) As String
        clsSQL.AddParameter("@Seccion", Seccion)
        clsSQL.AddParameter("@Tipo", Tipo)
        clsSQL.AddParameter("@Descripcion", Seccion)
        Return clsSQL.ExecScalar("SPI_ActividadesSeccion", CommandType.StoredProcedure, "ConnectionStringCentro")
    End Function

    Public Shared Function Delete(ID As Integer) As String
        clsSQL.AddParameter("@ID", ID)
        Return clsSQL.ExecScalar("SPD_ActividadSeccion", CommandType.StoredProcedure, "ConnectionStringCentro")
    End Function

End Class
