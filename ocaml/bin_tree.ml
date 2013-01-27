type 'a bin_tree =
    Empty
    | Node of 'a bin_tree * 'a * 'a bin_tree

let rec list_of_tree = function
    Empty -> []
    | Node(lb, r, rb) -> (list_of_tree lb) @ (r :: (list_of_tree rb))
