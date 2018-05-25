﻿Public Class DetalleSeccion
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            hdSeccion.Value = Request.QueryString("ID")
            txtCalendario.Text = Request.QueryString("Calendario")
            txtNRC.Text = Request.QueryString("NRC")
            txtSeccion.Text = Request.QueryString("Seccion")
            txtMateria.Text = Request.QueryString("Materia")
            pnlAlumnos.Loader.Url += hdSeccion.Value
        End If
    End Sub

    Public Sub btnRegresar_Click(sender As Object, e As Ext.Net.DirectEventArgs)
        Response.Redirect(ResolveUrl("ConsultaSeccion.aspx"))
    End Sub
End Class