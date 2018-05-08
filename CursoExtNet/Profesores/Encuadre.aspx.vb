Public Class Encuadre
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            hdID.Value = CInt(Request.QueryString("ID"))
            stEncuadre.Reload()
        End If
    End Sub

    Private Sub stEncuadre_ReadData(sender As Object, e As Ext.Net.StoreReadDataEventArgs) Handles stEncuadre.ReadData
        stEncuadre.DataSource = clsEncuadre.List(hdID.value)
        stEncuadre.DataBind()
    End Sub
End Class