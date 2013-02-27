let rec rev accum = function
    h :: t -> rev (h :: accum) t
    | [] -> accum

let map f l =
    let rec rev_map accum = function
        h :: t -> rev_map (f h :: accum) t
        | [] -> accum
    in rev [] (rev_map [] l)
