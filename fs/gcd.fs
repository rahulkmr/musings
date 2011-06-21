// Euclid's algorithm.
let rec gcd x y =
    if y = 0 then x
    else gcd y (x % y)

let x = gcd 1024 12
printfn "%d" x
