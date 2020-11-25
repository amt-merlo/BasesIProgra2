<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="AgregarBeneficiario.aspx.vb" Inherits="ProyectoBases1.AgregarBeneficiario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center" style="background-color:#8FBBF7">
        <h1 style="font-family:Didot;">&nbsp;</h1>
        <h1 style="font-family:Didot;">Agregar nuevo beneficiario</h1>
        <br />
    </div>
    <div align="center">
        <br />
        <br />
        <asp:Label ID="lblcedula" runat="server" Text="Número de identificación del beneficiario: "></asp:Label>
    &nbsp;
        <asp:TextBox ID="txtBoxCedula" runat="server"></asp:TextBox>
        <br />
        <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Parentesco:&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Value="1">Padre</asp:ListItem>
            <asp:ListItem Value="2">Madre</asp:ListItem>
            <asp:ListItem Value="3">Hijo</asp:ListItem>
            <asp:ListItem Value="4">Hija</asp:ListItem>
            <asp:ListItem Value="5">Hermano</asp:ListItem>
            <asp:ListItem Value="6">Hermana</asp:ListItem>
            <asp:ListItem Value="7">Amigo</asp:ListItem>
            <asp:ListItem Value="8">Amiga</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblPorcentaje" runat="server" Text="Porcentaje de beneficio: "></asp:Label>
&nbsp;&nbsp;<asp:TextBox ID="txtBoxPorcentaje" runat="server"></asp:TextBox>
        <br />&nbsp;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:Button ID="btnAgregarBeneficiario" runat="server" Text="Agregar beneficiario" Width="151px" Height="29px" />
        <br />
        <br />
        <br />
        <asp:SqlDataSource ID="SqlAgregarBeneficiario" runat="server" ConnectionString="<%$ ConnectionStrings:SistemaBancarioConnectionString %>" SelectCommand="agregarBeneficiario" SelectCommandType="StoredProcedure" UpdateCommand="agregarBeneficiario" UpdateCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="porcentaje" SessionField="porcentajeNB" Type="Int32" />
                <asp:ControlParameter ControlID="DropDownList1" Name="parentesco" PropertyName="SelectedValue" Type="Int32" />
                <asp:SessionParameter Name="personaID" SessionField="cedulaNB" Type="Int32" />
                <asp:SessionParameter Name="cuentaID" SessionField="numCuenta" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="porcentaje" Type="Int32" />
                <asp:Parameter Name="parentesco" Type="Int32" />
                <asp:Parameter Name="personaID" Type="Int32" />
                <asp:Parameter Name="cuentaID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <br />
    </div>
</asp:Content>
