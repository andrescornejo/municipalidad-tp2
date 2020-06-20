using Muni.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Muni.Pages
{
    public partial class propietariosUpdate : System.Web.UI.Page
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
            Response.Redirect("propietariosCRUD.aspx?username=" + usernameGot);
        }
        protected void updatePropietarioBtn_Click(object sender, EventArgs e)
        {
            string OLDDocID = this.textBoxOLDID.Text;
            string newName = this.textBoxNameInput.Text;
            string newDocID = this.textBoxDocIDInput.Text;
            string docIDVal = this.DropDownListIDType.SelectedValue;

            if (OLDDocID.Length != 0 && newName.Length != 0 && newDocID.Length != 0)
            {
                God.updatePropietario(OLDDocID, newName, newDocID, docIDVal);
                this.textBoxOLDID.Text = "";
                this.textBoxNameInput.Text = "";
                this.textBoxDocIDInput.Text = "";
                this.gridView.DataSource = God.getPropietarios();
                this.gridView.DataBind();
                MessageBox.Show("Propietario actualizado: " + newName);
            }
            else
                MessageBox.Show("Error en las entradas");
        }
    }
}