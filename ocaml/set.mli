type 'a set
val empty : 'a set
val add : 'a -> 'a set -> 'a set
val mem : 'a -> 'a set -> bool
val choose : 'a set -> 'a option
