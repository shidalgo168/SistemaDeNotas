<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="/App_Themes/TemaLogin/EstiloLogin.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" style="border: 3px solid #f1f1f1; width: 500px; margin:0 auto" runat="server">
        <div class="imgcontainer">
            <img src="../Imagenes/img.png" alt="Img" class="img" />
        </div>

        <div class="container">
            <label for="nomusuario"><b>Nombre de Usuario</b></label>
            <asp:TextBox class="txtUsuario" ID="txtUsuario" runat="server" type="text" placeholder="Ingrese su nombre de usuario" name="nomusuario" required=""></asp:TextBox>
            
            <label for="pass"><b>Contraseña</b></label>
            <asp:TextBox class="txtPass" ID="txtPass" runat="server" type="password" placeholder="Ingrese su contraseña" name="pass" required=""></asp:TextBox>

            <asp:Button class="btnAceptar" ID="btnAceptar" runat="server" Text="Aceptar" type="submit" OnClick="btnAceptar_Click" />

        </div>

    </form>
</body>
</html>
