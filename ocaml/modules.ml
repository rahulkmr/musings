type comparison = LT | EQ | GT
module type CompareSig = sig
    type t
    val compare : t -> t -> comparison
end

module type SetSig = sig
    module Compare : CompareSig

    type t
    type elt = Compare.t
    val empty : t
    val add : elt -> t -> t
    val mem : elt -> t -> bool
    val find : elt -> t -> elt
    val compare : t -> t -> comparison
end

module MakeSet (Compare : CompareSig)
: SetSig with module Compare = Compare =
    struct
        module Compare = Compare
        type elt = Compare.t
        type color = Red | Black
        type t = Leaf | Node of color * elt * t * t
        let empty = Leaf

        let rec find x = function
            | Leaf -> raise Not_found
            | Node (_, y, left, right) ->
                    match Compare.compare x y with
                    | LT -> find x left
                    | GT -> find x right
                    | EQ -> y

        let mem x xs =
            try ignore (find x xs); true with
            | Not_found -> false

        let add x xs =
            let rec insert = function
                | Leaf -> Node (Red, x, Leaf, Leaf)
                | Node (color, y, a, b) as s ->
                        match Compare.compare x y with
                        | LT -> balance (color, y, insert a, b)
                        | GT -> balance (color, y, a, insert b)
                        | EQ -> s
            in
            match insert s with
            | Node (_, y, a, b) -> Node (Black, y, a, b)
            | Leaf -> raise (Invalid_arugment "insert")

