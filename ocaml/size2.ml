let null l = (l = [])

let rec size l =
    if null l then 0
    else 1 + (size (List.tl l))

size []
