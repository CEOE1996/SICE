Public Class Principal
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim lp_root As New Ext.Net.Node

            lp_root.Children.AddRange(ConsultaMenu())
            TreePanel1.Root.Add(lp_root)
            If lp_root.Children.Count > 0 Then
                TreePanel1.Root(0).Expanded = True
                TreePanel1.RootVisible = False
            End If

            lblNombre.Text = VariablesSesion.NombreUsuario
            lblCodigo.Text = VariablesSesion.Codigo
        End If
    End Sub

    Private Function ConsultaMenu() As Ext.Net.NodeCollection
        Dim lp_nodos As New Ext.Net.NodeCollection(False)
        Dim lp_nodo As Ext.Net.Node = Nothing

        clsSQL.AddParameter("@Codigo", VariablesSesion.Codigo)
        Dim lp_list As List(Of Menu) = clsSQL.List("SPQ_CargaMenu").toList(Of Menu)()

        For Each item As Menu In lp_list.FindAll(Function(i) i.padre.HasValue = False)
            lp_nodo = New Ext.Net.Node

            CargaNodos(item, lp_list, lp_nodo)

            lp_nodos.Add(lp_nodo)
        Next

        Return lp_nodos
    End Function

    Private Sub CargaNodos(item As Menu, list As List(Of Menu), nodo As Ext.Net.Node)
        Dim lp_nodoHijo As Ext.Net.Node = Nothing

        nodo.NodeID = item.menu
        nodo.Text = item.desc_menu
        nodo.Leaf = True
        nodo.CustomAttributes.Add(New Ext.Net.ConfigItem With {.Name = "url", .Value = item.direccion, .Mode = Ext.Net.ParameterMode.Value})

        For Each hijo In list.FindAll(Function(i) IIf(i.padre.HasValue, i.padre, -1) = item.menu)
            lp_nodoHijo = New Ext.Net.Node
            nodo.Leaf = False

            CargaNodos(hijo, list, lp_nodoHijo)

            nodo.Children.Add(lp_nodoHijo)
        Next
    End Sub

End Class

Public Class Menu
    Public Property menu As Integer
    Public Property desc_menu As String
    Public Property direccion As String
    Public Property padre As Nullable(Of Integer)
End Class