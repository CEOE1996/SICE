Public Class tblTiemposExtra
    Public Property tiempoExtra As Nullable(Of Int32)
    Public Property estatus As Nullable(Of Int32)
    Public Property estatusDesc As String
    Public Property fechaEmision As Nullable(Of DateTime)
    Public Property usuarioSolicta As Nullable(Of Int32)
    Public Property nombreSolicita As String
    Public Property sucursal As Nullable(Of Int32)
    Public Property sucursalDesc As String
    Public Property fechaRequerida As Nullable(Of DateTime)
    Public Property causaSolicita As Nullable(Of Int32)
    Public Property causaSolicitaDesc As String
    Public Property comentario As String
    Public Property cantidadHoras As Nullable(Of Int32)
    Public Property cantidadPersonas As Nullable(Of Int32)
    Public Property usuarioAutorizador As Nullable(Of Int32)
    Public Property nombreAutorizador As String
    Public Property causaAutorizador As Nullable(Of Int32)
    Public Property causaAutorizadorDesc As String
    Public Property cantidadHorasReales As Nullable(Of Int32)
    Public Property cantidadPersonasReales As Nullable(Of Int32)
    Public Property comentariosAutorizador As String
    Public Property fechaAutoriza As Nullable(Of DateTime)
    Public Property fechaCierre As Nullable(Of DateTime)
    Public Property ultimoCambio As Nullable(Of DateTime)
    Public Property usuarioCierre As Nullable(Of Int32)
    Public Property nombreCierre As String
    Public Property comentarioCierre As String

    Public Shared Function ObtenDatos(estatus As Integer, sucursal As Integer, tiempoextra As Integer) As List(Of tblTiemposExtra)
        clsSQL.AddParameter("@Estatus", estatus)
        clsSQL.AddParameter("@Sucursal", sucursal)
        clsSQL.AddParameter("@TiempoExtra", tiempoextra)

        Return clsSQL.List("SPQ_tiemposExtras", CommandType.StoredProcedure).toList(Of tblTiemposExtra)()

    End Function

End Class
