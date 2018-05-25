Public Class clsCalendario
    Public Property ID As Integer
    Public Property Calendario As String
    Public Property Inicio As Nullable(Of DateTime)
    Public Property Fin As Nullable(Of DateTime)

    Public Shared Function List() As List(Of clsCalendario)
        Return clsSQL.List("SPQ_Calendario", CommandType.StoredProcedure, "ConnectionString").toList(Of clsCalendario)()
    End Function

    Public Shared Function GetActual() As clsCalendario
        Return clsSQL.List("SPQ_CalendarioActual", CommandType.StoredProcedure, "ConnectionString").toList(Of clsCalendario)().FirstOrDefault
    End Function

    Public Shared Function IsActive(ID As Integer) As Boolean
        clsSQL.AddParameter("@ID", ID)
        Return clsSQL.ExecScalar("SPQ_CalendarioActivo", CommandType.StoredProcedure, "ConnectionString")
    End Function

End Class
