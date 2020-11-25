Public Class WebForm2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnVerEstadosdeCuenta_Click(sender As Object, e As EventArgs) Handles btnVerEstadosdeCuenta.Click
        Response.Redirect("EstadosdeCuentaAdmin.aspx")
    End Sub

    Protected Sub btnVerCuentas_Click(sender As Object, e As EventArgs) Handles btnVerCuentas.Click
        Response.Redirect("SeleccionarCuenta.aspx")
    End Sub
End Class