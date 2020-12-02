using System;
using System.Collections.Generic;
using System.Management.Automation;
using System.Management.Automation.Runspaces;
using System.ComponentModel;
using System.Diagnostics;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Microsoft.PowerShell;

namespace GUITest1
{
    public partial class HoloClipper : Form
    {
        public HoloClipper()
        {
            InitializeComponent();
        }

        FolderBrowserDialog fbd = new FolderBrowserDialog();
        OpenFileDialog ofd = new OpenFileDialog();

        private void startClip_Click(object sender, EventArgs e)
        {
            Process process = new Process();

            process.StartInfo.FileName = "powershell.exe";
            process.StartInfo.Arguments = $"-executionpolicy unrestricted -windowstyle hidden youtube-dl -g --youtube-skip-dash-manifest {mediaLinkInput.Text}";
            process.StartInfo.UseShellExecute = false;
            process.StartInfo.RedirectStandardOutput = true;
            process.Start();
            string output = process.StandardOutput.ReadToEnd();
            process.WaitForExit();
            string[] split = output.Split();
            if (split.Length == 1)
            {
                string link1 = split[0];
                string link2 = link1;
            }
            else if (split.Length < 2)
            {
                MessageBox.Show("Link Error", "Error");
            }
            else if (split.Length >= 2)
            {
                string link1 = split[0];
                string link2 = split[1];
                Console.WriteLine(link1);
            }

        }

        private void browseOut_Click(object sender, EventArgs e)
        {
            if (fbd.ShowDialog() == DialogResult.OK)
            {
                clipDLDirectory.Text = fbd.SelectedPath;
            }
        }

        private void browseLocalFile_Click(object sender, EventArgs e)
        {
            if (ofd.ShowDialog() == DialogResult.OK)
            {
                localFileDirectory.Text = ofd.FileName;
            }
        }

        private void isLocalFile_CheckedChanged(object sender, EventArgs e)
        {
            if (localFileLabel.Enabled == false)
            {
                localFileLabel.Enabled = true;
                localFileDirectory.Enabled = true;
                browseLocalFile.Enabled = true;
                mediaLinkLabel.Enabled = false;
                mediaLinkInput.Enabled = false;
                mediaLinkInput.Text = "";

            }
            else if (localFileLabel.Enabled == true)
            {
                localFileLabel.Enabled = false;
                localFileDirectory.Enabled = false;
                localFileDirectory.Text = "";
                browseLocalFile.Enabled = false;
                mediaLinkLabel.Enabled = true;
                mediaLinkInput.Enabled = true;
                mediaLinkInput.Text = "";
            }
        }
    }
}
