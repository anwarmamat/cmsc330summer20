val join : string list -> string -> string
val list_of_option : 'a option -> 'a list
val get_first : 'a option -> 'a option -> 'a option
val match_key : 'k -> 'k * 'v -> 'v option
type ('k, 'v) dict = ('k * 'v) list
val set : ('k, 'v) dict -> 'k -> 'v -> ('k, 'v) dict
val get : ('k, 'v) dict -> 'k -> 'v option
val get_some_values : ('k, 'v) dict -> 'k list -> 'v option list
val get_values : ('k, 'v) dict -> 'k list -> 'v list
