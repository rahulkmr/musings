# load "graphics.cma"

let poly =
    object
        val vertices = [|(46, 70); (54, 70); (60, 150); (40, 150)|]
        method draw = Graphics.fill_poly vertices
    end

let circle =
    object
        val center = (50, 50)
        val radius = 10
        method draw =
            let x, y = center in
            Graphics.fill_circle x y radius
    end

let square =
    object
        val lower_left = (100, 100)
        val width = 10
        method area = width * width
        method draw =
            let (x, y) = lower_left in
            Graphics.fill_rect x y width width
    end

let draw_list items =
    List.iter (fun item -> item#draw) items

let transform =
    object
        val matrix = (1., 0., 0., 0., 1., 0.)
        method repr = matrix
        method new_scale sx sy =
            {< matrix = (sx, 0., 0., 0., sy, 0.) >}
        method new_rotate theta =
            let s, c = sin theta, cos theta in
            {< matrix = (c, -.s, 0., s, c, 0.) >}
        method new_translate dx dy =
            {< matrix = (1., 0., dx, 0., 1., dy) >}
        method transform (x, y) =
            let (m11, m12, m13, m21, m22, m23) = matrix in
            (m11 *. x +. m12 *. y +. m13,
             m21 *. x +. m22 *. y +. m23)
        method multiply other =
            let (x11, x12, x13, x21, x22, x23) = matrix in
            let (y11, y12, y13, y21, y22, y23) = other#repr in
            {< matrix =
            (x11 *. y11 +. x12 *. y21,
             x11 *. y12 +. x12 *. y22,
             x11 *. y13 +. x12 *. y23 +. x13,
             x21 *. y11 +. x22 *. y21,
             x21 *. y12 +. x22 *. y22,
             x21 *. y13 +. x22 *. y23 +. x23)
            >}
    end

let int_coord (x, y) = (int_of_float x, int_of_float y)
let new_poly vertices =
    object
        val vertices = vertices
        method draw = Graphics.fill_poly (Array.map int_coord vertices)
        method transform matrix = {< vertices = Array.map matrix#transform
        vertices >}
    end


let new_collection () =
    object (self : 'self)
        val mutable items = []
        method add item = items <- item :: items
        method add_multiple n matrix item =
            if n > 0 then begin
                self#add item;
                self#add_multiple (n - 1) matrix (item#transform matrix)
            end
        method draw = List.iter (fun item -> item#draw) items
        method transfrom matrix =
            {< items = List.map (fun item -> item#transfrom matrix) items >}
    end

class poly vertices =
    object
        val vertices = vertices
        method draw = Graphics.fill_poly vertices
    end

class regular_poly n radius =
    let () = assert (n > 2) in
    let vertices = Array.create n (0, 0) in
    let step = 6.28 /. float_of_int n in
    let () =
        for i = 0 to n - 1 do
            let theta = float_of_int i *.step in
            let x = int_of_float (cos theta *. radius) in
            let y = int_of_float (sin theta *. radius) in
            vertices.(i) <- (x + 100, y + 100)
        done
    in
    object
        method draw = Graphics.fill_poly vertices
    end

let () =
    Graphics.open_graph " 200x200 ";
    let p1 = new poly [|(46, 70); (54, 70); (60, 150); (40, 150)|] in
    let p2 = new poly [|(40, 40); (60, 40); (60, 60); (40, 60)|] in
    p1#draw; p2#draw;

class poly vertices =
    object (self: 'self)
        val vertices = vertices
        method draw = Graphics.fill_poly (Array.map int_coord vertices)
        method transform : 'a. (< transform : coord -> coord; .. > as 'a) ->
            'self =
                (fun matrix -> {< vertices = Array.map matrix#transform vertices
                >})
    end

class animal species =
    object (self)
        method eat = Printf.printf "A %s eats.\n" species
    end

class pet ~species ~owner ~name =
    object (self)
        inherit animal species
        method owner : string = owner
        method name : string = name
        method eat = Printf.printf "%s eats.\n" name
    end

class pet_dog ~owner ~name =
    object (self)
        inherit pet ~species:"dog" ~owner ~name as super
        method speak = Printf.printf "%s barks!\n" name
        method eat =
            Printf.printf "%s growls.\n" name;
            super#eat
    end

class type farm_animal =
    object
        inherit animal
        method owner : string
    end

class type vocal_animal =
    object
        inherit animal
        method speak : unit
    end

class cat ~name ~owner =
    object (self : 'self)
        constraint 'self = < eat : unit; speak : unit; .. >
        inherit pet ~species:"cat" ~name ~owner
        method speak = Printf.printf "%s meows.\n" name
    end

class a =
    object (self)
        method private f_private = print_string "aaa\n"
        method test_a = self#f_private
    end

class b =
    object (self)
        inherit a
        method private f_private = print_string "bbb\n"
        method test_b =
            self#test_a;
            self#f_private
    end

class c =
    object (self)
        inherit a as super
        method test_c =
            self#f_private;
            super#f_private
    end

type comparison = int
class type comparable =
    object ('self)
        method compare : 'self -> comparison
    end

class type element = object method print : unit end

class virtual collection =
    object
        method virtual length : int
    end

class virtual enumerable_collection =
    object (self : 'self)
        inherit collection
        method virtual iter : (element -> unit) -> unit
        method virtual fold : 'a. ('a -> element -> 'a) -> 'a -> 'a
        method print = self#iter (fun element -> element#print)
    end

class list_collection =
    object
        inherit enumerable_collection
        val mutable elements : element list = []
        method length = List.length elements
        method head = List.hd elements
        method add x = elements <- x :: elements
        method remove = elements <- List.tl elements
        method iter f = List.iter f elements
        method fold : 'a. ('a -> element -> 'a) -> 'a -> 'a =
            (fun f x -> List.fold_left f x elements)
    end

class array_collection size init =
    object
        val elements = Array.create size init
        method length = size
        method set i x = elements.(i) <- x
        method get i = elements.(i)
        method iter f = Array.iter f elements
        method fold : 'a. ('a -> element -> 'a) -> 'a -> 'a =
            (fun f x ->
                let rec loop i x =
                    if i = size then x else loop (i + 1) (f x elements.(i))
                in
                loop 0 x)
    end

class virtual stack =
    object (self : 'self)
        inherit collection
        method virtual push : element -> unit
        method virtual pop : element
        method dup =
            let x = self#pop in
            self#push x; self#push x
        method swap =
            let x1 = self#pop in
            let x2 = self#pop in
            self#push x1;
            self#push x2
    end

class bounded_stack size =
    let dummy = object method print = () end in
    object
        inherit stack

        val data = new array_collection size dummy
        val mutable index = 0

        method push x =
            if index = size then
                raise (Failure "stack is full");
            data#set index x;
            index <- index + 1
        method pop =
            if index = 0 then raise (Failure "stack is empty");
            index <- index - 1;
            data#get index
        method length = data#length
    end

class unbounded_stack =
    object (self : 'self)
        inherit list_collection
        inherit stack

        method push x = self#add x
        method pop =
            let x = self#head in
            self#remove;
            x
    end

type ordering = Smaller | Equal | Larger

class ['key, 'value] map (compare : 'key -> 'key -> ordering) =
    let equal key1 (key2, _) = compare key1 key2 = Equal in
    object (self : 'self)
        val elements : ('key * 'value) list = []
        method add key value = {< elements = (key, value) :: elements >}
        method find key = snd (List.find (equal key) elements)
    end

let compare_int (i : int) (j : int) =
    if i < j then Smaller
    else if i > j then Larger
    else Equal

let empty_int_map = new map compare_int

class ['key, 'value] iter_map compare =
    object
        inherit ['key, 'value] map compare
        method iter f = List.iter (fun (key, value) -> f key value) elements
    end

class type ['key, 'value] map_type =
    object ('self)
        method add : 'key -> 'value -> 'self
        method find : 'key -> 'value
    end

class type ['a] tree =
    object ('self)
        method add : 'a -> 'a tree
        method mem : 'a -> bool
    end

class ['a] node (compare : 'a -> 'a -> ordering)
(x : 'a) (l : 'a tree) (r : 'a tree) =
    object (self : 'self)
        val label = x
        val left = l
        val right = r
        method mem y =
            match compare y label with
            | Smaller -> left#mem y
            | Larger -> right#mem y
            | Equal -> true
        method add y =
            match compare y label with
            | Smaller -> {< left = left#add y >}
            | Larger -> {< right = right#add y >}
            | Equal -> self
    end

class ['a] leaf (compare : 'a -> 'a -> ordering) =
    object (self : 'self)
        method mem (_ : 'a) = false
        method add x =
            new node compare x (new leaf compare) (new leaf compare)
    end

class ['a, 'b] mut_pair (x0 : 'a) (y0 : 'b) =
    object (self : 'self)
        val mutable x = x0
        val mutable y = y0
        method set_fst x' = x <- x'
        method set_snd y' = y <- y'
        method value = x, y
    end

type (+'a, +'b) pair' = 'a * 'b
type (-'a, +'b) func = 'a -> 'b
