module type EqualSig = sig
    type t
    val equal : t -> t -> bool
end

module MakeSet (Equal : EqualSig) : sig
    type elt
    type t
    val empty : t
    val mem : elt -> t -> bool
    val add : elt -> t -> t
    val find : elt -> t -> elt
end with type elt = Equal.t = struct
    open Equal
    type elt = Equal.t
    type t = elt list
    let empty = []
    let mem x xs = List.exists (equal x) xs
    let add x xs = x :: xs
    let find x xs = List.find (equal x) xs
end

module StringCaseEqual = struct
    type t = string
    let equal s1 s2 =
        String.lowercase s1 = String.lowercase s2
end

module SSet = MakeSet (StringCaseEqual)
