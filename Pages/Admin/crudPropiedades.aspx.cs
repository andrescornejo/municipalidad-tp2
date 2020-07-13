using Muni.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Muni.Pages.Admin
{
    public partial class crudPropiedades : System.Web.UI.Page
    {
        string noneSelected = "Propiedad seleccionada: ninguna";
        string selected = "Propiedad seleccionada: ";
        string currentProp = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                clearTextBoxes();
                reloadGridView();
            }
    }

        protected void gridLink_Clicked(object sender, EventArgs e)
        {
            string numProp = gridProp.SelectedRow.Cells[1].Text;
            currentProp = numProp;
            lblDelProp.Text = numProp; //selected + numProp;
        }

        protected void btnCreateProp_Click(object sender, EventArgs e)
        {
            int numFinca = Int32.Parse(tb_CnumProp.Text);
            int valorFinca = Int32.Parse(tb_Cvalor.Text);
            string direccion = tb_Cdir.Text;

            if (tb_CnumProp.Text!="" && tb_Cvalor.Text!="" && tb_Cdir.Text!="")
            {
                AdminWeb.createPropiedad(numFinca, valorFinca, direccion, Globals.CURRENTUSER, Globals.CURRENTIP);
                clearTextBoxes();
                reloadGridView();
                MessageBox.Show("Propiedad agregada: " + numFinca);
            }
            else
                MessageBox.Show("Error en las entradas");
        }

        protected void reloadGridView()
        {
            this.gridProp.DataSource = AdminWeb.getPropiedades();
            this.gridProp.DataBind();
        }

        protected void clearTextBoxes()
        {
            tb_CnumProp.Text = "";
            tb_Cvalor.Text = "";
            tb_Cdir.Text = "";
            lblDelProp.Text = noneSelected;
            currentProp = "";
        }

        protected void btnDeleteProp_Click(object sender, EventArgs e)
        {
            bool test;
            int numFinca;  
            test = Int32.TryParse(currentProp, out numFinca);

            if (lblDelProp.Text == noneSelected && !test)
                MessageBox.Show(currentProp);//MessageBox.Show("Error en las entradas");
            else
            {
                AdminWeb.deletePropiedad(numFinca, Globals.CURRENTUSER, Globals.CURRENTIP);
                clearTextBoxes();
                reloadGridView();
                MessageBox.Show("Propiedad borrada: " + numFinca);
            }
                
        }

        protected void gridProp_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                MessageBox.Show("GAYSHIT ");
                //Determine the RowIndex of the Row whose Button was clicked.
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                //Reference the GridView Row.
                GridViewRow row = gridProp.Rows[rowIndex];

                //Fetch value of Name.

                currentProp = row.Cells[1].Text;
                bool test;
                int numFinca;
                test = Int32.TryParse(currentProp, out numFinca);

                if (lblDelProp.Text == noneSelected && !test)
                    MessageBox.Show("dickballs");//MessageBox.Show("Error en las entradas");
                else
                {
                    tb_CnumProp.Text = currentProp;
                    MessageBox.Show("Ballsack"+numFinca);
                }
            }
        }

        protected void gridProp_SelectedIndexChanged(object sender, EventArgs e)
        {

            MessageBox.Show("GAYSHIT ");
            //Determine the RowIndex of the Row whose Button was clicked.
            string name = gridProp.SelectedRow.Cells[1].Text;

            bool test;
            int numFinca;
            test = Int32.TryParse(name, out numFinca);

            if (lblDelProp.Text == noneSelected && !test)
                MessageBox.Show("dickballs");//MessageBox.Show("Error en las entradas");
            else
            {
                tb_CnumProp.Text = currentProp;
                MessageBox.Show("Ballsack" + numFinca);
            }
            
        }
    }
}