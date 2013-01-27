class virtual ['a] o_list () =
    object
        method virtual empty : unit -> bool
        method virtual cons : 'a -> 'a o_list
        method virtual head : 'a
        method virtual tail : 'a o_list
    end

class ['a] o_cons (n, l) =
    object(self)
        inherit ['a] o_list ()
        val car = n
        val cdr = l
        method empty () = false
        method cons x = new o_cons (x, (self : 'a #o_list :> 'a o_list))
        method head = car
        method tail = cdr
    end

exception EmptyList

class ['a] o_nil () =
    object(self)
        inherit ['a] o_list ()
        method empty () = true
        method cons x = new o_cons (x, (self : 'a #o_list :> 'a o_list))
        method head = raise EmptyList
        method tail = raise EmptyList
    end
