Public Class clsSQL

    <ThreadStatic()>
    Private Shared _Parametros As List(Of SqlClient.SqlParameter)

    <ThreadStatic()>
    Private Shared _OutputParametros As Hashtable

    <ThreadStatic()>
    Private Shared _CnnTran As SqlClient.SqlConnection

    <ThreadStatic()>
    Private Shared _Tran As SqlClient.SqlTransaction

    Public Shared ReadOnly Property OutputParametros As Hashtable
        Get
            Return _OutputParametros
        End Get
    End Property

    Public Shared Sub AddParameter(parameterName As String, value As Object, Optional direction As ParameterDirection = ParameterDirection.Input, Optional size As Integer = 0)
        Dim lp_Parmetro As New SqlClient.SqlParameter(parameterName, If(value Is Nothing, DBNull.Value, value)) With {.Direction = direction, .Size = size}

        If _Parametros Is Nothing Then _Parametros = New List(Of SqlClient.SqlParameter)

        _Parametros.Add(lp_Parmetro)
    End Sub

    Public Shared Sub AddParameter(parameterName As String, value As Object, direction As ParameterDirection, size As Integer, DbType As System.Data.SqlDbType)
        Dim lp_Parmetro As New SqlClient.SqlParameter(parameterName, If(value Is Nothing, DBNull.Value, value)) With {.Direction = direction, .Size = size, .SqlDbType = DbType}

        If _Parametros Is Nothing Then _Parametros = New List(Of SqlClient.SqlParameter)

        _Parametros.Add(lp_Parmetro)
    End Sub

    Public Shared Sub AddParameter(parameterName As String, dbType As SqlDbType, size As Integer, sourceColumn As String)
        Dim lp_Parmetro As New SqlClient.SqlParameter(parameterName, dbType, size, sourceColumn)

        If _Parametros Is Nothing Then _Parametros = New List(Of SqlClient.SqlParameter)

        _Parametros.Add(lp_Parmetro)
    End Sub

    Private Shared Function GetConnectionString(connection As String) As String
        Dim lp_Conexion As String = ""

        lp_Conexion = ConfigurationManager.ConnectionStrings(connection).ConnectionString

        If String.IsNullOrWhiteSpace(lp_Conexion) Then
            Throw New Exception("Cadena de Conexion no valida")
        End If

        Return lp_Conexion
    End Function

    Public Shared Function List(commandText As String, Optional commandType As CommandType = CommandType.StoredProcedure, Optional connection As String = "connectionString") As DataTable
        Dim lp_Cmd As New SqlClient.SqlCommand
        Dim lp_da As New SqlClient.SqlDataAdapter
        Dim lp_Cnn As New SqlClient.SqlConnection(GetConnectionString(connection))
        Dim lp_dt As New DataTable

        lp_Cmd.CommandTimeout = 60 * 5
        lp_Cmd.CommandText = commandText
        lp_Cmd.CommandType = commandType
        lp_Cmd.Connection = lp_Cnn

        If Not _Parametros Is Nothing AndAlso _Parametros.Count > 0 Then
            lp_Cmd.Parameters.AddRange(_Parametros.ToArray)
            _Parametros.Clear()
        End If

        lp_da.SelectCommand = lp_Cmd
        lp_da.Fill(lp_dt)

        If _OutputParametros Is Nothing Then _OutputParametros = New Hashtable Else _OutputParametros.Clear()
        For Each parameter As SqlClient.SqlParameter In lp_Cmd.Parameters
            If parameter.Direction = ParameterDirection.Output Then
                _OutputParametros.Add(parameter.ParameterName, parameter.Value)
            End If
        Next

        Return lp_dt
    End Function

    Public Shared Function ExecNonQuery(commandText As String, Optional commandType As CommandType = CommandType.StoredProcedure, Optional connection As String = "connectionString") As Integer
        Dim lp_Cmd As New SqlClient.SqlCommand
        Dim lp_Cnn As New SqlClient.SqlConnection(GetConnectionString(connection))
        Dim lp_Resultado As Integer = 0

        lp_Cmd.CommandTimeout = 60 * 5
        lp_Cmd.CommandText = commandText
        lp_Cmd.CommandType = commandType
        lp_Cmd.Connection = lp_Cnn

        If Not _Parametros Is Nothing AndAlso _Parametros.Count > 0 Then
            lp_Cmd.Parameters.AddRange(_Parametros.ToArray)
            _Parametros.Clear()
        End If

        Try
            lp_Cnn.Open()
            lp_Resultado = lp_Cmd.ExecuteNonQuery()

            If _OutputParametros Is Nothing Then _OutputParametros = New Hashtable Else _OutputParametros.Clear()
            For Each parameter As SqlClient.SqlParameter In lp_Cmd.Parameters
                If parameter.Direction = ParameterDirection.Output Then
                    _OutputParametros.Add(parameter.ParameterName, parameter.Value)
                End If
            Next
        Catch ex As Exception
            Throw ex
        Finally
            If lp_Cnn.State = ConnectionState.Open Then
                lp_Cnn.Close()
            End If
        End Try

        Return lp_Resultado
    End Function

    Public Shared Function ExecScalar(commandText As String, Optional commandType As CommandType = CommandType.StoredProcedure, Optional connection As String = "connectionString") As Object
        Dim lp_Cmd As New SqlClient.SqlCommand
        Dim lp_Cnn As New SqlClient.SqlConnection(GetConnectionString(connection))
        Dim lp_Resultado As Object = Nothing

        lp_Cmd.CommandTimeout = 60 * 5
        lp_Cmd.CommandText = commandText
        lp_Cmd.CommandType = commandType
        lp_Cmd.Connection = lp_Cnn

        If Not _Parametros Is Nothing AndAlso _Parametros.Count > 0 Then
            lp_Cmd.Parameters.AddRange(_Parametros.ToArray)
            _Parametros.Clear()
        End If

        Try
            lp_Cnn.Open()
            lp_Resultado = lp_Cmd.ExecuteScalar
        Catch ex As Exception
            Throw ex
        Finally
            If lp_Cnn.State = ConnectionState.Open Then
                lp_Cnn.Close()
            End If
        End Try

        Return lp_Resultado
    End Function

    Public Shared Function insertCommand(commandText As String, dataTable As DataTable, Optional commandType As CommandType = CommandType.StoredProcedure, Optional connection As String = "connectionString") As DataTable
        Dim lp_Cmd As New SqlClient.SqlCommand
        Dim lp_da As New SqlClient.SqlDataAdapter
        Dim lp_Cnn As New SqlClient.SqlConnection(GetConnectionString(connection))

        lp_Cmd.CommandTimeout = 60 * 5
        lp_Cmd.CommandText = commandText
        lp_Cmd.CommandType = commandType
        lp_Cmd.Connection = lp_Cnn

        If Not _Parametros Is Nothing AndAlso _Parametros.Count > 0 Then
            lp_Cmd.Parameters.AddRange(_Parametros.ToArray)
            _Parametros.Clear()
        End If

        lp_da.InsertCommand = lp_Cmd
        lp_da.Update(dataTable)

        Return dataTable
    End Function

    Public Shared Function updateCommand(commandText As String, dataTable As DataTable, Optional commandType As CommandType = CommandType.StoredProcedure, Optional connection As String = "connectionString") As DataTable
        Dim lp_Cmd As New SqlClient.SqlCommand
        Dim lp_da As New SqlClient.SqlDataAdapter
        Dim lp_Cnn As New SqlClient.SqlConnection(GetConnectionString(connection))

        lp_Cmd.CommandTimeout = 60 * 5
        lp_Cmd.CommandText = commandText
        lp_Cmd.CommandType = commandType
        lp_Cmd.Connection = lp_Cnn

        If Not _Parametros Is Nothing AndAlso _Parametros.Count > 0 Then
            lp_Cmd.Parameters.AddRange(_Parametros.ToArray)
            _Parametros.Clear()
        End If

        lp_da.UpdateCommand = lp_Cmd
        lp_da.Update(dataTable)

        Return dataTable
    End Function

    Public Shared Function deleteCommand(commandText As String, dataTable As DataTable, Optional commandType As CommandType = CommandType.StoredProcedure, Optional connection As String = "connectionString") As DataTable
        Dim lp_Cmd As New SqlClient.SqlCommand
        Dim lp_da As New SqlClient.SqlDataAdapter
        Dim lp_Cnn As New SqlClient.SqlConnection(GetConnectionString(connection))

        lp_Cmd.CommandTimeout = 60 * 5
        lp_Cmd.CommandText = commandText
        lp_Cmd.CommandType = commandType
        lp_Cmd.Connection = lp_Cnn

        If Not _Parametros Is Nothing AndAlso _Parametros.Count > 0 Then
            lp_Cmd.Parameters.AddRange(_Parametros.ToArray)
            _Parametros.Clear()
        End If

        lp_da.DeleteCommand = lp_Cmd
        lp_da.Update(dataTable)

        Return dataTable
    End Function

    Public Shared Function isTransactionActive()
        If _Tran Is Nothing Then
            Return False
        End If
        Return True
    End Function

    Public Shared Sub beginTran(Optional connection As String = "connectionString")
        _CnnTran = New SqlClient.SqlConnection(GetConnectionString(connection))
        _CnnTran.Open()
        _Tran = _CnnTran.BeginTransaction
    End Sub

    Public Shared Sub commitTran()
        _Tran.Commit()
        _CnnTran.Close()
        _CnnTran.Dispose()
    End Sub

    Public Shared Sub rollBack()
        _Tran.Rollback()
        _CnnTran.Close()
        _CnnTran.Dispose()
    End Sub

    Public Shared Function ExecScalarTran(commandText As String, Optional commandType As CommandType = CommandType.StoredProcedure) As Object
        Dim lp_Cmd As New SqlClient.SqlCommand
        Dim lp_Resultado As Object = Nothing

        lp_Cmd.CommandTimeout = 60 * 5
        lp_Cmd.CommandText = commandText
        lp_Cmd.CommandType = commandType
        lp_Cmd.Connection = _CnnTran
        lp_Cmd.Transaction = _Tran

        If Not _Parametros Is Nothing AndAlso _Parametros.Count > 0 Then
            lp_Cmd.Parameters.AddRange(_Parametros.ToArray)
            _Parametros.Clear()
        End If

        Try
            lp_Resultado = lp_Cmd.ExecuteScalar
        Catch ex As Exception
            Throw ex
        End Try

        Return lp_Resultado
    End Function

    Public Shared Function ExecNonQueryTran(commandText As String, Optional commandType As CommandType = CommandType.StoredProcedure) As Integer
        Dim lp_Cmd As New SqlClient.SqlCommand
        Dim lp_Resultado As Integer = 0

        lp_Cmd.CommandTimeout = 60 * 5
        lp_Cmd.CommandText = commandText
        lp_Cmd.CommandType = commandType
        lp_Cmd.Connection = _CnnTran
        lp_Cmd.Transaction = _Tran

        If Not _Parametros Is Nothing AndAlso _Parametros.Count > 0 Then
            lp_Cmd.Parameters.AddRange(_Parametros.ToArray)
            _Parametros.Clear()
        End If

        Try
            lp_Resultado = lp_Cmd.ExecuteNonQuery()
        Catch ex As Exception
            Throw ex
        End Try

        Return lp_Resultado
    End Function

    Public Shared Function ListTran(commandText As String, Optional commandType As CommandType = CommandType.StoredProcedure) As DataTable
        Dim lp_Cmd As New SqlClient.SqlCommand
        Dim lp_da As New SqlClient.SqlDataAdapter
        Dim lp_dt As New DataTable

        lp_Cmd.CommandTimeout = 60 * 5
        lp_Cmd.CommandText = commandText
        lp_Cmd.CommandType = commandType
        lp_Cmd.Connection = _CnnTran
        lp_Cmd.Transaction = _Tran

        If Not _Parametros Is Nothing AndAlso _Parametros.Count > 0 Then
            lp_Cmd.Parameters.AddRange(_Parametros.ToArray)
            _Parametros.Clear()
        End If

        lp_da.SelectCommand = lp_Cmd
        lp_da.Fill(lp_dt)

        Return lp_dt
    End Function

    Public Shared ReadOnly Property SPID As Int32
        Get
            If isTransactionActive() Then
                Return ExecScalarTran("SELECT @@SPID", CommandType.Text)
            End If
            Return 0
        End Get
    End Property

    Public Shared Function ObtenPropiedades(dt As DataTable) As DataTable
        Dim lp_dt As New DataTable
        Dim lp_row As String
        lp_dt.Columns.Add("propiedad")

        For Each item As DataColumn In dt.Columns
            If item.AllowDBNull AndAlso item.DataType.ToString <> "System.String" Then
                lp_row = "Public Property " & item.ColumnName & " as Nullable(Of " & Replace(item.DataType.ToString(), "System.", "") & ")"
            Else
                lp_row = "Public Property " & item.ColumnName & " as " & Replace(item.DataType.ToString(), "System.", "")
            End If

            lp_dt.Rows.Add(lp_row)
        Next

        Return lp_dt
    End Function

    Public Shared Function ObtenModel(dt As DataTable) As DataTable
        Dim lp_dt As New DataTable
        Dim lp_row As String
        lp_dt.Columns.Add("propiedad")

        
        For Each item As DataColumn In dt.Columns
            lp_row = "<ext:ModelField Name='" & item.ColumnName & "' Type='" & TipoDato(Replace(item.DataType.ToString(), "System.", "")) & "' />"
            lp_row = lp_row.Replace("'", Chr(34))
            lp_dt.Rows.Add(lp_row)
        Next

        Return lp_dt
    End Function

    Private Shared Function TipoDato(dato) As String
        Dim lp_Resultado As String
        Select Case dato
            Case "Boolean"
                lp_Resultado = "Boolean"
            Case "DateTime"
                lp_Resultado = "Date"
            Case "Decimal", "Double", "Single"
                lp_Resultado = "Float"
            Case "Int16", "Int32", "Int64", "UInt16", "UInt32", "UInt64"
                lp_Resultado = "Int"
            Case "Char", "String"
                lp_Resultado = "String"
            Case Else
                lp_Resultado = "Auto"
        End Select

        Return lp_Resultado
    End Function
    
    Public Shared Function ObtenColumns(dt As DataTable) As DataTable
        Dim lp_dt As New DataTable
        Dim lp_row As String
        lp_dt.Columns.Add("propiedad")

        For Each item As DataColumn In dt.Columns
            lp_row = "<ext:Column ID='" & item.ColumnName & "' runat='server' Text='" & item.ColumnName & "' DataIndex='" & item.ColumnName & "'/>"
            lp_row = lp_row.Replace("'", Chr(34))

            lp_dt.Rows.Add(lp_row)
        Next

        Return lp_dt
    End Function

    Public Shared Sub BulkLoadData(dt As DataTable, Optional connection As String = "connectionString")
        clsSQL.ExecNonQuery("truncate table " & dt.TableName, CommandType.Text, connection)

        Using lp_Conn As New SqlClient.SqlConnection(GetConnectionString(connection))
            Using lp_BulkCopy As New SqlClient.SqlBulkCopy(lp_Conn, SqlClient.SqlBulkCopyOptions.TableLock, Nothing)
                lp_BulkCopy.DestinationTableName = dt.TableName
                lp_BulkCopy.BulkCopyTimeout = 60
                For Each column As DataColumn In dt.Columns
                    lp_BulkCopy.ColumnMappings.Add(column.ColumnName, column.ColumnName)
                Next
                lp_Conn.Open()
                lp_BulkCopy.WriteToServer(dt)
                lp_BulkCopy.Close()
            End Using
        End Using
    End Sub
End Class
