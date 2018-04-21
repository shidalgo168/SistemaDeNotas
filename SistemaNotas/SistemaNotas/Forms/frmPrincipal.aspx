<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frmPrincipal.aspx.cs" Inherits="Forms_frmPincipal" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <br />
    <asp:Label ID="indicador" runat="server" Text="" style=" text-align: left; float: left; font-size: 24px; font-family:Arial ;background-color:#fff;"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="grvGrupos" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="720px">
        <Columns>
            <asp:HyperLinkField DataTextField="id" HeaderText="id" DataNavigateUrlFields="FK_Profesor,FK_Periodo,id" DataNavigateUrlFormatString="~/Forms/frmPrincipal.aspx?idProf={0}&amp;per={1}&amp;gru={2}" NavigateUrl="~/Forms/frmPrincipal.aspx"/>
            <asp:BoundField DataField="FK_EstadoG" HeaderText="FK_EstadoG" />
            <asp:BoundField DataField="FK_Periodo" HeaderText="FK_Periodo" />
            <asp:BoundField DataField="FK_Profesor" HeaderText="FK_Profesor" />
            <asp:BoundField DataField="NombreCurso" HeaderText="NombreCurso" />
            <asp:BoundField DataField="CodigoCurso" HeaderText="CodigoCurso" />
        </Columns>
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />
    </asp:GridView>
    <asp:GridView ID="grvEvaluaciones" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Width="720px">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" />
            <asp:BoundField DataField="FK_GrupoxEst" HeaderText="FK_GrupoxEst" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
            <asp:BoundField DataField="Nota" HeaderText="Nota" />
            <asp:BoundField DataField="ValorPorcIndiv" HeaderText="ValorPorcIndiv" />
            <asp:BoundField DataField="FechaAplicacion" HeaderText="FechaAplicacion" />
            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
            <asp:CommandField SelectText="Modificar" ShowEditButton="True" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    <asp:GridView ID="grvEstudiantes" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" Width="720px">
        <Columns>
            <asp:HyperLinkField DataTextField="idEst" HeaderText="idEst" DataNavigateUrlFields="FK_Profesor,FK_Periodo,FK_Grupo,id" DataNavigateUrlFormatString="~/Forms/frmPrincipal.aspx?idProf={0}&amp;per={1}&amp;gru={2}&amp;est={3}" NavigateUrl="~/Forms/frmPrincipal.aspx"/>
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
            <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:BoundField DataField="carnet" HeaderText="carnet" />
            <asp:BoundField DataField="Telefono" HeaderText="Telefono" />
            <asp:BoundField DataField="NotaAcumulada" HeaderText="NotaAcumulada" />
        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#594B9C" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#33276A" />
    </asp:GridView>
    <br />

    <asp:Button ID="btnAtras" runat="server" Text="Atrás" OnClick="btnAtras_Click" />
    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
    <asp:Button ID="btnAgregarEval" runat="server" Text="Agregar Evaluación" Visible="false" OnClick="btnAgregarEval_Click"/>
</asp:Content>

