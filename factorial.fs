let fact (n: uint64) =
    let rec factorial (n: uint64) (acc: uint64) = 
        match n with
        | _ when n <= 1UL -> acc
        | _ -> factorial (n - 1UL) (acc * n)
    factorial n 1UL
