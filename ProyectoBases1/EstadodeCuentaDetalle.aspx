<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="EstadodeCuentaDetalle.aspx.vb" Inherits="ProyectoBases1.EstadodeCuentaDetalle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="background-color:#8FBBF7">
        <h1 align="center">&nbsp;</h1>
        <h1 align="center"  style="font-family:Didot;">Detalle del estado de cuenta</h1>
        <p align="center">&nbsp;</p>
    </div>
    <div align="center">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SistemaBancarioConnectionString %>" SelectCommand="SELECT * FROM [EstadodeCuenta] WHERE ([ID] = @ID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        
        <asp:GridView ID="GridView1" runat="server" cellpadding="5" cellspacing="5"
            AutoGenerateColumns = "False"
            DataSourceID = "SqlDataSource1" Width="608px" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField ="ID" HeaderText ="Identificador" />
                <asp:BoundField DataField ="CuentadeAhorroID" HeaderText ="Número de cuenta" />
                <asp:BoundField DataField ="FechaInicio" HeaderText ="Fecha de inicio" />
                <asp:BoundField DataField ="FechaFin" HeaderText ="Fecha de corte" />
                <asp:BoundField DataField ="SaldoInicial" HeaderText ="Saldo inicial" />
                <asp:BoundField DataField ="SaldoFinal" HeaderText ="Saldo final" />
            </Columns>
            
        </asp:GridView>
        
    </div>
</asp:Content>

