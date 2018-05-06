Public Class VariablesSesion

    Public Shared ReadOnly Property ExistenVariables As Boolean
        Get
            If HttpContext.Current.Session.Count > 0 Then
                Return True
            Else
                Return False
            End If
        End Get
    End Property

    Public Shared Property NombreUsuario As String
        Get
            Return CType(HttpContext.Current.Session("NombreCompleto"), String)
        End Get
        Set(value As String)
            HttpContext.Current.Session("NombreCompleto") = value
        End Set
    End Property

    Public Shared Property Codigo As String
        Get
            Return CType(HttpContext.Current.Session("Codigo"), String)
        End Get
        Set(value As String)
            HttpContext.Current.Session("Codigo") = value
        End Set
    End Property
   
End Class