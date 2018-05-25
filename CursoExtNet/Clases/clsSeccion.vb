Public Class clsSeccion
    Public Property ID As Integer
    Public Property NRC As String
    Public Property Seccion As String
    Public Property Profesor As String
    Public Property ClaveMateria As String
    Public Property Materia As String
    Public Property Aula As String

    Public Shared Function ObtenActual(Profesor As String)
        clsSQL.AddParameter("@Profesor", Profesor)
        clsSQL.AddParameter("@Registro", DateTime.Today)
        Return clsSQL.List("SPQ_ObtenClaseEnCurso", CommandType.StoredProcedure, "ConnectionString").toList(Of clsSeccion).FirstOrDefault
    End Function

    Public Shared Function ListByProfesor(Codigo As String, Calendario As Integer) As List(Of clsSeccion)
        clsSQL.AddParameter("@Calendario", Calendario)
        clsSQL.AddParameter("@Codigo", Codigo)
        Return clsSQL.List("SPQ_ProfeListadoMaterias", CommandType.StoredProcedure, "ConnectionString").toList(Of clsSeccion)()
    End Function

    Public Shared Function ListByCoordinador(Codigo As String, Calendario As Integer) As List(Of clsSeccion)
        clsSQL.AddParameter("@Calendario", Calendario)
        clsSQL.AddParameter("@Codigo", Codigo)
        Return clsSQL.List("SPQ_CoordinadorMaterias", CommandType.StoredProcedure, "ConnectionString").toList(Of clsSeccion)()
    End Function

    Public Shared Function ListByAlumno(AlumnoCarrera As Integer, Calendario As Integer) As List(Of clsSeccion)
        clsSQL.AddParameter("@AlumnoCarrera", AlumnoCarrera)
        clsSQL.AddParameter("@Calendario", Calendario)
        Return clsSQL.List("SPQ_AlumnoMaterias", CommandType.StoredProcedure, "ConnectionString").toList(Of clsSeccion)()
    End Function

    Public Shared Function ListByAlumnoCodigo(Codigo As Integer, Calendario As Integer) As List(Of clsSeccion)
        clsSQL.AddParameter("@Codigo", Codigo)
        clsSQL.AddParameter("@Calendario", Calendario)
        Return clsSQL.List("SPQ_AlumnoCodigo", CommandType.StoredProcedure, "ConnectionString").toList(Of clsSeccion)()
    End Function

    Public Shared Function ListByAlumnoCarrera(AlumnoCarrera As Integer, Calendario As Integer) As List(Of clsSeccion)
        clsSQL.AddParameter("@AlumnoCarrera", AlumnoCarrera)
        clsSQL.AddParameter("@Calendario", Calendario)
        Return clsSQL.List("SPQ_AddHorario", CommandType.StoredProcedure, "ConnectionString").toList(Of clsSeccion)()
    End Function

    Public Shared Function ListByDepartamento(Jefe As Integer, Calendario As Integer) As List(Of clsSeccion)
        clsSQL.AddParameter("@Jefe", Jefe)
        clsSQL.AddParameter("@Calendario", Calendario)
        Return clsSQL.List("SPQ_JefeSecciones", CommandType.StoredProcedure, "ConnectionString").toList(Of clsSeccion)()
    End Function

End Class
