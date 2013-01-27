type data_card = string array

type data_base = { card_index : string -> int ; data: data_card list }

let field base name =
    let i = base.card_index name in fun (card : data_card) -> card.(i)

let suffix s i = try String.sub s i ((String.length s) - i)
                 with Invalid_argument("String.sub") -> ""

let split c s =
    let rec split_from n =
        try let p = String.index_from s n c
            in (String.sub s n (p-n)) :: (split_from (p+1))
        with Not_found -> [ suffix s n ]
    in if s="" then [] else split_from 0

let mk_index list_names =
    let rec make_enum a b = if a > b then [] else a::(make_enum (a+1) b) in
    let list_index = (make_enum 0 ((List.length list_names) - 1)) in
    let assoc_index_name = List.combine list_names list_index in
    function name -> List.assoc name assoc_index_name

let read_base filename =
    let channel = open_in filename in
    let split_line = split ':' in
    let list_names = split '|' (input_line channel) in
    let rec read_file () =
        try
            let data = Array.of_list (split_line (input_line channel)) in
            data::(read_file ())
        with End_of_file -> close_in channel; []
    in { card_index = mk_index list_names ; data = read_file () }

let eq_sfield db s n dc = (s = (field db n dc))
let nonempty_sfield db n dc = ("" <> (field db n dc))
