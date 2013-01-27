module MyStack =
    struct
        type 'a t = { mutable sp : int ; mutable c : 'a array }
        exception Empty
        let create () = { sp=0 ; c = [||] }
        let clear s = s.sp <- 0; s.c <- [||]
        let increase s x = s.c <- Array.append s.c (Array.create 5 x)
        let push x s =
            if s.sp >= Array.length s.c then increase s x;
            s.c.(s.sp) <- x;
            s.sp <- succ s.sp
        let pop s =
            if s.sp = 0 then raise Empty
            else (s.sp <- pred s.sp; s.c.(s.sp))
        let length s = s.sp
        let iter f s = for i = pred s.sp downto 0 do f s.c.(i) done
    end
