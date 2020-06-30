using Muni.Classes;
using System;
using System.Data;

namespace Muni.Pages
{
    public partial class VerPropietariosPage : System.Web.UI.Page
    {
        string usernameGot;
        protected void Page_Load(object sender, EventArgs e)
        {
            usernameGot = Request.QueryString["username"];
            this.gridView.DataSource = God.getPropietarios();
            this.gridView.DataBind();
        }

        protected void backBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPage.aspx?username=" + usernameGot);
        }

        protected void verPropiedadesBtn_Click(object sender, EventArgs e)
        {
            string numeroFinca = this.propietarioIdInput.Text;
            if (numeroFinca.Length != 0)
            {

                DataTable dt = God.getPropiedadesFromPropietarioDocID(numeroFinca);
                this.gridView.DataSource = dt;
                this.gridView.DataBind();

            }
        }
    }
}