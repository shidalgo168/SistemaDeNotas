using CapaEntidades;
using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Forms_frmEstudiantes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int idGrupo = Convert.ToInt32(Request.QueryString["gru"]);
        cmbTipoEval.DataSource = negEvaluacion.ListarEvalDinamicas(idGrupo);
        cmbTipoEval.DataTextField = "Nombre";
        cmbTipoEval.DataValueField = "id";
        cmbTipoEval.DataBind();
    }

    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        if(txtNombre.Text != "" && txtDesc.Text != "" && txtFecha.Text != "")
        {
            try
            {
                int idGrupo = Convert.ToInt32(Request.QueryString["gru"]);
                entEvaluacion obj = new entEvaluacion();
                obj.FK_GrupoxEst = idGrupo;
                obj.FK_GrupoxRubro = Convert.ToInt32(cmbTipoEval.SelectedValue);
                obj.Nombre = txtNombre.Text;
                obj.FechaAplicacion = DateTime.Parse(txtFecha.Text);
                obj.Nota = -1;
                obj.Descripcion = txtDesc.Text;
                DateTime r = negEvaluacion.AgregarEvaluacion(obj);
                if (r == DateTime.Parse("1900/10/10"))
                {
                    lblfin.Text = "Evluacion ingresada correctamentew";
                    lblfin.Visible = true;
                }
                else
                {
                    lblerror.Text = "ERROR: " + r.ToString();
                    lblerror.Visible = true;
                }
            }
            catch
            {
                lblerror.Text = "Datos ingresados no compatibles";
                lblerror.Visible = true;
            }
        }
        else
        {
            lblerror.Text = "Faltan ingresar campos";
            lblerror.Visible = true;
        }
    }
}