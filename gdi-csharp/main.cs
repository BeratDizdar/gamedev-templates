using System;
using System.Drawing;
using System.Windows.Forms;

public class MainForm : Form
{
    public MainForm()
    {
        this.DoubleBuffered = true;
        this.Width = 800;
        this.Height = 600;
        this.Text = "GDI C#";
    }

    protected override void OnPaint(PaintEventArgs e)
    {
        Graphics g = e.Graphics;
        g.Clear(Color.White);
        g.DrawString("Hello, World!", new Font("Consolas", 32), Brushes.Black, 200, 250);
    }

    [STAThread]
    public static void Main()
    {
        Application.EnableVisualStyles();
        Application.SetCompatibleTextRenderingDefault(false);
        Application.Run(new MainForm());
    }
}
