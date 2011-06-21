[<Literal>]
let Bill = "Bill Gates"

let greet name =
    match name with
    | Bill -> "Hello Bill!"
    | x -> sprintf "Hello, %s" x

greet "Bill G."
greet "Bill Gates"
