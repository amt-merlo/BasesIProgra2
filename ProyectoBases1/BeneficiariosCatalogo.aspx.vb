Public Class BeneficiariosCatalogo
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim dvSql As DataView = DirectCast(SqlBeneficiarios.Select(DataSourceSelectArguments.Empty), DataView)
        Dim cantidad As Integer = dvSql.Count

        Dim totalPorcentajes As Integer = 0
        For index As Integer = 0 To cantidad - 1
            Dim porcentajeBeneficiario As Integer = dvSql(index).Item(4)
            totalPorcentajes = totalPorcentajes + porcentajeBeneficiario
        Next

        If totalPorcentajes < 100 Then
            lblAdvertencia.Text = "*El porcentaje asigado a los beneficiarios es menor a 100, se recomienda modificar los porcentajes"
        End If
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        Dim selectedRow As GridViewRow = GridView1.SelectedRow
        Dim ID As String = selectedRow.Cells(1).Text()
        Response.Redirect("Beneficiarios.aspx?ID= " + ID)
    End Sub

    Protected Sub btnNuevoBeneficiario_Click(sender As Object, e As EventArgs) Handles btnNuevoBeneficiario.Click
        Dim dvSql1 As DataView = DirectCast(SqlBeneficiarios.Select(DataSourceSelectArguments.Empty), DataView)
        Dim cantBeneficiarios As Integer = dvSql1.Count

        If cantBeneficiarios > 2 Then
            lblError.Text = "Usted ya registró la cantidad máxima de beneficiarios"
        End If

        If cantBeneficiarios < 3 Then
            Response.Redirect("AgregarBeneficiario.aspx")
        End If
    End Sub
End Class