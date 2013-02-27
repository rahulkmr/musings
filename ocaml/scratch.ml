open Printf

let rec sum = function
    | [] -> 0
    | x :: xs -> x + sum xs

let sum2 xs =
    let rec fn accum = function
        | [] -> accum
        | x :: xs' -> fn (x + accum) xs'
    in fn 0 xs

let rec mem x = function
    | [] -> false
    | y :: ys -> x = y || mem x ys

let rec assoc key = function
    | [] -> raise Not_found
    | (k, v) :: kvs -> if k = key then
        v
    else
        assoc key kvs

let fact n =
    let rec loop accum = function
        | i when i < 2 -> accum
        | i -> loop (accum * i) (i - 1)
    in loop 1 n

let rec rev accum = function
    | [] -> accum
    | x :: xs -> rev (x :: accum) xs

let rec rev_map f accum = function
    | [] -> accum
    | x :: xs -> rev_map f (f x :: accum) xs

let map f xs = rev [] (rev_map f [] xs)

type number =
    | Zero
    | Integer of int
    | Real of float

let float_of_number = function
    | Zero -> 0.0
    | Integer i -> float_of_int i
    | Real x -> x

let add n1 n2 =
    match n1, n2 with
    | Zero, n | n, Zero -> n
    | Integer i1, Integer i2 -> Integer (i1 + i2)
    | Real x, Integer i | Integer i, Real x -> Real (x +. float_of_int i)
    | Real x1, Real x2 -> Real (x1 +. x2)

type 'a tree =
    | Leaf
    | Node of 'a * 'a tree * 'a tree

let rec cardinality = function
    | Leaf -> 0
    | Node (_, left, right) ->
            cardinality left + cardinality right + 1

let rec tree_search x = function
    | Leaf -> false
    | Node (y, left, right) ->
            x = y || (x < y && tree_search x left) || (x > y && tree_search x right)

let rec tree_insert x = function
    | Leaf -> Node (x, Leaf, Leaf)
    | Node (y, left, right) as node ->
            if x < y then
                Node (y, tree_insert x left, right)
            else if x > y then
                Node (y, left, tree_insert x right)
            else
                node

let rec tree_of_list = function
    | [] -> Leaf
    | x :: xs -> tree_insert x (tree_of_list xs)

let factorial i =
    let j = ref 1 in
    for k = 2 to i do
        j := !j * k
    done;
    !j

let factorial2 n =
    let n = ref n in
    let i = ref 1 in
    while !n > 0 do
        i := !i * !n;
        n := !n - 1
    done;
    !i

type 'a queue = ('a list * 'a list) ref

let create () =
    ref ([], [])

let add queue x =
    let front, back = !queue in
    queue := (x :: front, back)

let rec take queue =
    match !queue with
    | (front, x :: back) ->
            queue := (front, back); x
    | ([], []) -> raise (Invalid_argument "queue is empty")
    | (front, []) ->
            queue := ([], List.rev front);
            take queue

type 'a elem =
    | Nil
    | Elem of 'a * 'a elem ref * 'a elem ref

let nil_elem = Nil
let create_elem x = Elem (x, ref Nil, ref Nil)
let get_elem = function
    | Elem (x, _, _) -> x
    | Nil -> raise (Invalid_argument "get_elem")
let prev_elem = function
    | Nil -> raise (Invalid_argument "prev_element")
    | Elem (_, prev, _) -> !prev
let next_elem = function
    | Nil -> raise (Invalid_argument "prev_element")
    | Elem (_, _, next) -> !next

type 'a dllist = 'a elem ref
let create_dllist () = ref Nil
let insert_dllist list elem =
    match elem, !list with
    | Elem (_, prev, next), Nil ->
            prev := Nil;
            next := Nil;
            list := elem
    | Elem (_, prev1, next1), (Elem (_, prev2, _) as head) ->
            prev1 := Nil;
            next1 := head;
            prev2 := elem;
            list := elem
    | Nil,_ -> raise (Invalid_argument "insert_dllist")

let remove_dllist list elem =
    match elem with
    | Elem (_, prev, next) ->
            (match !prev with
            | Elem (_, _, prev_next) -> prev_next := !next
            | Nil -> list := !next);
            (match !next with
            | Elem (_, next_prev, _) -> next_prev := !prev
            | Nil -> ())

    | Nil -> raise (Invalid_argument "remove_dllist")

