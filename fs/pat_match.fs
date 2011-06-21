[<Literal>]
let Bill = "Bill Gates"

let greet name =
    match name with
    | Bill -> "Hello Bill!"
    | x -> sprintf "Hello, %s" x

printfn "%s" <| greet "Bill G."
printfn "%s" <| greet "Bill Gates"
