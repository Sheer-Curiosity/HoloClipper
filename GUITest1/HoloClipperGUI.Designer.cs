namespace GUITest1
{
    partial class HoloClipper
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(HoloClipper));
            this.startClip = new System.Windows.Forms.Button();
            this.clipDLDirectory = new System.Windows.Forms.TextBox();
            this.clipOutLabel = new System.Windows.Forms.Label();
            this.browseClipOut = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.mediaLinkLabel = new System.Windows.Forms.Label();
            this.mediaLinkInput = new System.Windows.Forms.TextBox();
            this.timestampsInput = new System.Windows.Forms.TextBox();
            this.clipFromYT = new System.Windows.Forms.CheckBox();
            this.clipFromLocalFile = new System.Windows.Forms.CheckBox();
            this.isHoloRewind = new System.Windows.Forms.CheckBox();
            this.localFileDirectory = new System.Windows.Forms.TextBox();
            this.localFileLabel = new System.Windows.Forms.Label();
            this.browseLocalFile = new System.Windows.Forms.Button();
            this.clipNameInput = new System.Windows.Forms.TextBox();
            this.clipNameLabel = new System.Windows.Forms.Label();
            this.timestampsLabel = new System.Windows.Forms.Label();
            this.clipFromOtherSite = new System.Windows.Forms.CheckBox();
            this.linkLabel1 = new System.Windows.Forms.LinkLabel();
            this.label1 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // startClip
            // 
            this.startClip.Location = new System.Drawing.Point(331, 247);
            this.startClip.Margin = new System.Windows.Forms.Padding(2);
            this.startClip.Name = "startClip";
            this.startClip.Size = new System.Drawing.Size(92, 24);
            this.startClip.TabIndex = 0;
            this.startClip.Text = "Start Clipping";
            this.startClip.UseVisualStyleBackColor = true;
            this.startClip.Click += new System.EventHandler(this.startClip_Click);
            // 
            // clipDLDirectory
            // 
            this.clipDLDirectory.Location = new System.Drawing.Point(102, 137);
            this.clipDLDirectory.Margin = new System.Windows.Forms.Padding(2);
            this.clipDLDirectory.Name = "clipDLDirectory";
            this.clipDLDirectory.Size = new System.Drawing.Size(290, 20);
            this.clipDLDirectory.TabIndex = 1;
            // 
            // clipOutLabel
            // 
            this.clipOutLabel.AutoSize = true;
            this.clipOutLabel.Location = new System.Drawing.Point(6, 140);
            this.clipOutLabel.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.clipOutLabel.Name = "clipOutLabel";
            this.clipOutLabel.Size = new System.Drawing.Size(94, 13);
            this.clipOutLabel.TabIndex = 2;
            this.clipOutLabel.Text = "Clip Output Folder:";
            this.clipOutLabel.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // browseClipOut
            // 
            this.browseClipOut.Location = new System.Drawing.Point(399, 137);
            this.browseClipOut.Margin = new System.Windows.Forms.Padding(2);
            this.browseClipOut.Name = "browseClipOut";
            this.browseClipOut.Size = new System.Drawing.Size(24, 20);
            this.browseClipOut.TabIndex = 3;
            this.browseClipOut.Text = "...";
            this.browseClipOut.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            this.browseClipOut.UseVisualStyleBackColor = true;
            this.browseClipOut.Click += new System.EventHandler(this.browseOut_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(143, 9);
            this.label2.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(154, 29);
            this.label2.TabIndex = 4;
            this.label2.Text = "HoloClipper";
            // 
            // mediaLinkLabel
            // 
            this.mediaLinkLabel.AutoSize = true;
            this.mediaLinkLabel.Location = new System.Drawing.Point(38, 91);
            this.mediaLinkLabel.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.mediaLinkLabel.Name = "mediaLinkLabel";
            this.mediaLinkLabel.Size = new System.Drawing.Size(62, 13);
            this.mediaLinkLabel.TabIndex = 5;
            this.mediaLinkLabel.Text = "Media Link:";
            // 
            // mediaLinkInput
            // 
            this.mediaLinkInput.Location = new System.Drawing.Point(102, 88);
            this.mediaLinkInput.Margin = new System.Windows.Forms.Padding(2);
            this.mediaLinkInput.Name = "mediaLinkInput";
            this.mediaLinkInput.Size = new System.Drawing.Size(290, 20);
            this.mediaLinkInput.TabIndex = 6;
            // 
            // timestampsInput
            // 
            this.timestampsInput.Location = new System.Drawing.Point(102, 63);
            this.timestampsInput.Name = "timestampsInput";
            this.timestampsInput.Size = new System.Drawing.Size(290, 20);
            this.timestampsInput.TabIndex = 7;
            // 
            // clipFromYT
            // 
            this.clipFromYT.AutoSize = true;
            this.clipFromYT.Location = new System.Drawing.Point(255, 166);
            this.clipFromYT.Name = "clipFromYT";
            this.clipFromYT.Size = new System.Drawing.Size(116, 17);
            this.clipFromYT.TabIndex = 8;
            this.clipFromYT.Text = "Clip From YouTube";
            this.clipFromYT.UseVisualStyleBackColor = true;
            this.clipFromYT.CheckedChanged += new System.EventHandler(this.clipFromYT_CheckedChanged);
            // 
            // clipFromLocalFile
            // 
            this.clipFromLocalFile.AutoSize = true;
            this.clipFromLocalFile.Location = new System.Drawing.Point(254, 212);
            this.clipFromLocalFile.Name = "clipFromLocalFile";
            this.clipFromLocalFile.Size = new System.Drawing.Size(117, 17);
            this.clipFromLocalFile.TabIndex = 9;
            this.clipFromLocalFile.Text = "Clip From Local File";
            this.clipFromLocalFile.UseVisualStyleBackColor = true;
            this.clipFromLocalFile.CheckedChanged += new System.EventHandler(this.clipFromLocalFile_CheckedChanged);
            // 
            // isHoloRewind
            // 
            this.isHoloRewind.AutoSize = true;
            this.isHoloRewind.Location = new System.Drawing.Point(9, 189);
            this.isHoloRewind.Name = "isHoloRewind";
            this.isHoloRewind.Size = new System.Drawing.Size(135, 17);
            this.isHoloRewind.TabIndex = 10;
            this.isHoloRewind.Text = "HoloRewind Standards";
            this.isHoloRewind.UseVisualStyleBackColor = true;
            // 
            // localFileDirectory
            // 
            this.localFileDirectory.Enabled = false;
            this.localFileDirectory.Location = new System.Drawing.Point(102, 113);
            this.localFileDirectory.Name = "localFileDirectory";
            this.localFileDirectory.Size = new System.Drawing.Size(290, 20);
            this.localFileDirectory.TabIndex = 11;
            // 
            // localFileLabel
            // 
            this.localFileLabel.AutoSize = true;
            this.localFileLabel.Enabled = false;
            this.localFileLabel.Location = new System.Drawing.Point(45, 117);
            this.localFileLabel.Name = "localFileLabel";
            this.localFileLabel.Size = new System.Drawing.Size(55, 13);
            this.localFileLabel.TabIndex = 12;
            this.localFileLabel.Text = "Local File:";
            // 
            // browseLocalFile
            // 
            this.browseLocalFile.Enabled = false;
            this.browseLocalFile.Location = new System.Drawing.Point(399, 113);
            this.browseLocalFile.Name = "browseLocalFile";
            this.browseLocalFile.Size = new System.Drawing.Size(24, 20);
            this.browseLocalFile.TabIndex = 13;
            this.browseLocalFile.Text = "...";
            this.browseLocalFile.UseVisualStyleBackColor = true;
            this.browseLocalFile.Click += new System.EventHandler(this.browseLocalFile_Click);
            // 
            // clipNameInput
            // 
            this.clipNameInput.Location = new System.Drawing.Point(101, 163);
            this.clipNameInput.Name = "clipNameInput";
            this.clipNameInput.Size = new System.Drawing.Size(148, 20);
            this.clipNameInput.TabIndex = 14;
            // 
            // clipNameLabel
            // 
            this.clipNameLabel.AutoSize = true;
            this.clipNameLabel.Location = new System.Drawing.Point(42, 166);
            this.clipNameLabel.Name = "clipNameLabel";
            this.clipNameLabel.Size = new System.Drawing.Size(58, 13);
            this.clipNameLabel.TabIndex = 15;
            this.clipNameLabel.Text = "Clip Name:";
            // 
            // timestampsLabel
            // 
            this.timestampsLabel.AutoSize = true;
            this.timestampsLabel.Location = new System.Drawing.Point(34, 66);
            this.timestampsLabel.Name = "timestampsLabel";
            this.timestampsLabel.Size = new System.Drawing.Size(66, 13);
            this.timestampsLabel.TabIndex = 16;
            this.timestampsLabel.Text = "Timestamps:";
            // 
            // clipFromOtherSite
            // 
            this.clipFromOtherSite.AutoSize = true;
            this.clipFromOtherSite.Location = new System.Drawing.Point(254, 189);
            this.clipFromOtherSite.Name = "clipFromOtherSite";
            this.clipFromOtherSite.Size = new System.Drawing.Size(149, 17);
            this.clipFromOtherSite.TabIndex = 17;
            this.clipFromOtherSite.Text = "Clip From Other Video Site";
            this.clipFromOtherSite.UseVisualStyleBackColor = true;
            this.clipFromOtherSite.CheckedChanged += new System.EventHandler(this.clipFromOtherSite_CheckedChanged);
            // 
            // linkLabel1
            // 
            this.linkLabel1.AutoSize = true;
            this.linkLabel1.Location = new System.Drawing.Point(252, 253);
            this.linkLabel1.Name = "linkLabel1";
            this.linkLabel1.Size = new System.Drawing.Size(72, 13);
            this.linkLabel1.TabIndex = 18;
            this.linkLabel1.TabStop = true;
            this.linkLabel1.Text = "Video Tutorial";
            this.linkLabel1.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.linkLabel1_LinkClicked);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(154, 38);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(131, 13);
            this.label1.TabIndex = 19;
            this.label1.Text = "Created by Sheer Curiosity";
            // 
            // HoloClipper
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(438, 285);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.linkLabel1);
            this.Controls.Add(this.clipFromOtherSite);
            this.Controls.Add(this.timestampsLabel);
            this.Controls.Add(this.clipNameLabel);
            this.Controls.Add(this.clipNameInput);
            this.Controls.Add(this.browseLocalFile);
            this.Controls.Add(this.localFileLabel);
            this.Controls.Add(this.localFileDirectory);
            this.Controls.Add(this.isHoloRewind);
            this.Controls.Add(this.clipFromLocalFile);
            this.Controls.Add(this.clipFromYT);
            this.Controls.Add(this.timestampsInput);
            this.Controls.Add(this.mediaLinkInput);
            this.Controls.Add(this.mediaLinkLabel);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.browseClipOut);
            this.Controls.Add(this.clipOutLabel);
            this.Controls.Add(this.clipDLDirectory);
            this.Controls.Add(this.startClip);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Margin = new System.Windows.Forms.Padding(2);
            this.Name = "HoloClipper";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "HoloClipper";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button startClip;
        private System.Windows.Forms.TextBox clipDLDirectory;
        private System.Windows.Forms.Label clipOutLabel;
        private System.Windows.Forms.Button browseClipOut;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label mediaLinkLabel;
        private System.Windows.Forms.TextBox mediaLinkInput;
        private System.Windows.Forms.TextBox timestampsInput;
        private System.Windows.Forms.CheckBox clipFromYT;
        private System.Windows.Forms.CheckBox clipFromLocalFile;
        private System.Windows.Forms.CheckBox isHoloRewind;
        private System.Windows.Forms.TextBox localFileDirectory;
        private System.Windows.Forms.Label localFileLabel;
        private System.Windows.Forms.Button browseLocalFile;
        private System.Windows.Forms.TextBox clipNameInput;
        private System.Windows.Forms.Label clipNameLabel;
        private System.Windows.Forms.Label timestampsLabel;
        private System.Windows.Forms.CheckBox clipFromOtherSite;
        private System.Windows.Forms.LinkLabel linkLabel1;
        private System.Windows.Forms.Label label1;
    }
}

