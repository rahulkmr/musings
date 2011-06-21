type Tastiness =
    | Delicious
    | SoSo
    | TrySomethingElse

type IConsumable =
    abstract Eat: unit -> unit
    abstract Tastiness: Tastiness

type Apple() =
    interface IConsumable with
        override this.Eat() = printfn "Tastey"
        override this.Tastiness = Delicious
