Public Class clsListadoProfesor
    Public Property NRC As Integer
    Public Property Seccion As String
    Public Property ClaveMateria As String
    Public Property Materia As String
    Public Property Aula As String

    Public Shared Function List(Codigo As String) As List(Of clsListadoProfesor)
        clsSQL.AddParameter("@Codigo", Codigo)
        Return clsSQL.List("SPQ_ProfeListadoMaterias", CommandType.StoredProcedure, "ConnectionString").toList(Of clsListadoProfesor)()
    End Function

End Class
