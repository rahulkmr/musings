open System.Collections.Generic

type Person =
    {First: string; Last: string}
    override this.ToString() = sprintf "%s, %s" this.Last this.First

let people =
    new List<_>(
        [|
            {First = "Foo"; Last = "Bar"}
            {First = "Bar"; Last = "Baz"}
            {First = "Baz"; Last = "Blah"}

        |]
    )

let printPeople () =
    people |> Seq.iter (fun p -> printfn "\t %s" <| p.ToString())

people.Sort(
    {
    	new IComparer<Person> with
    	    member this.Compare(l, r) =
    	        if l.First > r.First then 1
    	        elif l.First < r.First then -1 
    	        else 0
    }
)

printPeople()
