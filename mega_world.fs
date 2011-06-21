(*
Mega Hello World:
Take two command line parameters and then print
them along with the current time to the console.
*)

open System

[<EntryPoint>]
let main (args: string[]) =
    if args.Length <> 2 then
        failwith "Error: Expected arguments <greetings> and <thing>"
    let greeting, thing = args.[0], args.[1]
    let timeOfDay = DateTime.Now.ToString("hh:mm tt")
    printfn "%s, %s at %s" greeting thing timeOfDay
    0
