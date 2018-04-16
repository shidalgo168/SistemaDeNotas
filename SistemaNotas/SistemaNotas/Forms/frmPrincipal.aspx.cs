using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Forms_frmPincipal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["idProf"] != null)
        {
            if (Request.QueryString["per"] != null)
            {
                int prof = Convert.ToInt32(Request.QueryString["idProf"]);
                int per = Convert.ToInt32(Request.QueryString["per"]);
                if (Request.QueryString["gru"] != null)
                {
                    int gru = Convert.ToInt32(Request.QueryString["gru"]);
                    if (Request.QueryString["est"] != null)
                    {
                        int est = Convert.ToInt32(Request.QueryString["est"]);
                        if (negEvaluacion.ListarEvaluaciones(est) != null)
                        {
                            indicador.Text = "Evaluaciones del estudiante:";
                        }
                        else
                        {
                            indicador.Text = "No hay evaluaciones asociados a este estudiante";
                        }
                        grvEvaluaciones.DataSource = negEvaluacion.ListarEvaluaciones(est);
                        grvEvaluaciones.DataBind();
                    }
                    else
                    {
                        if (negEstudiante.ListarEstudiantes(gru) != null)
                        {
                            indicador.Text = "Estudiantes pertenecientes al grupo " + gru + ":";
                        }
                        else
                        {
                            indicador.Text = "No hay estudiantes asociados a este grupo";
                        }
                        grvEstudiantes.DataSource = negEstudiante.ListarEstudiantes(gru);
                        grvEstudiantes.DataBind();
                    }
                }
                else
                {
                    if (negGrupo.ListarGrupos(prof, per) != null)
                    {
                        indicador.Text = "Sus grupos:";

                    }
                    else
                    {
                        indicador.Text = "No tiene grupos asociados en este periodo";
                    }
                    grvGrupos.DataSource = negGrupo.ListarGrupos(prof, per);
                    grvGrupos.DataBind();
                }
            }
        }
    }


    protected void btnAtras_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["idProf"] != null)
        {
            if (Request.QueryString["per"] != null)
            {
                int prof = Convert.ToInt32(Request.QueryString["idProf"]);
                int per = Convert.ToInt32(Request.QueryString["per"]);
                if (Request.QueryString["gru"] != null)
                {
                    int gru = Convert.ToInt32(Request.QueryString["gru"]);
                    if (Request.QueryString["est"] != null)
                    {
                        int est = Convert.ToInt32(Request.QueryString["est"]);
                        Response.Redirect("frmPrincipal.aspx?idProf=" + prof + "&" + "per=" + per + "&" + "gru=" + gru);
                    }
                    else
                    {
                        Response.Redirect("frmPrincipal.aspx?idProf=" + prof + "&" + "per=" + per);
                    }
                }
            }
        }
    }
}