open System

let highLowGame () =
    let rng = new Random()
    let secret = rng.Next() % 100

    let rec gameStep () =
        printfn "Guess:"
        let guess = Console.ReadLine() |> Int32.Parse

        match guess with
        | _ when guess > secret ->
            printfn "The number is lower."
            gameStep()
        | _ when guess = secret ->
            printfn "Bingo"
            ()
        | _ when guess < secret ->
            printfn "The number is higher."
            gameStep()

    gameStep()

highLowGame()
