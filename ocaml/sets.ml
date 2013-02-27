module type SetSig = sig
    type 'a set
    val empty : 'a set
    val add : 'a -> 'a set -> 'a set
    val mem : 'a -> 'a set -> bool
end

module type ChooseSetSig = sig
    include SetSig
    val choose : 'a set -> 'a option
end

module Sets : sig
    module Set : SetSig
    module ChooseSet : ChooseSetSig
end = struct
    module Set = struct
        type 'a set = 'a list
        let empty = []
        let add x xs = x :: xs
        let mem x xs = List.mem x xs
    end
    module ChooseSet = struct
        include Set
        let choose = function
            | x :: _  -> Some x
            | [] -> None
    end
end
