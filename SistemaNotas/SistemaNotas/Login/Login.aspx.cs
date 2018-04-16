using CapaEntidades;
using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usuario"]!=null)
        {
            Response.Redirect("../Forms/frmPrincipal.aspx");
        }
    }

    protected void btnAceptar_Click(object sender, EventArgs e)
    {
        if(txtUsuario.Text != "" && txtPass.Text != "")
        {
            entUsuario obj = negUsuario.Login(txtUsuario.Text, txtPass.Text);

            if (obj != null)
            {
                Session["usuario"] = obj;
                Response.Redirect("../Forms/frmPrincipal.aspx");
            }
        }
        
    }
}