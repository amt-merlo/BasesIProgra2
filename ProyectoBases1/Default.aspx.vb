Imports System.Data

Public Class _Default
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnIngresar_Click(sender As Object, e As EventArgs) Handles btnIngresar.Click
        Dim numero As Integer
        Dim dvSql As DataView = DirectCast(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)
        Dim dvSql2 As DataView = DirectCast(SqlDataSource2.Select(DataSourceSelectArguments.Empty), DataView)

        If dvSql.Count > 0 Then
            numero = 1
        End If

        If numero = 1 Then
            Session("usuario") = dvSql(0).Item(0)
            Session("esAdmin") = dvSql2(0).Item(4)
            Session("cedula") = dvSql2(0).Item(1)

            If Session("esAdmin") = True Then
                Response.Redirect("MenuAdmin.aspx")
            End If
            If Session("esAdmin") = False Then
                Response.Redirect("SeleccionarCuenta.aspx")
            End If


        End If

        If numero < 1 Then
            lblUsuarioIncorrecto.Text = "Usuario no registrado"
        End If
    End Sub

    Protected Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs)

    End Sub
End Class