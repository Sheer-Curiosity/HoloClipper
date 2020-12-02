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
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.checkBox1 = new System.Windows.Forms.CheckBox();
            this.isLocalFile = new System.Windows.Forms.CheckBox();
            this.isHoloRewind = new System.Windows.Forms.CheckBox();
            this.localFileDirectory = new System.Windows.Forms.TextBox();
            this.localFileLabel = new System.Windows.Forms.Label();
            this.browseLocalFile = new System.Windows.Forms.Button();
            this.clipNameInput = new System.Windows.Forms.TextBox();
            this.clipNameLabel = new System.Windows.Forms.Label();
            this.timestampsLabel = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // startClip
            // 
            this.startClip.Location = new System.Drawing.Point(334, 229);
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
            this.clipDLDirectory.Location = new System.Drawing.Point(105, 119);
            this.clipDLDirectory.Margin = new System.Windows.Forms.Padding(2);
            this.clipDLDirectory.Name = "clipDLDirectory";
            this.clipDLDirectory.Size = new System.Drawing.Size(290, 20);
            this.clipDLDirectory.TabIndex = 1;
            // 
            // clipOutLabel
            // 
            this.clipOutLabel.AutoSize = true;
            this.clipOutLabel.Location = new System.Drawing.Point(9, 122);
            this.clipOutLabel.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.clipOutLabel.Name = "clipOutLabel";
            this.clipOutLabel.Size = new System.Drawing.Size(94, 13);
            this.clipOutLabel.TabIndex = 2;
            this.clipOutLabel.Text = "Clip Output Folder:";
            this.clipOutLabel.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // browseClipOut
            // 
            this.browseClipOut.Location = new System.Drawing.Point(402, 119);
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
            this.label2.Location = new System.Drawing.Point(60, 9);
            this.label2.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(326, 29);
            this.label2.TabIndex = 4;
            this.label2.Text = "HoloClipper GUI Front End";
            // 
            // mediaLinkLabel
            // 
            this.mediaLinkLabel.AutoSize = true;
            this.mediaLinkLabel.Location = new System.Drawing.Point(41, 73);
            this.mediaLinkLabel.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.mediaLinkLabel.Name = "mediaLinkLabel";
            this.mediaLinkLabel.Size = new System.Drawing.Size(62, 13);
            this.mediaLinkLabel.TabIndex = 5;
            this.mediaLinkLabel.Text = "Media Link:";
            // 
            // mediaLinkInput
            // 
            this.mediaLinkInput.Location = new System.Drawing.Point(105, 70);
            this.mediaLinkInput.Margin = new System.Windows.Forms.Padding(2);
            this.mediaLinkInput.Name = "mediaLinkInput";
            this.mediaLinkInput.Size = new System.Drawing.Size(290, 20);
            this.mediaLinkInput.TabIndex = 6;
            // 
            // textBox2
            // 
            this.textBox2.Location = new System.Drawing.Point(105, 45);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(290, 20);
            this.textBox2.TabIndex = 7;
            // 
            // checkBox1
            // 
            this.checkBox1.AutoSize = true;
            this.checkBox1.Location = new System.Drawing.Point(104, 194);
            this.checkBox1.Name = "checkBox1";
            this.checkBox1.Size = new System.Drawing.Size(80, 17);
            this.checkBox1.TabIndex = 8;
            this.checkBox1.Text = "checkBox1";
            this.checkBox1.UseVisualStyleBackColor = true;
            // 
            // isLocalFile
            // 
            this.isLocalFile.AutoSize = true;
            this.isLocalFile.Location = new System.Drawing.Point(258, 147);
            this.isLocalFile.Name = "isLocalFile";
            this.isLocalFile.Size = new System.Drawing.Size(137, 17);
            this.isLocalFile.TabIndex = 9;
            this.isLocalFile.Text = "Clipping From Local File";
            this.isLocalFile.UseVisualStyleBackColor = true;
            this.isLocalFile.CheckedChanged += new System.EventHandler(this.isLocalFile_CheckedChanged);
            // 
            // isHoloRewind
            // 
            this.isHoloRewind.AutoSize = true;
            this.isHoloRewind.Location = new System.Drawing.Point(104, 171);
            this.isHoloRewind.Name = "isHoloRewind";
            this.isHoloRewind.Size = new System.Drawing.Size(167, 17);
            this.isHoloRewind.TabIndex = 10;
            this.isHoloRewind.Text = "Clip to HoloRewind Standards";
            this.isHoloRewind.UseVisualStyleBackColor = true;
            // 
            // localFileDirectory
            // 
            this.localFileDirectory.Enabled = false;
            this.localFileDirectory.Location = new System.Drawing.Point(105, 95);
            this.localFileDirectory.Name = "localFileDirectory";
            this.localFileDirectory.Size = new System.Drawing.Size(290, 20);
            this.localFileDirectory.TabIndex = 11;
            // 
            // localFileLabel
            // 
            this.localFileLabel.AutoSize = true;
            this.localFileLabel.Enabled = false;
            this.localFileLabel.Location = new System.Drawing.Point(48, 99);
            this.localFileLabel.Name = "localFileLabel";
            this.localFileLabel.Size = new System.Drawing.Size(55, 13);
            this.localFileLabel.TabIndex = 12;
            this.localFileLabel.Text = "Local File:";
            // 
            // browseLocalFile
            // 
            this.browseLocalFile.Enabled = false;
            this.browseLocalFile.Location = new System.Drawing.Point(402, 95);
            this.browseLocalFile.Name = "browseLocalFile";
            this.browseLocalFile.Size = new System.Drawing.Size(24, 20);
            this.browseLocalFile.TabIndex = 13;
            this.browseLocalFile.Text = "...";
            this.browseLocalFile.UseVisualStyleBackColor = true;
            this.browseLocalFile.Click += new System.EventHandler(this.browseLocalFile_Click);
            // 
            // clipNameInput
            // 
            this.clipNameInput.Location = new System.Drawing.Point(104, 145);
            this.clipNameInput.Name = "clipNameInput";
            this.clipNameInput.Size = new System.Drawing.Size(148, 20);
            this.clipNameInput.TabIndex = 14;
            // 
            // clipNameLabel
            // 
            this.clipNameLabel.AutoSize = true;
            this.clipNameLabel.Location = new System.Drawing.Point(45, 148);
            this.clipNameLabel.Name = "clipNameLabel";
            this.clipNameLabel.Size = new System.Drawing.Size(58, 13);
            this.clipNameLabel.TabIndex = 15;
            this.clipNameLabel.Text = "Clip Name:";
            // 
            // timestampsLabel
            // 
            this.timestampsLabel.AutoSize = true;
            this.timestampsLabel.Location = new System.Drawing.Point(37, 48);
            this.timestampsLabel.Name = "timestampsLabel";
            this.timestampsLabel.Size = new System.Drawing.Size(66, 13);
            this.timestampsLabel.TabIndex = 16;
            this.timestampsLabel.Text = "Timestamps:";
            // 
            // HoloClipper
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(438, 264);
            this.Controls.Add(this.timestampsLabel);
            this.Controls.Add(this.clipNameLabel);
            this.Controls.Add(this.clipNameInput);
            this.Controls.Add(this.browseLocalFile);
            this.Controls.Add(this.localFileLabel);
            this.Controls.Add(this.localFileDirectory);
            this.Controls.Add(this.isHoloRewind);
            this.Controls.Add(this.isLocalFile);
            this.Controls.Add(this.checkBox1);
            this.Controls.Add(this.textBox2);
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
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.CheckBox checkBox1;
        private System.Windows.Forms.CheckBox isLocalFile;
        private System.Windows.Forms.CheckBox isHoloRewind;
        private System.Windows.Forms.TextBox localFileDirectory;
        private System.Windows.Forms.Label localFileLabel;
        private System.Windows.Forms.Button browseLocalFile;
        private System.Windows.Forms.TextBox clipNameInput;
        private System.Windows.Forms.Label clipNameLabel;
        private System.Windows.Forms.Label timestampsLabel;
    }
}

