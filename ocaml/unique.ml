open Printf

let rec unique already_read =
    printf "%s" "> ";
    flush stdout;
    let line = input_line stdin in
    if not (Set.mem line already_read) then (
        printf "%s\n" line;
        unique (Set.add line already_read )
    ) else
        unique already_read;;

try unique Set.empty with
| End_of_file -> ()
