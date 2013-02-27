type 'a bin_tree =
    Empty
    | Node of 'a bin_tree * 'a * 'a bin_tree

let rec list_of_tree = function
    Empty -> []
    | Node(lb, r, rb) -> (list_of_tree lb) @ (r :: (list_of_tree rb))
let rec cardinality = function
    | Empty -> 0
    | Node (left, _, right) ->
            cardinality left + cardinality right + 1

let rec insert x = function
    | Empty -> Node(Empty, x, Empty)
    | Node (left, y, right) as node ->
            if x < y then
                Node(insert x left, y, right)
            else if x > y then
                Node(left, y, insert x right)
            else
                node

let rec tree_of_list = function
    | [] -> Empty
    | x :: xs -> insert x (tree_of_list xs)
    
let rec mem x = function
    Empty -> false
    | Node(left, y, right) ->
            x = y || (x < y && mem x left) || (x > y && mem x right)
