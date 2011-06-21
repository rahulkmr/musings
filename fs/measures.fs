[<Measure>]
type far =
    static member ConvertToCel(x: float<far>) =
        (5.0<cel> / 9.0<cel>) * (x - 32.0<far>)

and [<Measure>] cel =
    static member ConvertToFar(x: float<cel>) =
        (9.0<far> / 5.0<cel> * x) + 32.0<far>

