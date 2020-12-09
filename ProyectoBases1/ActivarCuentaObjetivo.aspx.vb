Public Class ActivarCuentaObjetivo
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim numero As Integer
        Dim dvSql As DataView = DirectCast(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)

        If dvSql.Count > 0 Then
            lblCuota.Text = dvSql(0).Item(6)
            lblInterés.Text = dvSql(0).Item(9)
            lblSaldo.Text = dvSql(0).Item(8)

            lblObjetivo.Text = dvSql(0).Item(7)

            btnCrear.Enabled = False
        End If
        If dvSql.Count < 1 Then
            btnCrear.Enabled = True
            lblAdvertencia.Text = "Aún no se ha creado una cuenta objetivo*"
        End If

    End Sub

    Protected Sub btnGuardar_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        Dim descripcionNueva As String
        descripcionNueva = txtBoxObjetivo.Text

        Session("descripcionNueva") = descripcionNueva
        Dim dvSql2 As DataView = DirectCast(SqlDataSource2.Select(DataSourceSelectArguments.Empty), DataView)
        Response.Redirect("ActivarCuentaObjetivo.aspx")
    End Sub

    Protected Sub btnCrear_Click(sender As Object, e As EventArgs) Handles btnCrear.Click
        Response.Redirect("CrearCuentaObjetivo.aspx")
    End Sub

    Protected Sub btnDesactivar_Click(sender As Object, e As EventArgs) Handles btnDesactivar.Click
        lblEstado.Text = "Inactiva"
    End Sub
End Class