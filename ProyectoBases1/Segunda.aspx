<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Segunda.aspx.vb" Inherits="ProyectoBases1.Segunda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="background-color:#8FBBF7">
        <h1 align="center" style="font-family:Didot;">&nbsp;</h1>
        <h1 align="center" style="font-family:Didot;">Bienvenido a su asistente de cuentas bancarias</h1>
        <p align="center" style="font-family:Didot;">&nbsp;</p>
    </div>
    <div>
        <p align="center">Menú de opciones</p>
        <p align="center">
            <asp:Button ID="btnEstadosCuenta" runat="server" Text="Ver estados de cuenta" />
        </p>
        <p align="center">
            <asp:Button ID="btnBeneficiarios" runat="server" Text="Modificar beneficiarios" />
        </p>
        <p align="center">
            <asp:Button ID="btnCuentaAhorro" runat="server" Text="Nuevo movimiento bancario" />
        </p>
        <p align="center">
            <asp:Button ID="btnCuentaObjetivo" runat="server" Text="Configurar cuenta objetivo" />
        </p>
        <p align="center">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SistemaBancarioConnectionString %>" SelectCommand="SELECT [NumerodeCuenta] FROM [CuentadeAhorro] WHERE ([ID] = @ID)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <p align="center">
            &nbsp;</p>
        <p align="center">
            &nbsp;</p>
        <p align="center">
            &nbsp;</p>
        <p align="center">
            &nbsp;</p>
        <p align="center">
            &nbsp;</p>
        
    </div>
    
</asp:Content>
