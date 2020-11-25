<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="EstadosdeCuentaAdmin.aspx.vb" Inherits="ProyectoBases1.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="background-color:#8FBBF7">
        <h1>&nbsp;</h1>
        <h1  style="font-family:Didot;">Estados de cuenta disponibles</h1>
        <p>&nbsp;</p>
    </div>

    <div align="center">
        <asp:SqlDataSource ID="SqlEstadosCuenta" runat="server" ConnectionString="<%$ ConnectionStrings:SistemaBancarioConnectionString %>" SelectCommand="SELECT [ID], [CuentadeAhorroID], [FechaInicio], [FechaFin] FROM [EstadodeCuenta]"></asp:SqlDataSource>

        <asp:GridView ID="GridView1" runat="server" cellpadding="5" cellspacing="5"
            AutoGenerateColumns = "False"
            DataSourceID = "SqlEstadosCuenta" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="608px" AllowPaging="True" DataKeyNames="ID">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField ="ID" HeaderText ="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField ="CuentadeAhorroID" HeaderText ="Numero de cuenta" SortExpression="Numero de cuenta" />
                <asp:BoundField DataField ="FechaInicio" HeaderText ="Fecha de inicio" SortExpression="Fecha de inicio" />
                <asp:BoundField DataField ="FechaFin" HeaderText ="Fecha de corte" SortExpression="Fecha de corte" />
            </Columns>
        </asp:GridView>

        <br />
    </div>
</asp:Content>
