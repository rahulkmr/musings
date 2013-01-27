let rec hilo n =
    print_string "Enter a number: ";
    let i = read_int () in
    if i = n then print_string "Bravo!!\n\n"
    else
        begin
            if i < n then print_string "Higher\n" else print_string "Lower\n";
            hilo n
        end

let _ = hilo 119
