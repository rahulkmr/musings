open System.Windows.Forms

let form = new Form()
let btn = new Button(Text="Click Me.")
btn.Click.AddHandler(fun _ _ ->
    MessageBox.Show("Hello, World") |> ignore)
form.Controls.Add(btn)
form.ShowDialog()
