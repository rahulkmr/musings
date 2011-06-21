type BinaryTree =
    | Node of int * BinaryTree * BinaryTree
    | Empty

let rec printInOrder tree =
    match tree with
    | Node (data, left, right) ->
        printInOrder left
        printfn "Node %d" data
        printInOrder right
    | Empty -> ()

let binTree =
    Node(2, 
        Node(1, Empty, Empty),
        Node(4, 
            Node(3, Empty, Empty),
            Node(5, Empty, Empty)
        )
    )

printInOrder binTree
