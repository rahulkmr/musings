type 'a set = 'a list
let empty = []
let add x xs = x :: xs
let mem x xs = List.mem x xs
let choose = function
    | x :: _ -> Some x
    | [] -> None
