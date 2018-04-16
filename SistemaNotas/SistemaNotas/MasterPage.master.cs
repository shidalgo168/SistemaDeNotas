using CapaEntidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        entUsuario obj = (entUsuario)Session["usuario"];
        if(obj != null)
        {
            nombreUsuario.Text = obj.Nombre + " " + obj.Apellido;
        }
        else
        {
            Response.Redirect("../Login/Login.aspx");
        }
    }


    protected void lbtlogout_Click(object sender, EventArgs e)
    {
        Session.Remove("usuario");
        Response.Redirect("../Login/Login.aspx");
    }
}
