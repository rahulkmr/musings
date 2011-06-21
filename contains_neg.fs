let containsNeg intList =
    let filteredList = List.filter (fun x -> x < 0) intList
    if List.length filteredList > 0
    then Some(filteredList)
    else None
