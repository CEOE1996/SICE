Imports System.Net

Public Class utilerias
    
    Private Shared Function getFormatoReporte(formato As FormatoReporte)
        Select Case formato
            Case FormatoReporte.CSV
                Return "CSV"
            Case FormatoReporte.IMAGE
                Return "IMAGE"
            Case FormatoReporte.MHTML
                Return "MHTML"
            Case FormatoReporte.PDF
                Return "PDF"
            Case FormatoReporte.WORD
                Return "WORD"
            Case Else
                Return ""
        End Select
    End Function

    Public Shared Function GuardaArchivo(archivo As Byte(), nombreArchivo As String) As Boolean
        Dim lp_Directorio As String = IO.Path.GetDirectoryName(nombreArchivo)

        If Not IO.Directory.Exists(lp_Directorio) Then IO.Directory.CreateDirectory(lp_Directorio)

        Dim lp_fileStream As IO.FileStream = IO.File.Create(nombreArchivo)

        lp_fileStream.Write(archivo, 0, archivo.Length)
        lp_fileStream.Close()

        If IO.File.Exists(nombreArchivo) Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Shared Function GuardaXML(contenido As String, nombreArchivo As String) As Boolean
        Dim lp_Directorio As String = IO.Path.GetDirectoryName(nombreArchivo)

        If Not IO.Directory.Exists(lp_Directorio) Then IO.Directory.CreateDirectory(lp_Directorio)

        Dim lp_Document As New System.Xml.XmlDocument
        lp_Document.LoadXml(contenido)

        Dim lp_fileStream As IO.FileStream = IO.File.Create(nombreArchivo)
        lp_Document.Save(lp_fileStream)
        lp_fileStream.Close()

        If IO.File.Exists(nombreArchivo) Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Shared Sub EnviaCorreo(subject As String, destinatario As String, Adjuntos As List(Of String))
        Dim lp_Mail As New Net.Mail.SmtpClient
        Dim lp_Msg As New Net.Mail.MailMessage

        lp_Msg.To.Add(destinatario)

        For Each item In ConfigurationManager.AppSettings("correosBCC").Split(";")
            lp_Msg.Bcc.Add(item)
        Next

        lp_Msg.Subject = subject

        For Each item As String In Adjuntos
            lp_Msg.Attachments.Add(New Net.Mail.Attachment(item))
        Next

        lp_Mail.Send(lp_Msg)
    End Sub

    Public Shared Sub MuestraArchivo(nombreArchivo As String, Archivo As Byte(), contentType As String)
        HttpContext.Current.Response.ClearHeaders()
        HttpContext.Current.Response.AddHeader("Cache-Control", " no-store, no-cache ")
        HttpContext.Current.Response.Buffer = True
        HttpContext.Current.Response.Charset = ""
        HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache)
        HttpContext.Current.Response.ContentType = contentType
        HttpContext.Current.Response.AddHeader("content-disposition", "attachment;filename=" & nombreArchivo)
        HttpContext.Current.Response.BinaryWrite(Archivo)
        HttpContext.Current.Response.Flush()
        HttpContext.Current.Response.End()
    End Sub

    'Public Shared Sub ExportaExcel(grid_ext As Ext.Net.GridPanel, dataSource As Object, Optional name As String = "document")
    '    Dim lp_Columna As Infragistics.Web.UI.GridControls.BoundDataField
    '    Dim lp_Exportar As New Infragistics.Web.UI.GridControls.WebExcelExporter
    '    Dim lp_CurrentPage As Page = HttpContext.Current.CurrentHandler
    '    Dim lp_grid_infra As New Infragistics.Web.UI.GridControls.WebDataGrid
    '    lp_grid_infra.AutoGenerateColumns = False

    '    lp_CurrentPage.Controls.Add(lp_grid_infra)

    '    For Each item In grid_ext.ColumnModel.Columns
    '        lp_Columna = New Infragistics.Web.UI.GridControls.BoundDataField

    '        lp_Columna.Header.Text = item.Text
    '        lp_Columna.DataFieldName = item.DataIndex
    '        lp_Columna.Key = item.ID

    '        lp_grid_infra.Columns.Add(lp_Columna)
    '    Next
    '    lp_grid_infra.DataSource = dataSource
    '    lp_grid_infra.DataBind()

    '    lp_Exportar.DownloadName = name
    '    lp_Exportar.Export(lp_grid_infra)

    '    lp_CurrentPage.Controls.Remove(lp_grid_infra)
    'End Sub

    'Public Shared Function ExportaConsulta_Excel(commandText As String, Optional commandType As CommandType = CommandType.StoredProcedure, Optional connection As String = "connectionString") As Byte()
    '    Dim lp_ds As DataSet = clsSQL.ListDS(commandText, commandType, connection)
    '    Dim lp_wb As New Infragistics.Documents.Excel.Workbook()
    '    Dim lp_ws As Infragistics.Documents.Excel.Worksheet
    '    Dim lp_Archivo As New IO.MemoryStream

    '    For Each dt As DataTable In lp_ds.Tables
    '        lp_ws = lp_wb.Worksheets.Add(dt.TableName)

    '        For i As Integer = 0 To dt.Rows.Count - 1
    '            For j As Integer = 0 To dt.Columns.Count - 1
    '                If i = 0 Then
    '                    lp_ws.Rows(i).Cells(j).Value = dt.Columns(j).ColumnName
    '                End If
    '                lp_ws.Rows(i + 1).Cells(j).Value = dt(i)(j)
    '            Next
    '        Next
    '    Next
    '    lp_wb.SetCurrentFormat(Infragistics.Documents.Excel.WorkbookFormat.Excel2007)
    '    lp_wb.Save(lp_Archivo)

    '    Return lp_Archivo.ToArray
    'End Function

    Public Shared Function GetFileFromPath(path As String) As Byte()
        Dim Req As New WebClient
        Return Req.DownloadData(path)
    End Function

End Class

Public Enum FormatoReporte
    MHTML
    PDF
    CSV
    IMAGE
    WORD
End Enum

