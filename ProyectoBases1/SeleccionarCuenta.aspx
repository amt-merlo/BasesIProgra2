<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="SeleccionarCuenta.aspx.vb" Inherits="ProyectoBases1.SeleccionarCuenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="background-color:#8FBBF7">
        <h1 align="center" style="font-family:Didot;">&nbsp;</h1>
        <h1 align="center" style="font-family:Didot;">Cuentas bancarias disponibles</h1>
        <p align="center" style="font-family:Didot;">&nbsp;</p>
    </div>

    <div align="center">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SistemaBancarioConnectionString %>" SelectCommand="SELECT * FROM [CuentadeAhorro] WHERE ([ValorDocIdentidadCliente] = @ValorDocIdentidadCliente)">
            <SelectParameters>
                <asp:SessionParameter Name="ValorDocIdentidadCliente" SessionField="cedula" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        
        <asp:GridView ID="GridView1" runat="server" cellpadding="10" cellspacing="5"
            AutoGenerateColumns = "False"
            DataSourceID = "SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="608px" AllowPaging="True">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField ="ID" HeaderText ="Identificador" />
                <asp:BoundField DataField ="NumerodeCuenta" HeaderText ="Numero de cuenta" />
                <asp:BoundField DataField ="ValorDocIdentidadCliente" HeaderText ="Cedula de propietario" />
                <asp:BoundField DataField ="FechaConstitucion" HeaderText ="Fecha de constitucion" />
                <asp:BoundField DataField ="Saldo" HeaderText ="Saldo" />
            </Columns>
        </asp:GridView>
        <br />
        <br />
    </div>
</asp:Content>
