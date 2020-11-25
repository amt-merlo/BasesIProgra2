Public Class Beneficiarios
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim dvSql As DataView = DirectCast(SqlConsultaBeneficiario.Select(DataSourceSelectArguments.Empty), DataView)
        Dim cedula As String = dvSql(0).Item(2)
        Dim porcentaje As String = dvSql(0).Item(4)
        Dim parentesco As Integer = dvSql(0).Item(3)

        Session("beneficiarioID") = cedula
        Dim dvSql2 As DataView = DirectCast(SqlConsultaPersona.Select(DataSourceSelectArguments.Empty), DataView)
        Dim nombre As String = dvSql2(0).Item(0)
        Dim email As String = dvSql2(0).Item(1)


        lblCedulaBD.Text = cedula
        lblNombreBD.Text = nombre
        lblEmailBD.Text = email
        lblPorcentajeFijo.Text = porcentaje

        If parentesco = 1 Then
            lblParentescoFijo.Text = "Padre"
        End If
        If parentesco = 2 Then
            lblParentescoFijo.Text = "Madre"
        End If
        If parentesco = 3 Then
            lblParentescoFijo.Text = "Hijo"
        End If
        If parentesco = 4 Then
            lblParentescoFijo.Text = "Hija"
        End If
        If parentesco = 5 Then
            lblParentescoFijo.Text = "Hermano"
        End If
        If parentesco = 6 Then
            lblParentescoFijo.Text = "Hermana"
        End If
        If parentesco = 7 Then
            lblParentescoFijo.Text = "Amigo"
        End If
        If parentesco = 8 Then
            lblParentescoFijo.Text = "Amiga"
        End If
    End Sub

    Protected Sub btnActualizar_Click(sender As Object, e As EventArgs) Handles btnActualizar.Click
        Dim nuevoParentesco As Integer = CInt(dropdownParentesco.SelectedValue)
        Dim nuevoPorcentaje As Integer = CInt(txtboxPorcentaje.Text)
        Session("NuevoParentesco") = nuevoParentesco
        Session("nuevoPorcentaje") = nuevoPorcentaje


        Dim dvSql3 As DataView = DirectCast(SqlPorcentajeBeneficiarios.Select(DataSourceSelectArguments.Empty), DataView)
        Dim contador As Integer = dvSql3.Count

        Dim totalPorcentajes As Integer = 0
        For index As Integer = 0 To contador - 1
            Dim porcentajeBeneficiario As Integer = dvSql3(index).Item(0)
            totalPorcentajes = totalPorcentajes + porcentajeBeneficiario
        Next

        totalPorcentajes = totalPorcentajes + nuevoPorcentaje
        If totalPorcentajes > 100 Then
            lblMaxPorcentaje.Text = "*El porcentaje asignado a este usuario supera el máximo del porcentaje admitido"
        End If

        If totalPorcentajes < 101 Then
            lblMaxPorcentaje.Text = "*Benficiario modificado correctamente"
            Dim dvSql4 As DataView = DirectCast(SqlModificarBeneficiario.Select(DataSourceSelectArguments.Empty), DataView)
            Response.Redirect("BeneficiariosCatalogo.aspx")
        End If

    End Sub

    Protected Sub btnEliminar_Click(sender As Object, e As EventArgs) Handles btnEliminar.Click
        Dim dvSql As DataView = DirectCast(SqlEliminarBeneficiario.Select(DataSourceSelectArguments.Empty), DataView)
        Response.Redirect("BeneficiariosCatalogo.aspx")
    End Sub
End Class