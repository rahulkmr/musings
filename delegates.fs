type DelegateType = delegate of int * int -> int
let add x y = x + y
let delegateValue = new DelegateType(fun x y -> x + y)
let delegateValue2 = new DelegateType(add)
