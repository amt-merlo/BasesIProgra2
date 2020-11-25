'------------------------------------------------------------------------------
' <generado automáticamente>
'     Este código fue generado por una herramienta.
'
'     Los cambios en este archivo podrían causar un comportamiento incorrecto y se perderán si
'     se vuelve a generar el código. 
' </generado automáticamente>
'------------------------------------------------------------------------------

Option Strict On
Option Explicit On


Partial Public Class Beneficiarios

    '''<summary>
    '''Control lblNombre.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents lblNombre As Global.System.Web.UI.WebControls.Label

    '''<summary>
    '''Control lblNombreBD.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents lblNombreBD As Global.System.Web.UI.WebControls.Label

    '''<summary>
    '''Control lblPorcentaje0.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents lblPorcentaje0 As Global.System.Web.UI.WebControls.Label

    '''<summary>
    '''Control lblPorcentajeFijo.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents lblPorcentajeFijo As Global.System.Web.UI.WebControls.Label

    '''<summary>
    '''Control lblParentescoFijo.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents lblParentescoFijo As Global.System.Web.UI.WebControls.Label

    '''<summary>
    '''Control lblCedula.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents lblCedula As Global.System.Web.UI.WebControls.Label

    '''<summary>
    '''Control lblCedulaBD.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents lblCedulaBD As Global.System.Web.UI.WebControls.Label

    '''<summary>
    '''Control lblEmail.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents lblEmail As Global.System.Web.UI.WebControls.Label

    '''<summary>
    '''Control lblEmailBD.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents lblEmailBD As Global.System.Web.UI.WebControls.Label

    '''<summary>
    '''Control btnEliminar.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents btnEliminar As Global.System.Web.UI.WebControls.Button

    '''<summary>
    '''Control SqlConsultaBeneficiario.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents SqlConsultaBeneficiario As Global.System.Web.UI.WebControls.SqlDataSource

    '''<summary>
    '''Control SqlPorcentajeBeneficiarios.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents SqlPorcentajeBeneficiarios As Global.System.Web.UI.WebControls.SqlDataSource

    '''<summary>
    '''Control lblParentesco.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents lblParentesco As Global.System.Web.UI.WebControls.Label

    '''<summary>
    '''Control dropdownParentesco.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents dropdownParentesco As Global.System.Web.UI.WebControls.DropDownList

    '''<summary>
    '''Control lblPorcentaje.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents lblPorcentaje As Global.System.Web.UI.WebControls.Label

    '''<summary>
    '''Control txtboxPorcentaje.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents txtboxPorcentaje As Global.System.Web.UI.WebControls.TextBox

    '''<summary>
    '''Control lblMaxPorcentaje.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents lblMaxPorcentaje As Global.System.Web.UI.WebControls.Label

    '''<summary>
    '''Control btnActualizar.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents btnActualizar As Global.System.Web.UI.WebControls.Button

    '''<summary>
    '''Control SqlConsultaPersona.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents SqlConsultaPersona As Global.System.Web.UI.WebControls.SqlDataSource

    '''<summary>
    '''Control SqlModificarBeneficiario.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents SqlModificarBeneficiario As Global.System.Web.UI.WebControls.SqlDataSource

    '''<summary>
    '''Control SqlEliminarBeneficiario.
    '''</summary>
    '''<remarks>
    '''Campo generado automáticamente.
    '''Para modificarlo, mueva la declaración del campo del archivo del diseñador al archivo de código subyacente.
    '''</remarks>
    Protected WithEvents SqlEliminarBeneficiario As Global.System.Web.UI.WebControls.SqlDataSource
End Class
