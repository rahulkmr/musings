open System

type Rounding(sigDigs: int) =
    member this.Bind(x: float, rest: float -> float) =
        rest <| Math.Round(x, sigDigs)
    member this.Return (x: float) = Math.Round(x, sigDigs)

let withPrecision sigDigs = new Rounding(sigDigs)
let test =
    withPrecision 5 {
        let! x = 2.0 / 12.0
        let! y = 3.5
        return x / y
    }
