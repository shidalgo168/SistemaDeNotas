<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frmEval.aspx.cs" Inherits="Forms_frmEstudiantes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="abrigo_formulario">
        <h2>Nueva Evaluación del grupo</h2>
        <br />
        <table>
            <tr>
                <td>Tipo de evaluacion: </td>
                <td><asp:DropDownList ID="cmbTipoEval" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td>Nombre: </td>
                <td><asp:TextBox ID="txtNombre" runat="server" Width="200px"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Fecha de su aplicación: </td>
                <td><asp:TextBox ID="txtFecha" runat="server" Width="200px" TextMode="Date"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Descripcion: </td>
                <td><asp:TextBox ID="txtDesc" runat="server" Width="200px"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2"><asp:Label ID="lblerror" runat="server" Text="" Visible="false" ForeColor="Red"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="2"><asp:Label ID="lblfin" runat="server" Text="" Visible="false" ForeColor="Black"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="2" ><asp:Button ID="btnGuardar" runat="server" Text="Guardar" Width="170px" OnClick="btnGuardar_Click"/></td>
                
            </tr>
        </table>
    </div>
</asp:Content>

