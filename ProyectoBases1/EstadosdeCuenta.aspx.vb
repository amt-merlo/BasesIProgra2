Imports System.Data
Imports System.Data.Sql
Public Class EstadosdeCuenta
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


    End Sub



    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        Dim selectedRow As GridViewRow = GridView1.SelectedRow
        Dim ID As String = selectedRow.Cells(1).Text()
        Response.Redirect("EstadodeCuentaDetalle.aspx?ID= " + ID)
    End Sub
End Class