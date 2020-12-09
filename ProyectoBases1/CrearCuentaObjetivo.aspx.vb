Public Class CrearCuentaObjetivoaspx
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnCrear_Click(sender As Object, e As EventArgs) Handles btnCrear.Click
        Dim fechaInicio As String = txtBoxFechaInicio.Text
        Session("fechaInicio") = fechaInicio

        Dim fechaFin As String = txtBoxFechaFin.Text
        Session("fechaFin") = fechaFin

        Dim Cuota As Integer = CInt(txtCuota.Text)
        Session("cuota") = Cuota

        Dim Objetivo As String = txtBoxObjetivo.Text
        Session("objetivo") = Objetivo

        Dim DiasDeposito As String = txtBoxDias.Text
        Session("dias") = DiasDeposito

        Dim dvSql1 As DataView = DirectCast(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)
        Response.Redirect("ActivarCuentaObjetivo.aspx")
    End Sub
End Class