type Result = Success of float | DivByZero

let divide x y =
    match y with
    | 0.0 -> DivByZero
    | _ -> Success(x / y)

let let_with_check res rest =
    match res with
    | DivByZero -> DivByZero
    | Success(x) -> rest x

let totalResistance r1 r2 r3 =
    let_with_check (divide 1.0 r1) (fun x ->
    let_with_check (divide 1.0 r2) (fun y ->
    let_with_check (divide 1.0 r3) (fun z ->
    divide 1.0 (x + y + z)))) 
