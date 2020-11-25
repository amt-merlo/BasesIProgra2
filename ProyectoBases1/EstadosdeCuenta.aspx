<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="EstadosdeCuenta.aspx.vb" Inherits="ProyectoBases1.EstadosdeCuenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="background-color:#8FBBF7">
        <h1>&nbsp;</h1>
        <h1  style="font-family:Didot;">Estados de cuenta disponibles</h1>
        <p>&nbsp;</p>
    </div>
    <div align="center">
        <asp:SqlDataSource ID="SqlEstadosCuenta" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SistemaBancarioConnectionString %>" 
            SelectCommand="SELECT [ID], [CuentadeAhorroID], [FechaInicio], [FechaFin] FROM [EstadodeCuenta] WHERE ([CuentadeAhorroID] = @CuentadeAhorroID)">
            <SelectParameters>
                <asp:SessionParameter Name="CuentadeAhorroID" SessionField="numCuenta" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:GridView ID="GridView1" runat="server" cellpadding="10" cellspacing="5"
            AutoGenerateColumns = "False"
            DataSourceID = "SqlEstadosCuenta" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="608px" AllowPaging="True">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField ="ID" HeaderText ="Identificador" />
                <asp:BoundField DataField ="CuentadeAhorroID" HeaderText ="Cuenta de ahorro" />
                <asp:BoundField DataField ="FechaInicio" HeaderText ="Fecha de Inicio" />
                <asp:BoundField DataField ="FechaFin" HeaderText ="Fecha de corte" />
            </Columns>
        </asp:GridView>

        <br />

    </div>

    
</asp:Content>
