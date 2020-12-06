using System;
using System.Collections.Generic;
using System.Management.Automation;
using System.Management.Automation.Runspaces;
using System.ComponentModel;
using System.Diagnostics;
using System.Data;
using System.Drawing;
using System.IO;
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
            if (clipDLDirectory.Text == "")
            {
                MessageBox.Show("String Error: No Output Directory Given", "Error");
            }
            else if (mediaLinkInput.Enabled == true && mediaLinkInput.Text == "")
            {
                MessageBox.Show("String Error: No Media Link Given", "Error");
            }
            else if (localFileDirectory.Enabled == true && localFileDirectory.Text == "")
            {
                MessageBox.Show("String Error: No Local File Given", "Error");
            }
            else if (timestampsInput.Text == "")
            {
                MessageBox.Show("String Error: No Timestamps Given", "Error");
            }
            else if (clipFromYT.Checked == false && clipFromOtherSite.Checked == false && clipFromLocalFile.Checked == false)
            {
                MessageBox.Show("Input Error: No Clipping Source Was Specified", "Error");
            }
            else
            {
                if (clipFromYT.Checked == true)
                {
                    string hlrwStandard = "n";
                    if (isHoloRewind.Checked == true)
                    {
                        hlrwStandard = "y";
                    }

                    string clipNameIn = clipNameInput.Text;
                    string mediaLinkIn = mediaLinkInput.Text;
                    string timestampsIn = $"\"{timestampsInput.Text}\"";
                    string downloadDir = clipDLDirectory.Text;
                    var downloadDirSafe = downloadDir.Replace(" ", "` ");
                    Console.WriteLine(timestampsIn);
                    Console.WriteLine(downloadDir);
                    System.Threading.Thread.Sleep(1000);
                    PowerShell ytdlTest = PowerShell.Create();
                    string cmd = $"./bin/clipper.exe -fulltitle {clipNameIn} -videotype a -hlrwstandards {hlrwStandard} -inlink {mediaLinkIn} -dlDir {downloadDirSafe} -timestampsIn {timestampsIn}";
                    ytdlTest.AddScript(cmd);
                    ytdlTest.Invoke();
                    MessageBox.Show("Clipping Complete!", "Notice");
                }
                else if (clipFromOtherSite.Checked == true)
                {
                    string hlrwStandard = "n";
                    if (isHoloRewind.Checked == true)
                    {
                        hlrwStandard = "y";
                    }

                    string clipNameIn = clipNameInput.Text;
                    string mediaLinkIn = mediaLinkInput.Text;
                    string timestampsIn = $"\"{timestampsInput.Text}\"";
                    string downloadDir = clipDLDirectory.Text;
                    var downloadDirSafe = downloadDir.Replace(" ", "` ");
                    PowerShell ytdlTest = PowerShell.Create();
                    string cmd = $"./bin/clipper.exe -fulltitle {clipNameIn} -videotype b -hlrwstandards {hlrwStandard} -inlink {mediaLinkIn} -dlDir {downloadDirSafe} -timestampsIn {timestampsIn}";
                    ytdlTest.AddScript(cmd);
                    ytdlTest.Invoke();
                    MessageBox.Show("Clipping Complete!", "Notice");
                }
                else if (clipFromLocalFile.Checked == true)
                {
                    string hlrwStandard = "n";
                    if (isHoloRewind.Checked == true)
                    {
                        hlrwStandard = "y";
                    }

                    string clipNameIn = clipNameInput.Text;
                    string tempFileIn = localFileDirectory.Text;
                    string timestampsIn = $"\"{timestampsInput.Text}\"";
                    string downloadDir = clipDLDirectory.Text;
                    var downloadDirSafe = downloadDir.Replace(" ", "` ");
                    var tempFileInSafe = tempFileIn.Replace(" ", "` ");
                    PowerShell ytdlTest = PowerShell.Create();
                    string cmd = $"./bin/clipper.exe -fulltitle {clipNameIn} -videotype c -hlrwstandards {hlrwStandard} -tempfile {tempFileInSafe} -dlDir {downloadDirSafe} -timestampsIn {timestampsIn}";
                    ytdlTest.AddScript(cmd);
                    ytdlTest.Invoke();
                    MessageBox.Show("Clipping Complete!", "Notice");
                }
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

        private void clipFromLocalFile_CheckedChanged(object sender, EventArgs e)
        {
            if (clipFromYT.Enabled == true)
            {
                clipFromYT.Enabled = false;
                clipFromOtherSite.Enabled = false;
            }
            else if (clipFromYT.Enabled == false)
            {
                clipFromYT.Enabled = true;
                clipFromOtherSite.Enabled = true;
            }

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

        private void clipFromOtherSite_CheckedChanged(object sender, EventArgs e)
        {
            if (clipFromLocalFile.Enabled == true)
            {
                clipFromYT.Enabled = false;
                clipFromLocalFile.Enabled = false;
            }
            else if (clipFromLocalFile.Enabled == false)
            {
                clipFromYT.Enabled = true;
                clipFromLocalFile.Enabled = true;
            }
        }

        private void clipFromYT_CheckedChanged(object sender, EventArgs e)
        {
            if (clipFromOtherSite.Enabled == true)
            {
                clipFromOtherSite.Enabled = false;
                clipFromLocalFile.Enabled = false;
            }
            else if (clipFromOtherSite.Enabled == false)
            {
                clipFromOtherSite.Enabled = true;
                clipFromLocalFile.Enabled = true;
            }
        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            Process.Start("https://youtu.be/1vU4kjeCy4k");
        }
    }
}
