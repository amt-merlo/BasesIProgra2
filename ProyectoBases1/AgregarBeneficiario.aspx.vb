Public Class AgregarBeneficiario
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnAgregarBeneficiario_Click(sender As Object, e As EventArgs) Handles btnAgregarBeneficiario.Click
        Dim porcentaje As Integer = CInt(txtBoxPorcentaje.Text)
        Session("porcentajeNB") = porcentaje

        Dim cedula As Integer = CInt(txtBoxCedula.Text)
        Session("cedulaNB") = cedula

        Dim dvSql1 As DataView = DirectCast(SqlAgregarBeneficiario.Select(DataSourceSelectArguments.Empty), DataView)
        Response.Redirect("BeneficiariosCatalogo.aspx")
    End Sub
End Class