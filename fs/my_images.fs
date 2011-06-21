open System
open System.IO
open System.Collections.Generic
open System.Drawing
open System.Windows.Forms

let images =
    let myPictures =
        Environment.GetFolderPath(Environment.SpecialFolder.MyPictures)

    Directory.GetFiles(myPictures, "*.jpg")
    |> Seq.map (fun filePath ->
        Path.GetFileName(filePath),
        Bitmap.FromFile(filePath))

let dg = new DataGridView(Dock = DockStyle.Fill)
dg.DataSource <- new List<_>(images)

let f = new Form()
f.Controls.Add(dg)
f.ShowDialog()
