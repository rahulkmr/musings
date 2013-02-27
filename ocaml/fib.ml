let rec fib = function
    i when i < 2 -> i
    | i -> fib (i - 1) + fib (i -2)
