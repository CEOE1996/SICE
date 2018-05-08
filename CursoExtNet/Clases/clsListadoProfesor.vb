Public Class clsListadoProfesor
    Public Property ID As Integer
    Public Property NRC As String
    Public Property Seccion As String
    Public Property ClaveMateria As String
    Public Property Materia As String
    Public Property Aula As String

    Public Shared Function List(Codigo As String, Calendario As Integer) As List(Of clsListadoProfesor)
        clsSQL.AddParameter("@Calendario", Calendario)
        clsSQL.AddParameter("@Codigo", Codigo)
        Return clsSQL.List("SPQ_ProfeListadoMaterias", CommandType.StoredProcedure, "ConnectionString").toList(Of clsListadoProfesor)()
    End Function

End Class
