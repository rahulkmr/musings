type 'a ubtree = Node of 'a * 'a ubtree list
module rec Tree : sig
    val map : ('a -> 'b) -> 'a ubtree -> 'b ubtree
end = struct
    let map f (Node (x, children)) =
        Node (f x, Forest.map f children)
end

and Forest : sig
    val map : ('a -> 'b) -> 'a ubtree list -> 'b ubtree list
end = struct
    let map f xs =
        List.map (Tree.map f) xs
end

