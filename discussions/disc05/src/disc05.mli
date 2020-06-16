val filter : ('a -> bool) -> 'a list -> 'a list
val pick: ('a -> bool) -> ('a * 'b) list -> 'b
val set : int -> 'a -> 'a list -> 'a list
val negate : ('a -> bool) -> 'a -> bool
val composes : ('a -> 'a) list -> 'a -> 'a
