#r "WindowsBase.dll"
#r "PresentationCore.dll"
#r "PresentationFramework.dll"

open System
open System.Windows
open System.Windows.Controls

let win = new Window(Height=128.0, Width=360.0)
let label = new Label()
label.FontSize <- 62.0
label.Content <- "Hello, World"

win.Content <- label

let app = new Application()
app.Run(win)
