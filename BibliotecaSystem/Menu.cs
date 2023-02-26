using BibliotecaSystem.FormsA;
using BibliotecaSystem.FormsAgregar;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BibliotecaSystem
{
    public partial class Menu : Form
    {
        public Menu()
        {
            InitializeComponent();
        }

        private void CerrarMenu_Click_1(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void MinMenu_Click_1(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }

        //Mover formulario
        [DllImport("user32.DLL", EntryPoint = "ReleaseCapture")]
        private extern static void ReleaseCapture();
        [DllImport("user32.DLL", EntryPoint = "SendMessage")]
        private extern static void SendMessage(System.IntPtr hWnd, int Msg, int wParam, int lParam);

        private void BarraTitulo_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }

        private void MenuV_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }

        private void Contenedor_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }


        private void AbrirLibros(object Librs)
        {
            if (this.Contenedor.Controls.Count > 0)

                this.Contenedor.Controls.RemoveAt(0);
            Form LibrosA = Librs as Form;
            LibrosA.TopLevel = false;
            LibrosA.Dock = DockStyle.Fill;
            this.Contenedor.Controls.Add(LibrosA);
            this.Contenedor.Tag = LibrosA;
            LibrosA.Show();
        }

        private void btnLibros_Click(object sender, EventArgs e)
        {
            AbrirLibros(new Libro());
        }

        private void AbrirLector(object Lectors)
        {
            if (this.Contenedor.Controls.Count > 0)

                this.Contenedor.Controls.RemoveAt(0);
            Form LectorA = Lectors as Form;
            LectorA.TopLevel = false;
            LectorA.Dock = DockStyle.Fill;
            this.Contenedor.Controls.Add(LectorA);
            this.Contenedor.Tag = LectorA;
            LectorA.Show();
        }

        private void btnLector_Click(object sender, EventArgs e)
        {
            AbrirLector(new Lector());
        }

        private void AbrirPrestamoPre(object PrestamoPresen)
        {
            if (this.Contenedor.Controls.Count > 0)

                this.Contenedor.Controls.RemoveAt(0);
            Form PrestamoPres = PrestamoPresen as Form;
            PrestamoPres.TopLevel = false;
            PrestamoPres.Dock = DockStyle.Fill;
            this.Contenedor.Controls.Add(PrestamoPres);
            this.Contenedor.Tag = PrestamoPres;
            PrestamoPres.Show();
        }

        private void btnPrestamosPre_Click(object sender, EventArgs e)
        {
            AbrirPrestamoPre(new PrestamoPre());
        }

        private void AbrirPrestamoDom(object PrestamoDomi)
        {
            if (this.Contenedor.Controls.Count > 0)

                this.Contenedor.Controls.RemoveAt(0);
            Form PrestamoDom = PrestamoDomi as Form;
            PrestamoDom.TopLevel = false;
            PrestamoDom.Dock = DockStyle.Fill;
            this.Contenedor.Controls.Add(PrestamoDom);
            this.Contenedor.Tag = PrestamoDom;
            PrestamoDom.Show();
        }
        private void btnPrestamoDom_Click(object sender, EventArgs e)
        {
            AbrirPrestamoDom(new PrestamoDom());
        }
    }
}