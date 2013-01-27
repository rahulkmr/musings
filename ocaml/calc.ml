type key = Plus | Minus | Times | Div | Equals | Digit of int

let is_digit = function x -> (x >= 0) && (x <= 9)

let valid ky = match ky with
    Digit n -> is_digit n
    | _ -> true

type state = { lcd: int; lka: key; loa: key; vpr: int }

let evaluate x y ky = match ky with
    Plus -> x + y
    | Minus -> x - y
    | Times -> x * y
    | Div -> x / y
    | Equals -> y
    | Digit _ -> failwith "evaluate: no op"

let transition st ky =
    let digit_transition n = function
        Digit _ -> { st with lka=ky; vpr = st.vpr*10 + n }
        | _ -> { st with lka=ky; vpr=n}
    in
    match ky with
        Digit p -> digit_transition p st.lka
        | _ -> let res = evaluate st.lcd st.vpr st.loa
        in { lcd=res; lka=ky; loa=ky; vpr=res }

let initial_state = { lcd=0; lka=Equals; loa=Equals; vpr=0 } and
example = [ Digit 3; Plus; Digit 2; Digit 1; Times; Digit 2; Equals ]
