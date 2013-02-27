module type EqualSig = sig
    type t
    val equal : t -> t -> bool
end

module type ValueSig = sig
    type value
end

module type MapSig = sig
    type t
    type key
    type value
    val empty : t
    val add : t -> key -> value -> t
    val find : t -> key -> value
end

module MakeMap (Equal : EqualSig) (Value : ValueSig)
: MapSig
with type key = Equal.t
with type value = Value.value = struct
    type key = Equal.t
    type value = Value.value
    type item = Key of key | Pair of key * value

    module EqualItem = struct
        type t = item
        let equal (Key key1 | Pair (key1, _)) (Key key2 | Pair(key2, _)) =
            Equal.equal key1 key2
    end

    module Set = MakeSet (EqualItem)
    type t = Set.t

    let empty = Set.empty
    let add map key value =
        Set.add (Pair (key, value)) map

    let find map key =
        match Set.find (Key key) map with
        | Pair (_, value) -> value
        | Key _ -> raise (Invalid_argument "find")
end

