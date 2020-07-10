using Muni.Classes;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Muni.Pages.Client
{
    public partial class ClientPanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.welcomeLbl.Text = "Bienvenido, " + Globals.CURRENTUSER + ".";
            this.gridView.DataSource = Cliente.getClientProperties(Globals.CURRENTUSER);
            this.gridView.DataBind();
            Console.WriteLine(Globals.USERID);
        }

        protected void logoutBtn_Click(object sender, EventArgs e)
        {
            Globals.logoutUser();
            Response.Redirect("../LoginPage.aspx");
        }

        private string setPropID(string PropID)
        {
            this.propidTB.Text = PropID;
            return PropID;
        }

        protected void verRecPen1Btn_Click(object sender, EventArgs e)
        {

        }

        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            //Accessing BoundField Column.
            string name = gridView.SelectedRow.Cells[0].Text;

            this.propidTB.Text = name;
        }

    }
}