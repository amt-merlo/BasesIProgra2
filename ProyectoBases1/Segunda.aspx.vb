Imports System.Data
Public Class Segunda
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim dvSql As DataView = DirectCast(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)
        Dim num As Integer
        num = dvSql.Count

        If num > 0 Then
            Session("numCuenta") = dvSql(0).Item(0)
        End If
        If num < 1 Then
            Session("numCuenta") = 0
        End If

    End Sub

    Protected Sub btnEstadosCuenta_Click(sender As Object, e As EventArgs) Handles btnEstadosCuenta.Click

        If Session("esAdmin") = False Then
            Response.Redirect("EstadosdeCuenta.aspx")
        End If

    End Sub

    Protected Sub btnBeneficiarios_Click(sender As Object, e As EventArgs) Handles btnBeneficiarios.Click
        Response.Redirect("BeneficiariosCatalogo.aspx")
    End Sub

    Protected Sub btnCuentaObjetivo_Click(sender As Object, e As EventArgs) Handles btnCuentaObjetivo.Click
        Response.Redirect("ActivarCuentaObjetivo.aspx")
    End Sub
End Class