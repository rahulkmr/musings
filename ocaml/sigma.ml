open Printf

let sigma x =
    let rec sigma_iter x accum =
        if x = 0 then accum else sigma_iter (x - 1) (accum + x)
    in
    if x < 0 then x
    else sigma_iter x 0;;

printf "%d\n" (sigma 10)
