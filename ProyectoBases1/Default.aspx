<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="ProyectoBases1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="center" style="background-color:#8FBBF7">
        <h1 align="center" style="font-family:Didot;">Proyecto 1 Bases de Datos</h1>
        <p align="center" class="lead" style="font-family:Times;">Elaborado por Allison M. Merlo y Gabriela Gutiérrez Valverde</p>
    </div>

    <div> 
        
            <h2 align="center" style="font-family:Didot;">Acceso</h2>

            <p align="center" style="font-family:Times;">

               Ingrese sus credenciales para ingresar: 
            </p>

            <p align="center">
                <asp:TextBox ID="txtBoxUser" runat="server"></asp:TextBox>
            </p>
            <p align="center">
                <asp:TextBox ID="txtBoxContrasenna" runat="server"></asp:TextBox>
            </p>
            <p align="center">
                <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" Height="27px" />
            </p>
            <p align="center">
                <asp:Label ID="lblUsuarioIncorrecto" runat="server" Text=""></asp:Label>
            </p>
            <p align="center">
                &nbsp;</p>
            <p align="center">
                &nbsp;</p>
            <p align="center">
                &nbsp;</p>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SistemaBancarioConnectionString %>" SelectCommand="consultaLogin" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtBoxUser" Name="usuario" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="txtBoxContrasenna" Name="password" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SistemaBancarioConnectionString %>" SelectCommand="SELECT * FROM [Usuario] WHERE ([Username] = @Username)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtBoxUser" Name="Username" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            
            <br />
            
        
        
        </div>

    
</asp:Content>
