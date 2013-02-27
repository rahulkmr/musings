let fact n =
    let rec loop accum = function
        0 -> accum
        | i -> loop (i * accum) (i - 1)
    in
    loop 1 n
