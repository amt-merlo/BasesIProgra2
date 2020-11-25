<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Beneficiarios.aspx.vb" Inherits="ProyectoBases1.Beneficiarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="background-color:#8FBBF7">
        <h1 style="font-family:Didot;">&nbsp;</h1>
        <h1 style="font-family:Didot;">Actualizar datos de beneficiarios existentes</h1>
        <p style="font-family:Didot;">&nbsp;</p>
    </div>

    <div>
            <h4>Beneficiario seleccionado</h4>
        <p>&nbsp;</p>
        <p>
            <asp:Label ID="lblNombre" runat="server" Text="Nombre: "></asp:Label>
            &nbsp;&nbsp;
            <asp:Label ID="lblNombreBD" runat="server" Text=""></asp:Label>
        </p>
            <p>
            <asp:Label ID="lblPorcentaje0" runat="server" Text="Porcentaje asignado: "></asp:Label>
                <asp:Label ID="lblPorcentajeFijo" runat="server" Text=""></asp:Label>
        </p>
            <p>
                Parentesco:&nbsp;
                <asp:Label ID="lblParentescoFijo" runat="server" Text=""></asp:Label>
        </p>
        <p>
            <asp:Label ID="lblCedula" runat="server" Text="Número de identificación: "></asp:Label>
            &nbsp;
            <asp:Label ID="lblCedulaBD" runat="server" Text=""></asp:Label>
        </p>
            <p>
                <asp:Label ID="lblEmail" runat="server" Text="Correo electrónico: "></asp:Label>
        &nbsp;<asp:Label ID="lblEmailBD" runat="server" Text=""></asp:Label>
        </p>
            <p>
                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar beneficiario" Width="149px" />
        </p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;<asp:SqlDataSource ID="SqlConsultaBeneficiario" runat="server" ConnectionString="<%$ ConnectionStrings:SistemaBancarioConnectionString %>" SelectCommand="SELECT * FROM [Beneficiario] WHERE ([ID] = @ID)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            </p>
        <p>
            <asp:SqlDataSource ID="SqlPorcentajeBeneficiarios" runat="server" ConnectionString="<%$ ConnectionStrings:SistemaBancarioConnectionString %>" SelectCommand="SELECT [Porcentaje] FROM [Beneficiario] WHERE (([CuentadeAhorroID] = @CuentadeAhorroID) AND ([ID] &lt;&gt; @ID))">
                <SelectParameters>
                    <asp:SessionParameter Name="CuentadeAhorroID" SessionField="numCuenta" Type="Int32" />
                    <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <h4>Modificar</h4>
        <p>
            <asp:Label ID="lblParentesco" runat="server" Text="Parentesco:     "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:DropDownList ID="dropdownParentesco" runat="server">
                <asp:ListItem Value="1">Padre</asp:ListItem>
                <asp:ListItem Value="2">Madre</asp:ListItem>
                <asp:ListItem Value="3">Hijo</asp:ListItem>
                <asp:ListItem Value="4">Hija</asp:ListItem>
                <asp:ListItem Value="5">Hermano</asp:ListItem>
                <asp:ListItem Value="6">Hermana</asp:ListItem>
                <asp:ListItem Value="7">Amigo</asp:ListItem>
                <asp:ListItem Value="8">Amiga</asp:ListItem>
            </asp:DropDownList>
        </p>
        <p>
            &nbsp;&nbsp;&nbsp; &nbsp;</p>
        <p>
            <asp:Label ID="lblPorcentaje" runat="server" Text="Porcentaje asignado: "></asp:Label>
            &nbsp;&nbsp; &nbsp;<asp:TextBox ID="txtboxPorcentaje" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label style="color:#FF0000" ID="lblMaxPorcentaje" runat="server" Text=""></asp:Label>
        </p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Button ID="btnActualizar" runat="server" Text="Actualizar" Width="124px" />
        </p>
            <p>
                <asp:SqlDataSource ID="SqlConsultaPersona" runat="server" ConnectionString="<%$ ConnectionStrings:SistemaBancarioConnectionString %>" SelectCommand="SELECT [Nombre], [email] FROM [Persona] WHERE ([ValorDocIdentidad] = @ValorDocIdentidad)">
                    <SelectParameters>
                        <asp:SessionParameter Name="ValorDocIdentidad" SessionField="beneficiarioID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
        </p>
            <p>
                <asp:SqlDataSource ID="SqlModificarBeneficiario" runat="server" ConnectionString="<%$ ConnectionStrings:SistemaBancarioConnectionString %>" SelectCommand="ModificarBeneficiario" SelectCommandType="StoredProcedure" UpdateCommand="ModificarBeneficiario" UpdateCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
                        <asp:SessionParameter Name="parentesco" SessionField="nuevoParentesco" Type="Int32" />
                        <asp:SessionParameter Name="porcentaje" SessionField="nuevoPorcentaje" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ID" />
                        <asp:Parameter Name="parentesco" />
                        <asp:Parameter Name="porcentaje" />
                    </UpdateParameters>
                </asp:SqlDataSource>
        </p>
            <p>
                <asp:SqlDataSource ID="SqlEliminarBeneficiario" runat="server" ConnectionString="<%$ ConnectionStrings:SistemaBancarioConnectionString %>" SelectCommand="eliminarBeneficiario" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
        </p>
            <p>
                &nbsp;</p>
    </div>

   
   
</asp:Content>
