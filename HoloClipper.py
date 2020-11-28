import subprocess as sub
from tkinter import *
from tkinter import filedialog, messagebox


root = Tk()
root.title("TestClipper")
miniclipNum = IntVar(root)
choices = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10']

def runClp(event=None):
    if (selectDir['text'] == "Browse" or wdir == ""):
        messagebox.showerror("Error","No Directory Selected")
    else:
        output = sub.run("youtube-dl -g {}".format(youtubeLinkIn.get()), capture_output=True, text=True).stdout
        link1,link2 = output.split()
        print(link1)
        print(link2)

def getDir(event=None):
    global wdir
    wdir = filedialog.askdirectory()

clipNumMenu = OptionMenu(root, miniclipNum, *choices).grid(row=2, column=1)
selectDir = Button(root, text="Browse", anchor='w', command=getDir, width=20).grid(row=0, column=1)
selectDirLabel = Label(root, text="Choose Directory:").grid(row=0, column=0)
startPgm = Button(root, text="Start", command=runClp)
startLabel = Label(root, text="Run Clipping Tool:")
miniclipLabel = Label(root, text="Timestamps")
youtubeLinkLabel = Label(root, text="YouTube Link:")
youtubeLinkIn = Entry(root, width=25)
youtubeLinkLabel.grid(row=1, column=0)
youtubeLinkIn.grid(row=1, column=1)
startLabel.grid(row=30, column=0)
startPgm.grid(row=30, column=1)
miniclipLabel.grid(row=0, column=2)

root.mainloop()