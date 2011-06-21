#light

let wordCount text = 
    let words = String.Split [' '] text
    let wordSet = Set.of_list words
    let nWords = words.Length
    let nDups = words.Length - wordsSet.Count
    (nWords, nDups)

let showWordCount text = 
    let nWords, nDups = wordCount text
    printfn "--> %d words in the text" nWords
    printfn "--> %d duplicate words" nDups

showWordCount "All the king's horses and all the king's men"
