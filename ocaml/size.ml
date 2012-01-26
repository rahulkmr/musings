let size l =
    let rec size_iter l accum = 
        if l = [] then accum
        else size_iter (List.tl l) (accum + 1)
    in size_iter l 0;;

size [1;2;3]
