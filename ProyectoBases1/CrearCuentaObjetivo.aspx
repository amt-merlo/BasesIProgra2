<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="CrearCuentaObjetivo.aspx.vb" Inherits="ProyectoBases1.CrearCuentaObjetivoaspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div style="background-color:#8FBBF7">
        <h1 align="center" style="font-family:Didot;">&nbsp;</h1>
        <h1 align="center" style="font-family:Didot;">Crear Cuenta Objetivo</h1>
        <p align="center" style="font-family:Didot;">&nbsp;</p>
    </div>

    <div>

        <br />
        Fecha Inicio:&nbsp;
        <asp:TextBox ID="txtBoxFechaInicio" runat="server"></asp:TextBox>

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Dias de depósito:
        <asp:TextBox ID="txtBoxDias" runat="server"></asp:TextBox>

        <br />
        <br />
        Fecha Fin:&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtBoxFechaFin" runat="server"></asp:TextBox>


        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnCrear" runat="server" Text="Crear Cuenta Objetivo" Width="243px" />


        <br />
        <br />
        Cuota:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtCuota" runat="server"></asp:TextBox>


        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


        <br />
        <br />
        Objetivo:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtBoxObjetivo" runat="server" Height="138px" Width="240px"></asp:TextBox>


        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SistemaBancarioConnectionString %>" SelectCommand="crearCO1" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="fechaInicio" SessionField="fechaInicio" Type="String" />
                <asp:SessionParameter Name="fechaFin" SessionField="fechaFin" Type="String" />
                <asp:SessionParameter Name="cuota" SessionField="cuota" Type="Int32" />
                <asp:SessionParameter Name="objetivo" SessionField="objetivo" Type="String" />
                <asp:SessionParameter Name="diasDeposito" SessionField="dias" Type="String" />
                <asp:SessionParameter Name="numCuenta" SessionField="numCuenta" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>


    </div>
</asp:Content>
