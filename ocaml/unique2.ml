open Printf

module type SetSig = sig
    type 'a set
    val empty : 'a set
    val add : 'a -> 'a set -> 'a set
    val mem : 'a -> 'a set -> bool
end

module SetInternal = struct
    type 'a set = 'a list
    let empty = []
    let add x xs = x :: xs
    let mem x xs = List.mem x xs
end

module Set : SetSig = SetInternal

module type ChooseSetSig = sig
    include SetSig
    val choose : 'a set -> 'a option
end

module ChooseSet : ChooseSetSig = struct
    include SetInternal
    let choose = function
        | x :: _ -> Some x
        | [] -> None
end

let rec unique already_read =
    printf "%s" "> ";
    flush stdout;
    let line = input_line stdin in
    if not (Set.mem line already_read) then (
        printf "%s\n" line;
        unique (Set.add line already_read )
    ) else
        unique already_read;;

try unique Set.empty with
| End_of_file -> ()
