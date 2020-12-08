<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ActivarCuentaObjetivo.aspx.vb" Inherits="ProyectoBases1.ActivarCuentaObjetivo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="background-color:#8FBBF7">
        <h1 align="center" style="font-family:Didot;">&nbsp;</h1>
        <h1 align="center" style="font-family:Didot;">Cuenta Objetivo</h1>
        <p align="center" style="font-family:Didot;">&nbsp;</p>
    </div>
    <div>
        <asp:Button ID="btnCrear" runat="server" Text="Crear cuenta objetivo" />
        
        <br />
        <br />
        <asp:Label style="color:#FF0000" ID="lblAdvertencia" runat="server" Text=""></asp:Label>
        
        <h3>Información de la cuenta</h3>
        <p>Cuota establecida:  <asp:Label ID="lblCuota" runat="server" Text="Cuota"></asp:Label>
        </p> 
        <p>Saldo: <asp:Label ID="lblSaldo" runat="server" Text="Saldo"></asp:Label> </p>
        <p>Interés Acumulado: <asp:Label ID="lblInterés" runat="server" Text="Interés"></asp:Label> </p>
        <p>Objetivo:  <asp:TextBox ID="txtBoxObjetivo" runat="server" Height="138px" Width="332px"></asp:TextBox> </p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnGuardar" runat="server" Text="Guardar cambios" />
        &nbsp;
            <asp:Button ID="btnDesactivar" runat="server" Text="Desactivar cuenta" />
        </p>
        <p>&nbsp;</p>
        
    </div>
</asp:Content>
