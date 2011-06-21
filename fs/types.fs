type Suit =
    | Heart
    | Diamond
    | Spade
    | Club

type PlayingCard =
    | Ace of Suit
    | King of Suit
    | Queen of Suit
    | Jack of Suit
    | ValueCard of int * Suit

let deckOfCards =
    [
        for suit in [Spade; Club; Heart; Diamond] do
        	yield Ace(suit)
        	yield King(suit)
        	yield Queen(suit)
        	yield Jack(suit)
        	for value in 2 .. 10 do
        		yield ValueCard(value, suit)
    ]
