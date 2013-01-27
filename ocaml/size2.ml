let null l = (l = [])

let rec size l =
    if null l then 0
    else 1 + (size (List.tl l));;

Printf.printf "%d\n" (size [1; 2; 3])
