Public Class clsProfesor
    Public Property Codigo As String
    Public Property Nombre As String

    Public Shared Function List(Jefe As Integer, Calendario As Integer) As List(Of clsProfesor)
        clsSQL.AddParameter("@Jefe", Jefe)
        clsSQL.AddParameter("@Calendario", Calendario)
        Return clsSQL.List("SPQ_ProfesorDep", CommandType.StoredProcedure, "ConnectionString").toList(Of clsProfesor)()
    End Function

End Class