let memo f =
    let table = ref [] in
    let rec find_or_apply entries x =
        match entries with
        | (x', y) :: _ when x' = x -> y
        | _ :: entries' -> find_or_apply entries' x
        | [] -> let y = f x in table := (x, y) :: !table; y
    in (fun x -> find_or_apply !table x)

let rec ref fib = function
    | 0 | 1 as i -> i
    | i -> fib (i - 1) + fib (i - 2)

let time f x =
    let start = Sys.time() in
    let y = f x in
    let finish = Sys.time() in
    Printf.printf "Elapsed time: %f seconds\n" (finish -. start);
    y

let memo_fib = memo fib

type db_entry =
    {
        name : string;
        height : float;
        phone : string;
        mutable salary : float;
    }
let jason = { name = "Jason"; height = 6.25; phone = "626-555-1212"; salary =
    50.0 }

let a = Array.create 10 1
Array.blit [|3; 5; 7; 9|] 1 a 3 2;;

let s = "Jason"

let random_numbers =
    [|0x04a018c6; 0x5ba7b0f2; 0x04dcf08b; 0x1e5a22cc; 0x2523b9ea;|]
let random_length = Array.length random_numbers

type hash_info = { mutable hash_index : int; mutable hash_value : int }
let hash_char info c =
    let i = Char.code c in
    let index = (info.hash_index + i + 1) mod random_length in
    info.hash_value <- (info.hash_value * 3) lxor random_numbers.(index);
    info.hash_index <- index

let hash s =
    let info = { hash_index = 0; hash_value = 0 } in
    for i = 0 to String.length s - 1 do
        hash_char info s.[i]
    done;
    info.hash_value

type 'a hash_entry = { key : string; value : 'a }
type 'a hash_table = 'a hash_entry list array

let hashtable_create () =
    Array.create 101 []

let add table key value =
    let index = (hash key) mod (Array.length table) in
    table.(index) <- { key = key; value = value } :: table.(index)

let rec find_entry key = function
    | { key = key'; value = value} :: _ when key' = key -> value
    | _ :: entries -> find_entry key entries
    | [] -> raise Not_found

let find table key =
    let index = (hash key) mod (Array.length table) in
    find_entry key table.(index)

exception Fail of string

try 1 / 0 with
| Division_by_zero _ -> 0

exception Empty
let split = function
    | h :: t -> h, t
    | [] -> raise Empty
let rec exn_map f l =
    try
        let h, t = split l in
        f h :: exn_map f t
    with
    | Empty -> []

let grades = [("John", "C+"); ("Jane", "A+"); ("Joan", "B")]

let rec find_grade name (names, grades) =
    match names, grades with
    | name' :: _, grade' :: _ when name' = name -> grade'
    | _ :: names', _ :: grades' -> find_grade name (names', grades')
    | [], [] -> raise (Failure ("student is not enrolled " ^ name))
    | (_ :: _), [] | [], (_ :: _) -> raise (Invalid_argument "corrupted db")

let get_some = function
    | Some x -> x
    | None -> raise Not_found

exception Unchanged
let rec remove_inner x = function
    | y :: ys when x = y -> ys
    | y :: ys -> y :: remove_inner x ys
    | [] -> raise Unchanged

let remove x xs =
    try remove_inner x xs with
    | Unchanged -> xs

let cat in_channel out_channel =
    try
        while true do
            output_char out_channel (input_char in_channel)
        done
    with
    | End_of_file -> ()

type 'a result =
    | Success of 'a
    | Failed of exn

let finally f x cleanup =
    let result =
        try Success (f x) with
        | exn -> Failed exn
    in
    cleanup ();
    match result with
    | Success y -> y
    | Failed exn -> raise exn

exception String of string
exception Int of int
let succ xs =
    List.map (fun x ->
        match x with
        | Int i -> Int (i + 1)
        | _ -> x) xs
let xs = succ [String "hello"; Int 1; Int 7]

let rec unique already_read =
    printf "%s" "> ";
    let line = input_line stdin in
    if not (List.mem line already_read) then (
        printf "%s\n" line;
        unique (line :: already_read )
    ) else
        unique already_read

try unique [] with
| End_of_file -> ()

module A = struct
    type t = { name : string; phone : string }
end

module B = struct
    type t = { name : string; salary : float }
end
