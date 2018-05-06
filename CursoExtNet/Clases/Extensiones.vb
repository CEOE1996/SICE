Imports System.Reflection

Module Extensiones
    <System.Runtime.CompilerServices.Extension()>
    Public Sub Fill(ddl As DropDownList, commandText As String, textField As String, valueField As String, Optional commandType As CommandType = CommandType.StoredProcedure, Optional connection As String = "connectionString")
        ddl.DataSource = clsSQL.List(commandText, commandType, connection)
        ddl.DataTextField = textField
        ddl.DataValueField = valueField
        ddl.DataBind()

        ddl.Items.Insert(0, New ListItem("Seleccione...", Nothing))
    End Sub

    <System.Runtime.CompilerServices.Extension()>
    Public Function ConvertToDataTable(Of T)(ByVal list As IList(Of T)) As DataTable
        Dim table As New DataTable()
        If list.Count > 0 Then
            Dim fields() = list.First.GetType.GetProperties
            For Each field In fields
                If Not field.PropertyType.IsGenericType Then
                    Table.Columns.Add(field.Name, field.PropertyType)
                Else : Table.Columns.Add(field.Name, Nullable.GetUnderlyingType(field.PropertyType))
                End If

            Next
            For Each item In list
                Dim row As DataRow = Table.NewRow()
                For Each field In fields
                    Dim p = item.GetType.GetProperty(field.Name)
                    row(field.Name) = p.GetValue(item, Nothing)
                Next
                Table.Rows.Add(row)
            Next
        End If
        Return Table
    End Function

    <System.Runtime.CompilerServices.Extension()>
    Public Function toList(Of T)(dt As DataTable) As List(Of T)
        Dim lp_List As New List(Of T)

        Try
            AutoMapper.Mapper.Reset()

            AutoMapper.Mapper.CreateMap(Of IDataReader, T)()
            lp_List = AutoMapper.Mapper.Map(Of IDataReader, List(Of T))(dt.CreateDataReader)
        Catch ex As Exception
            Throw ex
        End Try

        Return lp_List
    End Function
End Module
