<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="MenuAdmin.aspx.vb" Inherits="ProyectoBases1.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="background-color:#8FBBF7">
        <h1 align="center" style="font-family:Didot;">&nbsp;</h1>
        <h1 align="center" style="font-family:Didot;">Menú de Administrador</h1>
        <p align="center" style="font-family:Didot;">&nbsp;</p>
    </div>
    <div>
        <h4 align="center"> &nbsp;</h4>
        <h4 align="center"> &nbsp;</h4>
        <h4 align="center"> &nbsp;Opciones</h4>
        <p align="center"> 
            <asp:Button ID="btnVerEstadosdeCuenta" runat="server" Text="Ver estados de cuenta" Width="158px" />
        </p>
        <p align="center"> 
            <asp:Button ID="btnVerCuentas" runat="server" Text="Ver cuentas de ahorro personales" Width="233px" />
        </p>
    </div>

</asp:Content>
