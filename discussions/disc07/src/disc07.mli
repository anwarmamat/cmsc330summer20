type 'a lelist = Empty | Cons of 'a * int * 'a lelist
val map : ('a -> 'b) -> 'a lelist -> 'b lelist
val foldl : ('a -> 'b -> 'a) -> 'a -> 'b lelist -> 'a
val foldr : ('b -> 'a -> 'a) -> 'b lelist -> 'a -> 'a 
val find : ('a -> bool) -> 'a lelist -> 'a option
val contains : 'a lelist -> 'a -> bool
