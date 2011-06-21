let square x = x * x
let printSqr = square >> printfn "%d"
printSqr 7
