import os
from tkinter import *

root = Tk()
root.title("TestClipper")

def runCLI(event=None):
    cliCmd = cmdInput.get()
    os.system(cliCmd)

cmdInput = Entry(root, width=50)
cmdInput.bind('<Return>', runCLI)
cmdLabel = Label(root, text="Input CLI Command:")

cmdLabel.grid(row=0, column=0)
cmdInput.grid(row=0, column=1)

root.mainloop()