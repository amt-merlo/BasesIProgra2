<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="BeneficiariosCatalogo.aspx.vb" Inherits="ProyectoBases1.BeneficiariosCatalogo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center" style="background-color:#8FBBF7">
        <h1 style="font-family:Didot;">&nbsp;</h1>
        <h1 style="font-family:Didot;">Beneficiarios de la cuenta de ahorros</h1>
        <p style="font-family:Didot;">&nbsp;</p>
    </div>

    <div align="center">
        <asp:SqlDataSource ID="SqlBeneficiarios" runat="server" ConnectionString="<%$ ConnectionStrings:SistemaBancarioConnectionString %>" SelectCommand="SELECT * FROM [Beneficiario] WHERE ([CuentadeAhorroID] = @CuentadeAhorroID)">
            <SelectParameters>
                <asp:SessionParameter Name="CuentadeAhorroID" SessionField="numCuenta" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        Seleccione el beneficiario que desea modificar<br />
        <asp:Label style="color:#FF0000" ID="lblAdvertencia" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" cellpadding="10" cellspacing="5"
            AutoGenerateColumns = "False"
            DataSourceID = "SqlBeneficiarios" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="608px" AllowPaging="True">
            <Columns>
                <asp:CommandField ShowSelectButton="True"/>
                <asp:BoundField DataField ="ID" HeaderText ="Identificador" />
                <asp:BoundField DataField ="CuentadeAhorroID" HeaderText ="Número de cuenta" />
                <asp:BoundField DataField ="PersonaID" HeaderText ="Número de cédula" />
                <asp:BoundField DataField ="Porcentaje" HeaderText ="Porcentaje de beneficio" />
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <p> 
            <asp:Button ID="btnNuevoBeneficiario" runat="server" Text="+ Nuevo beneficiario" />
        </p>
        <p> 
            <asp:Label style="color:#FF0000" ID="lblError" runat="server" Text=""></asp:Label>
        </p>
        <p> 
            &nbsp;</p>
    </div>
</asp:Content>
