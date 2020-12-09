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
        
        <br />
        <br />
        <h3>Movimientos Realizados
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SistemaBancarioConnectionString %>" SelectCommand="SELECT [Fecha], [Monto], [NuevoSaldo], [Descripcion] FROM [MovimientoCA] WHERE (([EstadodeCuentaID] = @EstadodeCuentaID) AND ([numCuentaID] = @numCuentaID))">
                <SelectParameters>
                    <asp:QueryStringParameter Name="EstadodeCuentaID" QueryStringField="ID" Type="Int32" />
                    <asp:SessionParameter Name="numCuentaID" SessionField="numCuenta" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </h3>
        <br />
        <asp:TextBox ID="txtPatron" runat="server"></asp:TextBox>
&nbsp;
        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" />
        <br />
        <br />

        <asp:GridView ID="GridView2" runat="server" cellpadding="5" cellspacing="5" 
            AutoGenerateColumns = "False"
            
            DataSourceID = "SqlDataSource2" Width="608px" AllowPaging="True">
            <PagerStyle ForeColor="#8C4510" 
          HorizontalAlign="Center"></PagerStyle>
            <HeaderStyle ForeColor="White" Font-Bold="True" 
          BackColor="#A55129" HorizontalAlign="Center"></HeaderStyle>
            <Columns>
                <asp:BoundField DataField ="Fecha" HeaderText ="Fecha" ReadOnly="True" SortExpression="Fecha"/>
                <asp:BoundField DataField ="Monto" HeaderText ="Monto" ReadOnly="True" SortExpression="Monto"/>
                <asp:BoundField DataField ="NuevoSaldo" HeaderText ="Nuevo Saldo" ReadOnly="True" SortExpression="NuevoSaldo"/>
                <asp:BoundField DataField ="Descripcion" HeaderText ="Descripción" ReadOnly="True" SortExpression="Descripcion"/>

            </Columns>
            
        </asp:GridView>

    </div>
</asp:Content>

